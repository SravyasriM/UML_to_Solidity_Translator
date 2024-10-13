package org.iitp.translator.benchmark_testing;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.json.JSONObject;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;

import static org.iitp.translator.configs.Constants.*;

public class Statistics {
    public static void main(String[] args) throws IOException {
    	
        JSONObject statistics = new JSONObject(new String(Files.readAllBytes(
                Paths.get(STATISTICS_FILE_PATH))));

        
        JSONObject java_result = new JSONObject(new String(Files.readAllBytes(
                Paths.get(JAVA_CLOC_RESULT_PATH))));
        

        JSONObject solidity_result = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_CLOC_RESULT_PATH))));
        

        JSONObject execution_result = new JSONObject(new String(Files.readAllBytes(
                Paths.get(EXECUTION_RESULT_PATH))));
        

        long java_loc = java_result.getJSONObject("header").getLong("n_lines");
        long java_lines_blank = java_result.getJSONObject("SUM").getLong("blank");
        long java_lines_comment = java_result.getJSONObject("SUM").getLong("comment");

        java_loc -= java_lines_blank;
        execution_result.put("b) LOC Java (including comments)", java_loc);

        java_loc -= java_lines_comment;
        execution_result.put("c) LOC Java (excluding comments)", java_loc);

        long solidity_loc = solidity_result.getJSONObject("header").getLong("n_lines");
        long solidity_lines_blank = solidity_result.getJSONObject("SUM").getLong("blank");
        long solidity_lines_comment = solidity_result.getJSONObject("SUM").getLong("comment");

        solidity_loc -= solidity_lines_blank;
        execution_result.put("h) LOC Solidity (including comments)", solidity_loc);

        solidity_loc -= solidity_lines_comment;
        execution_result.put("i) LOC Solidity (excluding comments)", solidity_loc);

        //Writing execution results
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.configure(SerializationFeature.ORDER_MAP_ENTRIES_BY_KEYS, true);
        String stat_str = execution_result.toString();
        HashMap map = objectMapper.readValue(stat_str, HashMap.class); //For sorting keys in order
        stat_str = objectMapper.writeValueAsString(map);
        Object stat_json = objectMapper.readValue(stat_str, Object.class);
        stat_str = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(stat_json);
        Files.writeString(Paths.get(EXECUTION_RESULT_PATH), stat_str);

        //Appending the results to table
        statistics.append("table", execution_result);
        stat_str = statistics.toString();
        map = objectMapper.readValue(stat_str, HashMap.class); //For sorting keys in order
        stat_str = objectMapper.writeValueAsString(map);
        stat_json = objectMapper.readValue(stat_str, Object.class);
        stat_str = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(stat_json);
        Files.writeString(Paths.get(STATISTICS_FILE_PATH), stat_str);
    }
}
