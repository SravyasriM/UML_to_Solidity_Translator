package org.iitp.translator.solidityAST;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.iitp.translator.interfaces.ASTWalker;
import org.iitp.translator.javaAST.JavaASTWalker;
import org.iitp.translator.javaAST.Translator;
import org.iitp.translator.utilities.solidity.NodeProcessor;
import org.iitp.translator.utilities.solidity.NodeProcessorMapInitializer;
import org.json.JSONObject;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.logging.Logger;

import static org.iitp.translator.configs.Constants.*;

public class SolidityASTWalker implements ASTWalker {

    private final static Logger LOGGER = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);

    public static List<String> main(String[] args) throws IOException {

        LOGGER.info("Processing of Solidity AST has begun!");
        //Results;
        List<String> results = new ArrayList<String>();
        
        
        JSONObject exec_result = new JSONObject(new String(Files.readAllBytes(
                Paths.get(EXECUTION_RESULT_PATH))));

        Runtime runtime = Runtime.getRuntime();
        long usedMemoryBefore = runtime.totalMemory() - runtime.freeMemory();
        {
            Map<String, NodeProcessor> stringNodeProcessorMap = new HashMap<>();
            NodeProcessorMapInitializer.initialize(stringNodeProcessorMap);

            String solidity_ast_string = new String(Files.readAllBytes(
                    Paths.get(SOLIDITY_AST_JSON_OUTPUT_PATH)));
            JSONObject solidity_ast = new JSONObject(solidity_ast_string);

            {
                double startTime = System.nanoTime(); // Calculating java code parsing time
                {
                    String solidity_src_code_string = SolidityCodeGenerator.processSourceUnit(stringNodeProcessorMap,
                            solidity_ast, 0);
                  //  System.out.println(solidity_src_code_string);
//                    Scanner sc = new Scanner(System.in);
//                    sc.nextLine();
                  
                    String outputLocation = args[2];
                    String fileName = args[0];
                    fileName = fileName.replace(".java", ".sol");
                    File f = new File(outputLocation);
                    File file = new File(f.getAbsoluteFile().getPath()+"/"+fileName);
                    file.getParentFile().mkdirs();
                    System.out.println(f.getAbsoluteFile().getPath()+"/"+fileName);
                    
//                    Scanner sc = new Scanner(System.in);
//                    sc.nextLine();
                    
                    try
                    {
                      file.createNewFile();
                    }
                    catch(Exception e)
                    {
                	  
                    }
                    System.out.println("=======");
                    System.out.println(solidity_src_code_string);
                    System.out.println("=======");
                    String[] lines =solidity_src_code_string.toString().split("\n");
                    int sol_loc_with_comments = lines.length;
                    exec_result.put("h) LOC Solidity (including comments)", sol_loc_with_comments);
                    results.add(String.valueOf(sol_loc_with_comments));
                    
                    long sol_loc_ex_comments = lines.length - Translator.comments;
                    exec_result.put("i) LOC Solidity (excluding comments)",sol_loc_ex_comments);
                    results.add(String.valueOf(sol_loc_ex_comments));
                          
                    Files.writeString(Paths.get(f.getAbsoluteFile().getPath()+"/"+fileName), solidity_src_code_string);
                }
                double stopTime = System.nanoTime();
                double timeTaken = (stopTime - startTime) / 1e9;
                exec_result.put("f) AST to Solidity code generation time (seconds)",
                        String.format("%.2f", timeTaken));
                results.add(0, String.format("%.2f", timeTaken));
                
            }
        }
        long usedMemoryAfter = runtime.totalMemory() - runtime.freeMemory();
        double totalUsage = (usedMemoryAfter - usedMemoryBefore) / 1e6;
        totalUsage += exec_result.getDouble("g) Memory usage (MB)");
        exec_result.put("g) Memory usage (MB)", String.format("%.2f", totalUsage));
        results.add(1, String.format("%.2f", totalUsage));
        
        // Writing JSON files
        String exec_time_res_str = exec_result.toString();
        ObjectMapper objectMapper = new ObjectMapper();
        Object exec_time_res_json = objectMapper.readValue(exec_time_res_str, Object.class);
        exec_time_res_str = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(exec_time_res_json);
        Files.writeString(Paths.get(EXECUTION_RESULT_PATH), exec_time_res_str);
        return results;
    }
}