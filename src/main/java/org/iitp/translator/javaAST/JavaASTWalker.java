package org.iitp.translator.javaAST;

import  org.iitp.translator.solidityAST.*;

import com.fasterxml.jackson.databind.ObjectMapper;

import com.fasterxml.jackson.databind.SerializationFeature;
import com.github.javaparser.StaticJavaParser;
import com.github.javaparser.ast.CompilationUnit;
import com.github.javaparser.printer.XmlPrinter;
import com.github.javaparser.printer.YamlPrinter;
import org.iitp.translator.interfaces.ASTWalker;
import org.iitp.translator.utilities.java.NodeProcessor;
import org.iitp.translator.utilities.java.NodeProcessorMapInitializer;
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

import javax.sql.rowset.spi.TransactionalWriter;

import static org.iitp.translator.configs.Constants.*;



public class JavaASTWalker implements ASTWalker {

    private final static Logger LOGGER = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);
    
    public static String outputLocation = "src/main/output_files/solidity/code/";
    
    public JavaASTWalker(String solidityVersion,String outputLocation)
    {
    	SOLIDITY_VERSION_DEFAULT  = solidityVersion;
    	if(outputLocation.isBlank())
    	{
    		
    	}
    	else
    	{
    	  JavaASTWalker.outputLocation = outputLocation;
    	}
    }
    public  JavaASTWalker(String solidityVersion)
    {
    	SOLIDITY_VERSION_DEFAULT  = solidityVersion;
    }    
    public JavaASTWalker()
    {
    	
    }
    
    public String processJavaFile(String fullFileName,String fileName) throws IOException {

        LOGGER.info("Processing Java source code has begun!");
        //Results:
        List<String> results = new ArrayList<String>();
        
        
//        if(args.length >=1)LOGGER.info(args[0]);
//        if(args.length >=2)LOGGER.info(args[1]);
        
        // TODO : CHECK WEATHER USER FILE EXISTS OR NOT
        
        String user_java_file_path = fullFileName.equals("") ? JAVA_FILE_PATH : fullFileName;
        System.out.println("FullFileName : "+fullFileName);
        results.add(fullFileName);
       // SOLIDITY_VERSION_DEFAULT = args.length >= 2 ? args[1] : SOLIDITY_VERSION_DEFAULT;
        

        JSONObject exec_result = new JSONObject(new String(Files.readAllBytes(
                Paths.get(STATISTICS_RESULT_TEMPLATE_PATH))));

        // java_file_name, linesInJava, String.format("%.2f", timeTaken), 
        String java_file_name = user_java_file_path.substring(user_java_file_path.lastIndexOf('/') + 1);
        exec_result.put("a) Java program", java_file_name);
        
        results.add(java_file_name);
        ArrayList<String> fileLines = new ArrayList<String>();
        
        File file =
        	      new File(user_java_file_path);
        	    Scanner scR = new Scanner(file);
        	    int linesInJava=0;
        	    while (scR.hasNextLine())
        	    {
        	      fileLines.add(scR.nextLine());
        	      linesInJava++;
        	    }
        
        	           
        exec_result.put("b) LOC Java (including comments)", linesInJava);
        results.add(String.valueOf(linesInJava));
        
        Runtime runtime = Runtime.getRuntime();
        long usedMemoryBefore = runtime.totalMemory() - runtime.freeMemory();
        {
            Map<String, NodeProcessor> stringNodeProcessorMap = new HashMap<>();
            NodeProcessorMapInitializer.initialize(stringNodeProcessorMap);

            JSONObject mapper = new JSONObject(new String(Files.readAllBytes(
                    Paths.get(SOLIDITY_JAVA_MAPPER_FILE_PATH))));

            double startTime = System.nanoTime(); // Calculating java code parsing time
            CompilationUnit cu = StaticJavaParser.parse(new File(user_java_file_path));
            double stopTime = System.nanoTime();
            double timeTaken = (stopTime - startTime) / 1e9;
            exec_result.put("d) Java code parsing time (seconds)", String.format("%.2f", timeTaken));
//            System.out.println(String.format("Time taken: %f seconds",timeTaken));
            
            //Printing Java AST in XML and YAML format
            results.add(String.format("%.2f", timeTaken));
            
            XmlPrinter xmlPrinter = new XmlPrinter(true);
            Files.writeString(Paths.get(JAVA_AST_XML_OUTPUT_PATH), xmlPrinter.output(cu));
            YamlPrinter yamlPrinter = new YamlPrinter(true);
            Files.writeString(Paths.get(JAVA_AST_YML_OUTPUT_PATH), yamlPrinter.output(cu));

            startTime = System.nanoTime(); // Calculating AST to AST translation time
            JSONObject solidity_ast = stringNodeProcessorMap.get(cu.getClass().getSimpleName()).
                    callRelevantMethod(stringNodeProcessorMap, cu, mapper);
            
            stopTime = System.nanoTime();
            timeTaken = (stopTime - startTime) / 1e9;
            exec_result.put("e) AST to AST translation time (seconds)", String.format("%.2f", timeTaken));
            results.add(String.format("%.2f", timeTaken));
            //Adding Pragma Directive in Solidity AST
         
          
            // Writing JSON files
            String solidity_ast_string = solidity_ast.toString();
            ObjectMapper objectMapper = new ObjectMapper();
            Object solidity_ast_json = objectMapper.readValue(solidity_ast_string, Object.class);
            solidity_ast_string = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(solidity_ast_json);
           
            
            Files.writeString(Paths.get(SOLIDITY_AST_JSON_OUTPUT_PATH), solidity_ast_string);
        }
        
        
        long usedMemoryAfter = runtime.totalMemory() - runtime.freeMemory();
        double totalUsage = (usedMemoryAfter - usedMemoryBefore) / 1e6;
        exec_result.put("g) Memory usage (MB)", String.format("%.2f", totalUsage));
        
        
        results.add(String.format("%.2f", totalUsage));

        double percent_pass = (Translator.failed_nodes * 1.0) / Translator.total_nodes;
        exec_result.put("j) Fail %", String.format("%.2f", percent_pass));

        results.add(String.format("%.2f", percent_pass));

        ObjectMapper objectMapper = new ObjectMapper();
        

        //Creating stats for Java Class
        JSONObject java_stats = new JSONObject(new String(Files.readAllBytes(
                Paths.get(STATISTICS_JAVA_TEMPLATE_PATH))));
        
//      System.out.println(java_stats.toString());
//      Scanner sc = new Scanner(System.in);
//      sc.nextLine();      
        

        String java_pkg = "";//user_java_file_path.substring(user_java_file_path.indexOf("java"),
        		//user_java_file_path.lastIndexOf('/'));

        java_stats.put("a) Package name", java_pkg);
        java_stats.put("b) Java program", java_file_name);
        java_stats.put("c) Number of classes", Translator.n_classes);
        java_stats.put("d) Number of methods", Translator.n_methods);

        //Putting current result in separate file
        String java_stats_str = java_stats.toString();
        objectMapper.configure(SerializationFeature.ORDER_MAP_ENTRIES_BY_KEYS, true);
        HashMap map = objectMapper.readValue(java_stats_str, HashMap.class); //For sorting keys in order
        java_stats_str = objectMapper.writeValueAsString(map);
        Object java_stats_json = objectMapper.readValue(java_stats_str, Object.class);
        java_stats_str = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(java_stats_json);
        Files.writeString(Paths.get(JAVA_STATISTICS_RESULT_PATH), java_stats_str);


        //Appending result in table
        JSONObject java_stats_table = new JSONObject(new String(Files.readAllBytes(
                Paths.get(JAVA_STATISTICS_FILE_PATH))));
        java_stats_table.append("table", java_stats);

        java_stats_str = java_stats_table.toString();
        objectMapper.configure(SerializationFeature.ORDER_MAP_ENTRIES_BY_KEYS, true);
        map = objectMapper.readValue(java_stats_str, HashMap.class); //For sorting keys in order
        java_stats_str = objectMapper.writeValueAsString(map);
        java_stats_json = objectMapper.readValue(java_stats_str, Object.class);
        java_stats_str = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(java_stats_json);
        Files.writeString(Paths.get(JAVA_STATISTICS_FILE_PATH), java_stats_str);
        
        String[] args = new String[3];
        args[0] = fileName;
        args[1] = SOLIDITY_VERSION_DEFAULT;
        args[2] = outputLocation;
        
        String exec_time_res_str = exec_result.toString();
        Object exec_time_res_json = objectMapper.readValue(exec_time_res_str, Object.class);
        exec_time_res_str = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(exec_time_res_json);
        Files.writeString(Paths.get(EXECUTION_RESULT_PATH), exec_time_res_str);
        
        List<String> solASTWalkerResults = SolidityASTWalker.main(args); 
        
        JSONObject exec_result1 = new JSONObject(new String(Files.readAllBytes(
                Paths.get(EXECUTION_RESULT_PATH))));
        
        String [] lines = new String[fileLines.size()];
        for(int i=0;i<fileLines.size();i++)
        {
        	lines[i] = fileLines.get(i);
        }
        
        exec_result1.put("c) LOC Java (excluding comments)", linesInJava-Translator.comments);
        results.add(3, String.valueOf(linesInJava-Translator.comments));
        results.add(4, String.valueOf(Translator.n_classes));
        results.add(5, String.valueOf(Translator.n_methods));
        
        
        exec_time_res_str = exec_result1.toString();
        exec_time_res_json = objectMapper.readValue(exec_time_res_str, Object.class);
        exec_time_res_str = objectMapper.writerWithDefaultPrettyPrinter().writeValueAsString(exec_time_res_json);
        Files.writeString(Paths.get(EXECUTION_RESULT_PATH), exec_time_res_str);
        
        results.addAll(solASTWalkerResults);
        
        //return java_stats;
        Translator.reset();
        return String.join(",", results);
    }
 
}
