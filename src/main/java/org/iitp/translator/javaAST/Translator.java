package org.iitp.translator.javaAST;

import com.github.javaparser.ast.*;
import com.github.javaparser.ast.body.*;
import com.github.javaparser.ast.comments.BlockComment;
import com.github.javaparser.ast.comments.JavadocComment;
import com.github.javaparser.ast.comments.LineComment;
import com.github.javaparser.ast.expr.*;
import com.github.javaparser.ast.stmt.*;
import com.github.javaparser.ast.type.ArrayType;
import com.github.javaparser.ast.type.ClassOrInterfaceType;
import com.github.javaparser.ast.type.PrimitiveType;
import com.github.javaparser.ast.type.Type;
import org.iitp.translator.utilities.java.NodeProcessor;
import org.json.JSONObject;
import org.json.JSONArray;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Optional;
import java.util.Scanner;
import java.util.logging.Logger;

import static org.iitp.translator.configs.Constants.*;

public class Translator {

    private final static Logger LOGGER = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);
    public static long total_nodes;
    public static long failed_nodes;
    public static long n_methods;
    public static long n_classes;
    public static long comments;
    private static JSONObject data_type_mapping;
    private static JSONObject access_specifier_mapping;
    private static HashMap< ArrayList<String> ,Integer > constructor_signature;
    private static HashMap< Integer,ArrayList<String> > constructor_signature_rev;
    private static HashMap< Integer,ArrayList<String> > constructor_parameter_names;
    private static HashMap <Integer,JSONObject> constructor_body;
    
    private static HashMap <String,HashMap< ArrayList<String> ,Integer > > class_mapping;
    
    private static HashMap <String, ArrayList<JSONObject> > interface_mapping;
    
    private static HashMap <String, ArrayList<JSONObject> > interface_funtions;
    private static HashMap <String, ArrayList<JSONObject> > class_funtions;
    
    private static HashMap <String, ArrayList<String> > function_signature;
    
    private static HashMap <String,String> available_variables;
    
    private static ArrayList<JSONObject>import_declaration;
    private static ArrayList<JSONObject>static_functions;
    private static HashMap<String,String>static_signature;
    private static String class_name;
    private static String package_name;
    
    private static int constructor_type;
    //public static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    private static int current_id ;
    static {
        total_nodes = 0;
        failed_nodes = 0;
        n_methods = 0;
        n_classes = 0;
        comments = 0;
        constructor_type = 0;
        constructor_signature = new HashMap<ArrayList<String>,Integer>();
        constructor_signature_rev = new HashMap<Integer,ArrayList<String>>();
        constructor_parameter_names = new HashMap< Integer,ArrayList<String> >();
        constructor_body = new HashMap <Integer,JSONObject>();
        class_mapping = new  HashMap <String,HashMap< ArrayList<String> ,Integer > > ();
        interface_mapping= new  HashMap <String, ArrayList<JSONObject> >();
        interface_funtions= new  HashMap <String, ArrayList<JSONObject> >();
        class_funtions = new  HashMap <String, ArrayList<JSONObject> >();
        import_declaration = new ArrayList<JSONObject>();
        static_functions = new ArrayList<JSONObject>();
        static_signature = new HashMap<String,String>();
        current_id=0;
        package_name = "";

        try {
            data_type_mapping = new JSONObject(new String(Files.readAllBytes(
                    Paths.get(DATA_TYPE_MAPPING_PATH))));

            access_specifier_mapping = new JSONObject(new String(Files.readAllBytes(
                    Paths.get(ACCESS_SPECIFIER_MAPPING_PATH))));

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void reset() {
    	total_nodes = 0;
        failed_nodes = 0;
        n_methods = 0;
        n_classes = 0;
        comments = 0;
        constructor_type = 0;
    }
    
    public static JSONObject processImportDeclaration(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                      Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processImportDeclaration method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());


        ImportDeclaration importDeclaration = (ImportDeclaration) node;
        
       
        
        JSONObject import_directive = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(node.getClass().getSimpleName()) + ".json"))));

        if (importDeclaration.getComment().isPresent()) {
            String comment = importDeclaration.getComment().get().toString();
            comments+=comment.lines().count();
        }
        
        String importDeclarationAsString = importDeclaration.getNameAsString();
        
        importDeclarationAsString=importDeclarationAsString.replace('.', '/');
        
        
        File file= new File(JAVA_FOLDER_PATH+"/"+importDeclarationAsString);
//        System.out.println(importDeclarationAsString);
        
        import_declaration.clear();
        
        
        if(file.isDirectory())
        {
//        	System.out.println("directory");
        	
        	for(File f : file.listFiles())
        	{
        		if(f.getName().endsWith(".java")) 
        		{
        			JSONObject import_directive1 = new JSONObject(new String(Files.readAllBytes(
        	                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
        	                        mapper.getString(node.getClass().getSimpleName()) + ".json"))));
        			
        			import_directive1.put("file", remove_prefix(package_name,importDeclarationAsString + "/"+f.getName().replace(".java", ".sol")));
        			
        			import_declaration.add(import_directive1);
        		}
        	}
        }
        else
        {
        	 String file_str = importDeclarationAsString + ".sol";
             import_directive.put("file", remove_prefix(package_name,file_str));
             import_declaration.add(import_directive);
        }
        
        return import_directive;
    }

    public static JSONObject processPackageDeclaration(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                       Node node,
                                                       JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processPackageDeclaration method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        PackageDeclaration packageDeclaration = (PackageDeclaration) node;

        JSONObject single_line_comment = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(node.getClass().getSimpleName()) + ".json"))));

        String content = "package" + " " + packageDeclaration.getName().asString();
        package_name = packageDeclaration.getName().asString();
        single_line_comment.put("content", content);

        return single_line_comment;
    }
     public static JSONObject addPragmaDirective(String solidityVersion)throws  IOException {
    	
        //TODO: Implement this
    	 total_nodes++;

         LOGGER.info("addPragmaDirective method is called!");
         
       //  LOGGER.info("Node type is : " + node.getClass().getSimpleName());

         JSONObject pragma_directive = new JSONObject(new String(Files.readAllBytes(
                 Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/PragmaDirective.json"))));
         
    	 LOGGER.info("addPragmaDirective method is called!");
    	 JSONArray list = new JSONArray();
    	 list.put("solidity");
    	 int starting=0;
    	 if(solidityVersion.charAt(0)=='^')
    	 {
    		 list.put("^");
    		 starting++;
    	 }
    	 int x=0;
    	 int index=0;
    	 for(int  i = 0 ;i < solidityVersion.length() ;i++)
    	 {
    		 if(solidityVersion.charAt(i)=='.')x++;
    		 if(x==2)
    		 {
    			 index=i;
    			 break;
    		 }
    	 }
    	 String major = solidityVersion.substring(starting,index);
    	 String minor = solidityVersion.substring(index);
    	 list.put(major);
    	 list.put(minor);
    	 pragma_directive.put("id","");
    	 pragma_directive.put("literals",list);
    	 pragma_directive.put("nodeType","PragmaDirective");
    	 pragma_directive.put("src","");
         return pragma_directive;
    }

    public static JSONObject processCompilationUnit(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                    Node node,
                                                    JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processCompilationUnit method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        JSONObject solidity_ast_node = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(node.getClass().getSimpleName()) + ".json"))));
        // adding pragmaDirective
        solidity_ast_node.append("nodes", addPragmaDirective(SOLIDITY_VERSION_DEFAULT));
        
        //exploring children
        for (Node child_node :
                node.getChildNodes()) {

            try {
            	
                JSONObject solidity_child_node = stringNodeProcessorMap.get(child_node.getClass().
                        getSimpleName()).callRelevantMethod(stringNodeProcessorMap,
                        child_node, mapper);
                
                if(child_node.getClass().getSimpleName().equals("ImportDeclaration"))
                {
                	for(JSONObject j : import_declaration)
                	{
                		 solidity_ast_node.append("nodes", j);
                	}
                	//System.out.println("correct!");
                }
                else
                solidity_ast_node.append("nodes", solidity_child_node);
                
                if(solidity_child_node.get("nodeType").equals("ContractDefinition") && solidity_child_node.get("contractKind").equals("contract"))
                {
                	JSONObject library_ast_node = new JSONObject(new String(Files.readAllBytes(
                            Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                                    "ContractDefinition"+ ".json"))));
                	
                    library_ast_node.put("contractKind", "library");
                    library_ast_node.put("name", solidity_child_node.get("name")+"_Library");
                    
                    for(JSONObject j : static_functions)
                    {
                    	library_ast_node.append("nodes", j);
                    }
                     static_functions.clear();
//                    static_signature.clear();
                    solidity_ast_node.append("nodes", library_ast_node);
                }
                
            	
               
            } catch (Exception e) {
                failed_nodes++;
                LOGGER.severe("Error!: " + child_node.getClass().getSimpleName());
                e.printStackTrace();
            }
        }
        // adding constructor
        // solidity_ast_node.append("nodes",addConstructor(stringNodeProcessorMap,mapper));
        
        
//        System.out.println(constructor_signature);
//        System.out.println(constructor_parameter_names);

        return solidity_ast_node;
    }

    public static JSONObject processLineComment(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processLineComment method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        LineComment lineComment = (LineComment) node;
        JSONObject single_line_comment = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(lineComment.getClass().getSimpleName()) + ".json"))));

        single_line_comment.put("content", lineComment.getComment().toString());
        comments+=1;
//        System.out.print(comments);
//        br.readLine();
        return single_line_comment;
    }

    public static JSONObject processBlockComment(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                 Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processBlockComment method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        BlockComment blockComment = (BlockComment) node;
        JSONObject multi_line_comment = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(blockComment.getClass().getSimpleName()) + ".json"))));

        multi_line_comment.put("content", blockComment.getComment().toString());
        
        
        
        String[] lines = blockComment.getComment().toString().split("\r\n|\r|\n");
        comments+=lines.length;

//        System.out.print(comments);
//        br.readLine();
        
        /*
        Scanner sc= new Scanner(System.in);
        System.out.println(blockComment.getComment().toString());
        System.out.println(lines.length);
        sc.nextLine();
        */
        
        
        return multi_line_comment;
    }

    public static JSONObject processJavadocComment(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                   Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processJavadocComment method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        JavadocComment javadocComment = (JavadocComment) node;
        JSONObject multi_line_comment = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(node.getClass().getSimpleName()) + ".json"))));

        multi_line_comment.put("content", javadocComment.getComment().toString());
        
        String[] lines =javadocComment.getComment().toString().split("\r\n|\r|\n");
        comments+=lines.length;

//        System.out.print(comments);
//        br.readLine();
        return multi_line_comment;
    }

    public static JSONObject processClassOrInterfaceDeclaration(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                                Node node, JSONObject mapper) throws IOException {

        total_nodes++;
        n_classes++;

        LOGGER.info("processClassOrInterfaceDeclaration method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());
        
        available_variables = new HashMap<String,String>();

        ClassOrInterfaceDeclaration classOrInterfaceDeclaration = (ClassOrInterfaceDeclaration) node;
        NodeList<Modifier> modifiers =classOrInterfaceDeclaration.getModifiers();
        boolean isAbstract = false;
       
        for(Modifier m : modifiers )
        {
          if(m.toString().equals("abstract "))isAbstract = true;
        
        }
        
    
        

        JSONObject contract_definition = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(node.getClass().getSimpleName()) + ".json"))));
        
//        System.out.println("abstract : " + isAbstract);
        contract_definition.put("abstract", isAbstract);

        if (classOrInterfaceDeclaration.getComment().isPresent()) {
        	String comment = classOrInterfaceDeclaration.getComment().get().toString();
            contract_definition.put("comment", comment);
            comments+=comment.lines().count();
           // System.out.println(classOrInterfaceDeclaration.getComment().get().toString());
        }

        contract_definition.put("name", classOrInterfaceDeclaration.getName());
        class_name = classOrInterfaceDeclaration.getName().toString();
        
        boolean isInterface = false;

        if (classOrInterfaceDeclaration.isInterface()) {
            contract_definition.put("contractKind", "interface");
            isInterface = true;
        } else {
            contract_definition.put("contractKind", "contract");
        }

        //setting for inheritance
        NodeList<ClassOrInterfaceType> extended_types = classOrInterfaceDeclaration.getExtendedTypes();
        NodeList<ClassOrInterfaceType> implemented_types = classOrInterfaceDeclaration.getImplementedTypes();

        for (ClassOrInterfaceType classOrInterfaceType : extended_types) {
            JSONObject user_defined_type_name = stringNodeProcessorMap.get(classOrInterfaceType.getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, classOrInterfaceType, mapper);
            contract_definition.append("baseContracts", user_defined_type_name);
        }

        for (ClassOrInterfaceType classOrInterfaceType : implemented_types) {
            JSONObject user_defined_type_name = stringNodeProcessorMap.get(classOrInterfaceType.getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, classOrInterfaceType, mapper);
            contract_definition.append("baseContracts", user_defined_type_name);
        }
        ArrayList<JSONObject> variables_list = new ArrayList<JSONObject>();
        ArrayList<JSONObject> functions_list = new ArrayList<JSONObject>();
        ArrayList<JSONObject> functions_list_class = new ArrayList<JSONObject>();
        ArrayList<JSONObject> functions = new ArrayList<JSONObject>();
        // Exploring children
        for (Node member :
                classOrInterfaceDeclaration.getMembers()) {

            try {
                JSONObject solidity_child_node = stringNodeProcessorMap.get(member.getClass().
                        getSimpleName()).callRelevantMethod(stringNodeProcessorMap,
                        member, mapper);
                
                functions.add(solidity_child_node);
                
                boolean is=true;
                if(solidity_child_node.getString("nodeType").equals("VariableDeclaration"))
                {
                    if(isInterface)solidity_child_node.put("mutability", "immutable");
                	if(isInterface)contract_definition.append("nodes", solidity_child_node);         	
                	variables_list.add(solidity_child_node);
                	if(isInterface)is=false;
                }
                else 
                {
                   boolean isImplemented = 	solidity_child_node.getBoolean("implemented");
                   String visibility    =   solidity_child_node.getString("visibility");
                   if(isImplemented && visibility.equals("public") && isInterface)
                   {
                	   functions_list.add(solidity_child_node);
                   }
                   if(isImplemented && (isInterface == false))
                   {
                	   functions_list_class.add(solidity_child_node);
                	   
                	   JSONObject override_specifier = new JSONObject(new String(Files.readAllBytes(
                               Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                                       "OverrideSpecifier" + ".json"))));
                	   boolean override = false;
                	   
                	    for(ClassOrInterfaceType classOrInterfaceType : extended_types) 
                    	{
                   		
                           JSONObject user_defined_type_name = stringNodeProcessorMap.get(classOrInterfaceType.getClass().getSimpleName())
                                   .callRelevantMethod(stringNodeProcessorMap, classOrInterfaceType, mapper);
                           String name = user_defined_type_name.getString("name");
                           ArrayList<JSONObject> methods = class_funtions.get(name);
                           for(JSONObject j : methods)
                           {
                        	   if(functionSignature(solidity_child_node).equals(functionSignature(j)))override = true;
                           }
                   	   }
                	    for(ClassOrInterfaceType classOrInterfaceType : implemented_types) {
                    		
                            JSONObject user_defined_type_name = stringNodeProcessorMap.get(classOrInterfaceType.getClass().getSimpleName())
                                    .callRelevantMethod(stringNodeProcessorMap, classOrInterfaceType, mapper);
                            String name = user_defined_type_name.getString("name");
                            ArrayList<JSONObject> methods = class_funtions.get(name);
                            for(JSONObject j : methods)
                            {
                         	   if(functionSignature(solidity_child_node).equals(functionSignature(j)))
                         	   {
                         		   if(!j.getBoolean("implemented"))override=true;
                         	   }
                            }
                	    }
                	   
                	   if(override)solidity_child_node.put("overrides", override_specifier);
                	   
//                	   System.out.println("ovveride : "+solidity_child_node);
                   }
                }
                
                if(solidity_child_node.getString("nodeType").equals("FunctionDefinition") && solidity_child_node.getString("kind").equals("constructor"))is=false;
               
                
                if(is)contract_definition.append("nodes", solidity_child_node);
            } catch (Exception e) {
                failed_nodes++;
                LOGGER.severe("Error!: " + member.getClass().
                        getSimpleName());
                e.printStackTrace();
            }
        }
        
        if(isInterface)
        {
        	HashSet<String>variables_names = new HashSet<String>();
        	for(JSONObject j : variables_list)
        	{
        		variables_names.add(j.getString("name"));
        	}
        	for(ClassOrInterfaceType classOrInterfaceType : extended_types) 
        	{
        		
                JSONObject user_defined_type_name = stringNodeProcessorMap.get(classOrInterfaceType.getClass().getSimpleName())
                        .callRelevantMethod(stringNodeProcessorMap, classOrInterfaceType, mapper);
                String name = user_defined_type_name.getString("name");
                
                ArrayList<JSONObject> fields = interface_mapping.get(name);
                
                for(JSONObject j : fields)
                {
               	    String var_name = j.getString("name");
               	    if( variables_names.contains(var_name)==false)
               	    {
               	    	variables_list.add(j);
               	    } 
                }
            }
        	interface_mapping.put(classOrInterfaceDeclaration.getName().toString(),variables_list);
        	
        	for(ClassOrInterfaceType classOrInterfaceType : extended_types) 
        	{
        		
                JSONObject user_defined_type_name = stringNodeProcessorMap.get(classOrInterfaceType.getClass().getSimpleName())
                        .callRelevantMethod(stringNodeProcessorMap, classOrInterfaceType, mapper);
                 String name = user_defined_type_name.getString("name");
                
                ArrayList<JSONObject> methods = interface_funtions.get(name);
                
                for(JSONObject j : methods)
                {
                   boolean isPresent = false;
                   for(JSONObject j1 : functions_list)
                   {
                	   if(functionSignature(j1).equals(functionSignature(j)))isPresent=true;
                   }
               	   if(isPresent==false)
               	   {
               		functions_list.add(j);
               	    
               	   }
                }
                
                methods = class_funtions.get(name);
                for(JSONObject j : methods)
                {
                   boolean isPresent = false;
                   for(JSONObject j1 : functions)
                   {
                	   if(functionSignature(j1).equals(functionSignature(j)))isPresent=true;
                   }
                   if(isPresent==false)
               	   {
               		functions.add(j);    	    
               	   }
                }
        	}
        	interface_funtions.put(classOrInterfaceDeclaration.getName().toString(),functions_list);
        	class_funtions.put(classOrInterfaceDeclaration.getName().toString(),functions);
        	
        }
        else 
        {
        	HashSet<String>variables_names = new HashSet<String>();
        	for(JSONObject j : variables_list)
        	{
        		variables_names.add(j.getString("name"));
//        		System.out.println(j.getString("name"));
        	}    	
        	for(ClassOrInterfaceType classOrInterfaceType : implemented_types) {
        		
                 JSONObject user_defined_type_name = stringNodeProcessorMap.get(classOrInterfaceType.getClass().getSimpleName())
                         .callRelevantMethod(stringNodeProcessorMap, classOrInterfaceType, mapper);
                 String name = user_defined_type_name.getString("name");
                 
                 ArrayList<JSONObject> fields = interface_mapping.get(name);
                 
                 for(JSONObject j : fields)
                 {
                	 String var_name = j.getString("name");
                	 if( variables_names.contains(var_name)==false)
                	 {
                		 contract_definition.append("nodes", j);
                	 }
                		 
                 }
             }
        	
        	for(ClassOrInterfaceType classOrInterfaceType : implemented_types) {
        		
                JSONObject user_defined_type_name = stringNodeProcessorMap.get(classOrInterfaceType.getClass().getSimpleName())
                        .callRelevantMethod(stringNodeProcessorMap, classOrInterfaceType, mapper);
                String name = user_defined_type_name.getString("name");
                
                ArrayList<JSONObject> methods = interface_funtions.get(name);
                
                for(JSONObject j : methods)
                {
                	boolean isPresent = false;
                    for(JSONObject j1 : functions_list_class)
                    {
                 	   if(functionSignature(j1).equals(functionSignature(j)))isPresent=true;
                    }    
               	   if(isPresent==false)
               	   {
               		 contract_definition.append("nodes", j);
               		
               	   }
                }
                
                methods = class_funtions.get(name);
                for(JSONObject j : methods)
                {
                   boolean isPresent = false;
                   for(JSONObject j1 : functions)
                   {
                	   if(functionSignature(j1).equals(functionSignature(j)))isPresent=true;
                   }
                   if(isPresent==false)
               	   {
               		functions.add(j);    	    
               	   }
                }
            }
        	
        	for(ClassOrInterfaceType classOrInterfaceType : extended_types) 
        	{
        		
                JSONObject user_defined_type_name = stringNodeProcessorMap.get(classOrInterfaceType.getClass().getSimpleName())
                        .callRelevantMethod(stringNodeProcessorMap, classOrInterfaceType, mapper);
                 String name = user_defined_type_name.getString("name");
                
                ArrayList<JSONObject> methods =  class_funtions.get(name);
                for(JSONObject j : methods)
                {
                   boolean isPresent = false;
                   for(JSONObject j1 : functions)
                   {
                	   if(functionSignature(j1).equals(functionSignature(j)))isPresent=true;
                   }
                   if(isPresent==false)
               	   {
               		functions.add(j);    	    
               	   }
                }
        	}
        	
        	class_funtions.put(classOrInterfaceDeclaration.getName().toString(),functions);
        	
        }
       // adding constructor
       
       
        
        
//        JSONArray constructor_body_start = new JSONArray(new String(Files.readAllBytes(
//                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" + "ConstructorBody" + ".json"))));
//        
//        if(current_id>1)
//        {
//        for(int i =0 ;i < constructor_body_start.length()-1;i++)
//        {
//        	 contract_definition.append("nodes",constructor_body_start.get(i));
//        }
//        }
        
      
        // if number of constructor is greater than 1
        if(current_id>1)
        {
        	
        	// add first line
        	
            JSONObject variable_declaration = new JSONObject(new String(Files.readAllBytes(
                    Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                           "VariableDeclaration" + ".json"))));
            variable_declaration.put("name", "oc_id");
            variable_declaration.put("visibility", "private");
            
            JSONObject elementary_type_name= new JSONObject(new String(Files.readAllBytes(
                    Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                           "ElementaryTypeName" + ".json"))));
            elementary_type_name.put("name", "int");
            variable_declaration.put("typeName",elementary_type_name);
            contract_definition.append("nodes",variable_declaration );
            
            // add second line
            
            JSONObject variable_declaration1 = new JSONObject(new String(Files.readAllBytes(
                    Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                           "VariableDeclaration" + ".json"))));
            variable_declaration1.put("name", "oc_status");
            variable_declaration1.put("visibility", "private");
            JSONObject elementary_type_name1= new JSONObject(new String(Files.readAllBytes(
                    Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                           "ElementaryTypeName" + ".json"))));
            elementary_type_name1.put("name", "bool");
            variable_declaration1.put("typeName",elementary_type_name1);
            contract_definition.append("nodes",variable_declaration1);
            
            // add third line
            
             JSONObject function_definiton = new JSONObject(new String(Files.readAllBytes(
                    Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                            "FunctionDefinition" + ".json"))));
             
             function_definiton.put("kind", "constructor");
             function_definiton.put("visibility", "public");
             JSONObject block =  new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Block" + ".json"))));
             
             JSONObject expression_statement=  new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "ExpressionStatement" + ".json"))));
             
             JSONObject assignment = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Assignment" + ".json"))));
             assignment.put("operator", "=");
             
             JSONObject left_operator = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Identifier" + ".json"))));
             left_operator.put("name","oc_id");
             
             JSONObject right_operator = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Identifier" + ".json"))));
             right_operator.put("name","_oc_id");
             
             assignment.put("leftHandSide", left_operator);
             assignment.put("rightHandSide",right_operator);
             
             expression_statement.put("expression", assignment);
             
             block.append("statements",expression_statement);
             
             JSONObject expression_statement1=  new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "ExpressionStatement" + ".json"))));
             JSONObject assignment1 = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Assignment" + ".json"))));
             assignment1.put("operator", "=");
             
             JSONObject left_operator1 = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Identifier" + ".json"))));
             
             left_operator1.put("name","oc_status");
             JSONObject right_operator1 = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Literal" + ".json"))));
             
             right_operator1.put("value","false");
             right_operator1.put("kind","bool");
             assignment1.put("leftHandSide", left_operator1);
             assignment1.put("rightHandSide",right_operator1);
             
             expression_statement1.put("expression", assignment1);
             
             block.append("statements",expression_statement1);
             
             function_definiton.put("body", block);
             
             JSONObject parameter_list =  new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "ParameterList" + ".json"))));
             
             JSONObject variable_declaration3 = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "VariableDeclaration" + ".json"))));
             
             variable_declaration3.put("name", "_oc_id");
             variable_declaration3.put("typeName", elementary_type_name);
             
             parameter_list.append("parameters", variable_declaration3 );
             
             function_definiton.put("parameters",parameter_list );
             
          
             function_definiton.put("implemented", "true");
             contract_definition.append("nodes",function_definiton );
             
             // add fourth line
              
             JSONObject modifier_definition = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "ModifierDefinition" + ".json"))));
             
             modifier_definition.put("name", "overloadedConstructor");
             modifier_definition.put("visibility", "internal");
             modifier_definition.put("parameters",parameter_list );
             
             JSONObject block1 = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Block" + ".json"))));
             
             JSONObject expression_statement2=  new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "ExpressionStatement" + ".json"))));
             
             JSONObject function_call = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "FunctionCall" + ".json"))));
             
             
             JSONObject identifier = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Identifier" + ".json"))));
             
             identifier.put("name", "require");
             function_call.put("expression",identifier);
            
             JSONObject binary_operation = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "BinaryOperation" + ".json"))));
             
             binary_operation.put("operator", "==");
             
             JSONObject left_identifier = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Identifier" + ".json"))));
             left_identifier.put("name","oc_id");
             JSONObject right_identifier = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Identifier" + ".json"))));
             right_identifier.put("name","_oc_id");
             binary_operation.put("leftExpression",left_identifier);
             binary_operation.put("rightExpression",right_identifier );
          
             function_call.append("arguments",binary_operation);
             JSONObject literal = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Literal" + ".json"))));
             literal.put("kind", "string");
             literal.put("value", "Restricted for Overloaded Constructor");
             function_call.append("arguments",literal);
             expression_statement2.put("expression", function_call);
      
             block1.append("statements", expression_statement2);
             
             
             JSONObject expression_statement3=  new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "ExpressionStatement" + ".json"))));
             
             JSONObject function_call1 = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "FunctionCall" + ".json"))));
             
             
             JSONObject identifier1 = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Identifier" + ".json"))));
             
             identifier1.put("name", "require");
             function_call1.put("expression",identifier);
            
             JSONObject binary_operation1 = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "BinaryOperation" + ".json"))));
             
             binary_operation1.put("operator", "==");
             
             JSONObject left_identifier1 = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Identifier" + ".json"))));
             left_identifier1.put("name","oc_status");
             JSONObject right_identifier1 = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Literal" + ".json"))));
             right_identifier1.put("value","false");
             right_identifier1.put("kind",  "bool");
             binary_operation1.put("leftExpression",left_identifier1);
             binary_operation1.put("rightExpression",right_identifier1);
          
             function_call1.append("arguments",binary_operation1);
             JSONObject literal1 = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Literal" + ".json"))));
             literal1.put("kind", "string");
             literal1.put("value", "Restricted for only One Time Execution");
             function_call1.append("arguments",literal1);
             
             expression_statement3.put("expression", function_call1);
      
             block1.append("statements", expression_statement3);
             
             
             JSONObject placeholder = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "PlaceholderStatement" + ".json"))));
             block1.append("statements", placeholder);
             
             JSONObject expression_statement4=  new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "ExpressionStatement" + ".json"))));
             
             JSONObject assignment2 = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Assignment" + ".json"))));
             assignment2.put("operator", "=");
             
             JSONObject left_operator2 = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Identifier" + ".json"))));
             
             left_operator2.put("name","oc_status");
             JSONObject right_operator2 = new JSONObject(new String(Files.readAllBytes(
                     Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                             "Literal" + ".json"))));
             
             right_operator2.put("value","true");
             right_operator2.put("kind","bool");
             assignment2.put("leftHandSide", left_operator2);
             assignment2.put("rightHandSide",right_operator2);
             
             expression_statement4.put("expression", assignment2);
             
             block1.append("statements",expression_statement4);
             
             
             modifier_definition.put("body",block1);
             contract_definition.append("nodes",modifier_definition);
             
             
        }
        
       
        
        for(int i =0 ; i<current_id ; i++) {
        	JSONObject x = constructor_body.get(i);
        	if(current_id>1) x = modifyConstructor(constructor_body.get(i),i);
        	contract_definition.append("nodes",x);
        }
        
        
//        System.out.println(" rev :- "+classOrInterfaceDeclaration.getName()+constructor_signature_rev);
        
        class_mapping.put(classOrInterfaceDeclaration.getName().toString(),constructor_signature);
        
        
        constructor_signature = new HashMap<ArrayList<String>,Integer>();
        constructor_signature_rev = new HashMap<Integer,ArrayList<String>>();
        constructor_parameter_names = new HashMap< Integer,ArrayList<String> >();
        constructor_body = new HashMap <Integer,JSONObject>();
        current_id=0;
        
      

        return contract_definition;
    }

    public static JSONObject processFieldDeclaration(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                     Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processFieldDeclaration method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        FieldDeclaration fieldDeclaration = (FieldDeclaration) node;

        VariableDeclarator variableDeclarator = fieldDeclaration.getVariable(0);

        JSONObject variable_declaration = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(fieldDeclaration.getClass().getSimpleName()) + ".json"))));

        if (fieldDeclaration.getComment().isPresent()) {
        	String comment = fieldDeclaration.getComment().get().toString();
        	variable_declaration.put("comment", comment);
            comments += comment.lines().count();
        }
        String variable_name = variableDeclarator.getName().asString();
        variable_declaration.put("name",variable_name);
        variable_declaration.put("stateVariable", true);
        variable_declaration.put("storageLocation", "default");

        if (fieldDeclaration.getModifiers().isNonEmpty()) {
//            if (!fieldDeclaration.getModifiers().get(0).toString().equals("static")) {
//                variable_declaration.put("visibility", fieldDeclaration.getModifiers().get(0).toString());
//            }
        	NodeList<Modifier> modifiers = fieldDeclaration.getModifiers();
        	
        	for(Modifier m : modifiers)
        	{
        		String x =  new String(m.toString());
        		// IDK why x is coming with extra space at the end
        		if(x.equals("final "))
        		{
        			 variable_declaration.put("mutability","immutable");
        			
        		}
        		else if(x.equalsIgnoreCase("static"))
                {
                	// TODO :
                }
                else
                {
                	 variable_declaration.put("visibility",x);
                }
        	}
        	
        }

        // checking for initial value
        if (variableDeclarator.getInitializer().isPresent()) {

            try {
                JSONObject value = stringNodeProcessorMap.get(variableDeclarator.getInitializer().get().getClass().getSimpleName())
                        .callRelevantMethod(stringNodeProcessorMap, variableDeclarator.getInitializer().get(), mapper);

                variable_declaration.put("value", value);
            } catch (Exception e) {
            
                failed_nodes++;
                LOGGER.severe("Error!: " + variableDeclarator.getInitializer().get().getClass().getSimpleName());
                e.printStackTrace();
            }
        }
        JSONObject type_name = null;
        try {
        	type_name  = stringNodeProcessorMap.get(variableDeclarator.getType().getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, variableDeclarator.getType(), mapper);

            variable_declaration.put("typeName", type_name);
        } catch (Exception e) {
            failed_nodes++;
            LOGGER.severe("Error!: " + variableDeclarator.getType().getClass().getSimpleName());
            e.printStackTrace();
        }
        if(type_name!=null)
        {
           available_variables.put(variable_name,type_name.get("name").toString());
        }
        
        return variable_declaration;
    }

    public static JSONObject processVariableDeclarator(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                       Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processVariableDeclarator method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        VariableDeclarator variableDeclarator = (VariableDeclarator) node;

        JSONObject variable_declaration = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(node.getClass().getSimpleName()) + ".json"))));

        if (variableDeclarator.getComment().isPresent()) {
        	String comment = variableDeclarator.getComment().get().toString();
        	variable_declaration.put("comment", comment);
            comments += comment.lines().count();
        }

        variable_declaration.put("name", variableDeclarator.getName().asString());
        variable_declaration.put("stateVariable", true);
        variable_declaration.put("storageLocation", "default");

        // checking for initial value
        if (variableDeclarator.getInitializer().isPresent()) {

            try {
                JSONObject value = stringNodeProcessorMap.get(variableDeclarator.getInitializer().get().getClass().getSimpleName())
                        .callRelevantMethod(stringNodeProcessorMap, variableDeclarator.getInitializer().get(), mapper);

                variable_declaration.put("value", value);
            } catch (Exception e) {
                failed_nodes++;
                LOGGER.severe("Error!: " + variableDeclarator.getInitializer().get().getClass().getSimpleName());
                e.printStackTrace();
            }
        }

        JSONObject type_name = stringNodeProcessorMap.get(variableDeclarator.getType().getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, variableDeclarator.getType(), mapper);

        variable_declaration.put("typeName", type_name);
//        System.out.println("typeName : ");
//        System.out.println(type_name);
        variable_declaration.put("visibility", "internal");
        
        return variable_declaration;
    }

    public static JSONObject processMethodDeclaration(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                      Node node, JSONObject mapper) throws IOException {

        total_nodes++;
        n_methods++;

        LOGGER.info("processMethodDeclaration method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        MethodDeclaration methodDeclaration = (MethodDeclaration) node;
        String dec = methodDeclaration.getDeclarationAsString();
        boolean isStatic = false;
        if(dec.contains("static"))isStatic=true;

        JSONObject function_definition = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(node.getClass().getSimpleName()) + ".json"))));

        if (methodDeclaration.getComment().isPresent()) {
        	String comment = methodDeclaration.getComment().get().toString();
            comments += comment.lines().count();
            function_definition.put("comment", comment);
        }

        //Setting for return type
        if (!methodDeclaration.getType().asString().equals("void")) {

            JSONObject solidity_return_type = new JSONObject(new String(Files.readAllBytes(
                    Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/VariableDeclaration.json"))));

            solidity_return_type.put("visibility", "internal");

            JSONObject type_name = stringNodeProcessorMap.get(methodDeclaration.getType().getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, methodDeclaration.getType(), mapper);

            solidity_return_type.put("typeName", type_name);

            if (methodDeclaration.getType().asString().equals("String")) {
                solidity_return_type.put("storageLocation", "memory");
            }

            function_definition.getJSONObject("returnParameters").append("parameters", solidity_return_type);
        }

        function_definition.put("name", methodDeclaration.getName());
        function_definition.put("kind", "function");

        //Setting for function arguments
        NodeList<Parameter> parameterList = methodDeclaration.getParameters();
        for (Parameter parameter : parameterList) {
            JSONObject solidity_parameter = new JSONObject(new String(Files.readAllBytes(
                    Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                            mapper.getString(parameter.getClass().getSimpleName()) + ".json"))));

            solidity_parameter.put("name", parameter.getName());

            JSONObject type_name = stringNodeProcessorMap.get(parameter.getType().getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, parameter.getType(), mapper);

            solidity_parameter.put("typeName", type_name);

            if (type_name.getString("nodeType").equals("ArrayTypeName")) {
                solidity_parameter.put("storageLocation", "memory");
                available_variables.put(parameter.getName().toString(),type_name.getJSONObject("baseType").getString("name"));
                
            } else {

                solidity_parameter.put("storageLocation", "default");
                available_variables.put(parameter.getName().toString(),type_name.get("name").toString());
            }
            //System.out.println("Check");
            //System.out.println(type_name);
            
//{"src":null,"length":null,"id":null,"nodeType":"ArrayTypeName","typeDescriptions":{"typeString":null,"typeIdentifier":null},"baseType":{"comments":null,"src":null,"name":"int32","id":null,"nodeType":"ElementaryTypeName","typeDescriptions":{"typeString":null,"typeIdentifier":null}}}


            function_definition.getJSONObject("parameters").append("parameters", solidity_parameter);
        }

        // Setting Access Specifier
        if (methodDeclaration.getModifiers().isEmpty()) {
            function_definition.put("visibility", "internal");
        } else {
            String keyword = methodDeclaration.getModifiers().get(0).getKeyword().asString();
            if (keyword.equals("static")) {
                function_definition.put("visibility", "internal");
            }else if(keyword.equals("abstract")) {
            	 function_definition.put("visibility", "internal");
            }else {
                function_definition.put("visibility", access_specifier_mapping.getString(keyword));
            }
        }

        //Setting Body of Method
        if (methodDeclaration.getBody().isPresent()) {

            function_definition.put("implemented", true);
            function_definition.put("body",
                    stringNodeProcessorMap.get(methodDeclaration.getBody().get().getClass().getSimpleName()).
                            callRelevantMethod(stringNodeProcessorMap, methodDeclaration.getBody().get(), mapper));
        } else {
            function_definition.put("visibility", "external"); //for functions in interfaces
            function_definition.put("implemented", false);
        }
        if(isStatic)static_functions.add(function_definition);
        if(isStatic)
        {
        	static_signature.put(functionSignature(function_definition),class_name);
        }
        
     //   if(isStatic)
        return function_definition;
    }

    public static JSONObject processBlockStmt(Map<String, NodeProcessor> stringNodeProcessorMap,
                                              Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processBlockStmt method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());
        HashMap<String,String> temporaray_dictionary = new HashMap<String,String>();
        temporaray_dictionary.putAll(available_variables);
        
        BlockStmt blockStmt = (BlockStmt) node;
      
        JSONObject block = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(node.getClass().getSimpleName()) + ".json"))));

        if (blockStmt.getComment().isPresent()) {
        	String comment = blockStmt.getComment().get().toString();
            comments += comment.lines().count();
            block.put("comment", comment);
        }

        NodeList<Statement> statements = blockStmt.getStatements();
        for (Statement statement : statements) {
            try {
                JSONObject statement_node = stringNodeProcessorMap.get(statement.getClass().getSimpleName())
                        .callRelevantMethod(stringNodeProcessorMap, statement, mapper);
                //System.out.println(statement.getClass().getSimpleName());
                
               
                if(constructor_type!=0)
                {
                	
                     
                	
                	JSONObject expression_statement = new JSONObject(new String(Files.readAllBytes(
                             Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" + "ExpressionStatement" + ".json"))));
                	
                	JSONObject function_call = new JSONObject(new String(Files.readAllBytes(
                            Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" + "FunctionCall" + ".json"))));
                	
                	JSONObject member_access = new JSONObject(new String(Files.readAllBytes(
                            Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" + "MemberAccess" + ".json"))));
                	
                	member_access.put("memberName","constructor"+constructor_type);
                	String name = statement_node.getJSONObject("expression").getJSONArray("declarations").getJSONObject(0).get("name").toString();
                	
                	JSONObject identifier = new JSONObject(new String(Files.readAllBytes(
                            Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" + "Identifier" + ".json"))));
                	
                	identifier.put("name", name);
                	member_access.put("expression",identifier);
                	
                	JSONArray arguments = statement_node.getJSONObject("expression").getJSONObject("initialValue").getJSONArray("arguments");
                	
                	 JSONObject literal_arg = new JSONObject(new String(Files.readAllBytes(
                             Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/Literal.json"))));
                     literal_arg.put("kind", "number");
                     literal_arg.put("value", ""+constructor_type);
                     
                     JSONArray new_argument = new JSONArray();
                     new_argument.put(literal_arg);
                     statement_node.getJSONObject("expression").getJSONObject("initialValue").put("arguments", new_argument);
                     
                     block.append("statements", statement_node);
                	
                	function_call.put("expression",member_access);
                	function_call.put("arguments", arguments);
                	expression_statement.put("expression", function_call);
                	block.append("statements", expression_statement);
                	//System.out.println("cons"+statement_node.get("nodeType").toString());
                	constructor_type=0;
                	 
                }
                else
                {
                	 block.append("statements", statement_node);
                }
            } catch (Exception e) {
                failed_nodes++;
                LOGGER.severe("Error!: " + statement.getClass().getSimpleName());
                e.printStackTrace();
            }
            
        }
        
        available_variables.clear();
        available_variables.putAll(temporaray_dictionary);
        return block;
    }

    public static JSONObject processExpressionStmt(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                   Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processExpressionStmt method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        ExpressionStmt expressionStmt = (ExpressionStmt) node;

        JSONObject expression_statement = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(expressionStmt.getClass().getSimpleName()) + ".json"))));

        if (expressionStmt.getComment().isPresent()) {
        	String comment = expressionStmt.getComment().get().toString();
            comments += comment.lines().count();
            expression_statement.put("comment", comment);
        }

        try {
            JSONObject expression = stringNodeProcessorMap.get(expressionStmt.getExpression().getClass().getSimpleName()).
                    callRelevantMethod(stringNodeProcessorMap, expressionStmt.getExpression(), mapper);

            expression_statement.put("expression", expression);
        } catch (Exception e) {
            failed_nodes++;
            LOGGER.severe(expressionStmt.getExpression().getClass().getSimpleName());
            e.printStackTrace();
        }

        return expression_statement;
    }

    public static JSONObject processVariableDeclarationExpr(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                            Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processVariableDeclarationExpr method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        JSONObject variable_declaration_statement = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(node.getClass().getSimpleName()) + ".json"))));

        VariableDeclarationExpr variableDeclarationExpr = (VariableDeclarationExpr) node;

        if (variableDeclarationExpr.getComment().isPresent()) {
        	String comment = variableDeclarationExpr.getComment().get().toString();
            comments += comment.lines().count();
            variable_declaration_statement.put("comment", comment);
        }

        VariableDeclarator variableDeclarator = variableDeclarationExpr.getVariable(0);

        JSONObject variable_declaration = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(variableDeclarator.getClass().getSimpleName()) + ".json"))));
  
        String variable_name = variableDeclarator.getName().asString();
        variable_declaration.put("name",variable_name);

        // putting variable type info
        JSONObject type_name = stringNodeProcessorMap.get(variableDeclarator.getType().getClass().getSimpleName()).
                callRelevantMethod(stringNodeProcessorMap, variableDeclarator.getType(), mapper);

        if (variableDeclarator.getType().isArrayType()) {
            variable_declaration.put("storageLocation", "memory");
            if (variableDeclarator.getInitializer().isPresent()) {

                if (!variableDeclarator.getInitializer().get().isArrayCreationExpr()) {
                    int len = ((ArrayInitializerExpr) variableDeclarator.getInitializer().get()).getValues().size();

                    JSONObject literal = new JSONObject(new String(Files.readAllBytes(
                            Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/Literal.json"))));
                    literal.put("kind", "number");
                    literal.put("value", len);

                    type_name.put("length", literal);
                }
            }
        } else if (type_name.getString("name").equals("String")) {
            variable_declaration.put("storageLocation", "memory");
        } else {
            variable_declaration.put("storageLocation", "default");
        }

        // putting initial value info
        if (variableDeclarator.getInitializer().isPresent()) {

            try {
                JSONObject initial_value = null;
                if (!variableDeclarator.getInitializer().get().getClass().getSimpleName().equals("NullLiteralExpr")) {
                    initial_value = stringNodeProcessorMap.get(variableDeclarator.getInitializer().get().getClass().getSimpleName())
                            .callRelevantMethod(stringNodeProcessorMap, variableDeclarator.getInitializer().get(), mapper);
                }
                variable_declaration_statement.put("initialValue", initial_value);
            } catch (Exception e) {
                failed_nodes++;
                LOGGER.severe("Error!: " + variableDeclarator.getInitializer().get().getClass().getSimpleName());
                e.printStackTrace();
            }
        }

        variable_declaration.put("typeName", type_name);
//        System.out.println("typeName : ");
//        System.out.println(type_name);
        variable_declaration_statement.append("declarations", variable_declaration);
        String value = "";

        if (type_name.getString("nodeType").equals("ArrayTypeName")) {
            value = type_name.getJSONObject("baseType").getString("name");
            
        } else {
            value = type_name.get("name").toString();
        }
        
        available_variables.put(variable_name, value);
        
        
        
        
        return variable_declaration_statement;
    }

    public static JSONObject processPrimitiveType(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                  Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processPrimitiveType method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        PrimitiveType primitiveType = (PrimitiveType) node;

        JSONObject elementary_type_name = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(primitiveType.getClass().getSimpleName()) + ".json"))));

        if (primitiveType.getComment().isPresent()) {
        	String comment = primitiveType.getComment().get().toString();
            comments += comment.lines().count();
            elementary_type_name.put("comment", comment);
        }

        elementary_type_name.put("name", data_type_mapping.get(primitiveType.asString()));

        if (primitiveType.getType().asString().equals("double")) {
            elementary_type_name.put("comments", "//Converted from DOUBLE TYPE of Java");
        } else if (primitiveType.getType().asString().equals("float")) {
            elementary_type_name.put("comments", "//Converted from FLOAT TYPE of Java");
        }

        return elementary_type_name;
    }

    public static JSONObject processArrayType(Map<String, NodeProcessor> stringNodeProcessorMap,
                                              Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processArrayType method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        ArrayType arrayType = (ArrayType) node;

        JSONObject array_type_name = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(arrayType.getClass().getSimpleName()) + ".json"))));

        if (arrayType.getComment().isPresent()) {
        	String comment = arrayType.getComment().get().toString();
            comments += comment.lines().count();
            array_type_name.put("comment", comment);
        }

        Type type = arrayType.getComponentType();

        JSONObject type_name = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(type.getClass().getSimpleName()) + ".json"))));

        type_name.put("name", data_type_mapping.get(type.asString()));

        array_type_name.put("baseType", type_name);

        return array_type_name;
    }

    public static JSONObject processArrayCreationLevel(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                       Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processArrayCreationLevel method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        ArrayCreationLevel arrayCreationLevel = (ArrayCreationLevel) node;

        JSONObject level = null;
        if (arrayCreationLevel.getDimension().isPresent()) {
            level = stringNodeProcessorMap.get(arrayCreationLevel.getDimension().get().getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, arrayCreationLevel.getDimension().get(), mapper);
        }
        return level;
    }

    public static JSONObject processArrayCreationExpr(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                      Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processArrayCreationExpr method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        ArrayCreationExpr arrayCreationExpr = (ArrayCreationExpr) node;
        JSONObject elementType = stringNodeProcessorMap.get(arrayCreationExpr.getElementType().getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, arrayCreationExpr.getElementType(), mapper);

        JSONObject levels = stringNodeProcessorMap.get(arrayCreationExpr.getLevels().get(0).getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, arrayCreationExpr.getLevels().get(0), mapper);

        JSONObject function_call = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/FunctionCall.json"))));

        if (arrayCreationExpr.getComment().isPresent()) {
        	String comment = arrayCreationExpr.getComment().get().toString();
            comments += comment.lines().count();
            function_call.put("comment", comment);
        }

        function_call.append("arguments", levels);

        JSONObject new_expression = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/NewExpression.json"))));

        JSONObject array_type_name = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/ArrayTypeName.json"))));

        array_type_name.put("baseType", elementType);

        new_expression.put("typeName", array_type_name);

        function_call.put("expression", new_expression);

        return function_call;
    }

    public static JSONObject processArrayInitializerExpr(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                         Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processArrayInitializerExpr method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        ArrayInitializerExpr arrayInitializerExpr = (ArrayInitializerExpr) node;

        JSONObject tuple_expression = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(node.getClass().getSimpleName()) + ".json"))));

        if (arrayInitializerExpr.getComment().isPresent()) {
        	String comment = arrayInitializerExpr.getComment().get().toString();
            comments += comment.lines().count();
            tuple_expression.put("comment", comment);
        }

        for (Expression expression : arrayInitializerExpr.getValues()) {

            try {
                tuple_expression.append("components", stringNodeProcessorMap.get(expression.getClass().getSimpleName())
                        .callRelevantMethod(stringNodeProcessorMap, expression, mapper));
            } catch (Exception e) {
                failed_nodes++;
                LOGGER.severe("Error!: " + expression.getClass().getSimpleName());
                e.printStackTrace();
            }
        }

        return tuple_expression;
    }

    public static JSONObject processReturnStatement(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                    Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processReturnStatement method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        ReturnStmt returnStmt = (ReturnStmt) node;

        JSONObject solidity_return_stmt = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(node.getClass().getSimpleName()) + ".json"))));

        if (returnStmt.getComment().isPresent()) {
        	String comment = returnStmt.getComment().get().toString();
            comments += comment.lines().count();
            solidity_return_stmt.put("comment", comment);
        }

        if (returnStmt.getExpression().isPresent()) {
            Expression expression = returnStmt.getExpression().get();

            try {
                solidity_return_stmt.put("expression",
                        stringNodeProcessorMap.get(expression.getClass().getSimpleName()).callRelevantMethod(
                                stringNodeProcessorMap, expression, mapper));
            } catch (Exception e) {
                failed_nodes++;
                LOGGER.severe("Error!: " + expression.getClass().getSimpleName());
                e.printStackTrace();
            }
        }

        return solidity_return_stmt;
    }

    public static JSONObject processLiteralExpr(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processLiteralExpr method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        JSONObject solidity_literal_expr = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        "Literal" + ".json"))));
        
   

        Expression expression = (Expression) node;

        if (expression.getComment().isPresent()) {
        	String comment = expression.getComment().get().toString();
            comments += comment.lines().count();
            solidity_literal_expr.put("comment", comment);
        }
  
        switch (expression.getClass().getSimpleName()) {

            case STRING_LITERAL_EXPR:
                StringLiteralExpr stringLiteralExpr = expression.asStringLiteralExpr();
                solidity_literal_expr.put("kind", data_type_mapping.get("String"));
                solidity_literal_expr.put("value", stringLiteralExpr.getValue());
                break;

            case INTEGER_LITERAL_EXPR:
                IntegerLiteralExpr integerLiteralExpr = expression.asIntegerLiteralExpr();
                solidity_literal_expr.put("kind", "number");
                solidity_literal_expr.put("value", integerLiteralExpr.getValue());
                break;

            case BOOLEAN_LITERAL_EXPR:
                BooleanLiteralExpr booleanLiteralExpr = expression.asBooleanLiteralExpr();
                solidity_literal_expr.put("kind", "bool");
                solidity_literal_expr.put("value", booleanLiteralExpr.getValue());
                break;

            case CHAR_LITERAL_EXPR:
                CharLiteralExpr charLiteralExpr = expression.asCharLiteralExpr();
                solidity_literal_expr.put("kind", "string");
                solidity_literal_expr.put("value", charLiteralExpr.getValue());
                break;

            case DOUBLE_LITERAL_EXPR:
                DoubleLiteralExpr doubleLiteralExpr = expression.asDoubleLiteralExpr();
                solidity_literal_expr.put("kind", "number");
                String value = String.valueOf((long) (Double.parseDouble(doubleLiteralExpr.getValue())));
                solidity_literal_expr.put("value", value);
                break;
            case LONG_LITERAL_EXPR:
            	LongLiteralExpr longLiteralExpr = expression.asLongLiteralExpr();
            	solidity_literal_expr.put("kind", "number");
            	solidity_literal_expr.put("value", longLiteralExpr.getValue());
            	break;
            default:
                LOGGER.severe("Literal Expression type not defined!");
        }

        return solidity_literal_expr;
    }

    public static JSONObject processNameExpr(Map<String, NodeProcessor> stringNodeProcessorMap,
                                             Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processNameExpr method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        NameExpr nameExpr = (NameExpr) node;

        JSONObject solidity_name_expr = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(node.getClass().getSimpleName()) + ".json"))));

        if (nameExpr.getComment().isPresent()) {
        	String comment = nameExpr.getComment().get().toString();
            comments += comment.lines().count();
            solidity_name_expr.put("comment", comment);
        }

        String variable_name = nameExpr.getName().asString();
        solidity_name_expr.getJSONObject("typeDescriptions").put("typeString",available_variables.get(variable_name));
        solidity_name_expr.put("name",variable_name);

        return solidity_name_expr;
    }
    public static JSONObject processThisExpr(Map<String, NodeProcessor> stringNodeProcessorMap,
            Node node, JSONObject mapper) throws IOException {
    	total_nodes++;

        LOGGER.info("processThisExpr method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());
        
        ThisExpr thisExpr = (ThisExpr) node;
        JSONObject solidity_name_expr = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                		"Identifier" + ".json"))));
        
        if (thisExpr.getComment().isPresent()) {
        	String comment = thisExpr.getComment().get().toString();
            comments += comment.lines().count();
            solidity_name_expr.put("comment", comment);
        }
        solidity_name_expr.put("name",class_name);
        return solidity_name_expr;
    }
    public static JSONObject processNullLiteralExpr(Map<String, NodeProcessor> stringNodeProcessorMap,
            Node node, JSONObject mapper) throws IOException {
    	total_nodes++;

        LOGGER.info("processThisExpr method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());
        
        NullLiteralExpr thisExpr = (NullLiteralExpr) node;
        JSONObject solidity_name_expr = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                		"Identifier" + ".json"))));
        
        if (thisExpr.getComment().isPresent()) {
        	String comment = thisExpr.getComment().get().toString();
            comments += comment.lines().count();
            solidity_name_expr.put("comment", comment);
        }
        solidity_name_expr.put("name","none");
        return solidity_name_expr;
    }
 

    public static JSONObject processIfStmt(Map<String, NodeProcessor> stringNodeProcessorMap,
                                           Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processIfStmt method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        IfStmt ifStmt = (IfStmt) node;

   
        
        JSONObject if_statement = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(ifStmt.getClass().getSimpleName()) + ".json"))));

        if (ifStmt.getComment().isPresent()) {
        	String comment = ifStmt.getComment().get().toString();
            comments += comment.lines().count();
            if_statement.put("comment", ifStmt.getComment().get().toString());
        }

        Expression condition = ifStmt.getCondition();
        if_statement.put("condition", stringNodeProcessorMap.get(condition.getClass().getSimpleName()).
                callRelevantMethod(stringNodeProcessorMap, condition, mapper));

        if (ifStmt.getThenStmt()!=null) {
        	
            JSONObject block = stringNodeProcessorMap.get(ifStmt.getThenStmt().getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, ifStmt.getThenStmt(), mapper);
            
            if_statement.put("trueBody", block);
        }


        if (ifStmt.getElseStmt().isPresent()) {

            JSONObject block = stringNodeProcessorMap.get(ifStmt.getElseStmt().get().getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, ifStmt.getElseStmt().get(), mapper);
            if_statement.put("falseBody", block);
        }

        return if_statement;
    }

    public static JSONObject processBinaryExpr(Map<String, NodeProcessor> stringNodeProcessorMap,
                                               Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processBinaryExpr method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        BinaryExpr binaryExpr = (BinaryExpr) node;

        JSONObject binary_operation = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(binaryExpr.getClass().getSimpleName()) + ".json"))));

        if (binaryExpr.getComment().isPresent()) {
        	String comment = binaryExpr.getComment().get().toString();
            comments += comment.lines().count();
            binary_operation.put("comment", binaryExpr.getComment().get().toString());
        }

        binary_operation.put("operator", binaryExpr.getOperator().asString());

        try {
            JSONObject left_expr = stringNodeProcessorMap.get(binaryExpr.getLeft().getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, binaryExpr.getLeft(), mapper);

            JSONObject right_expr = stringNodeProcessorMap.get(binaryExpr.getRight().getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, binaryExpr.getRight(), mapper);

            binary_operation.put("leftExpression", left_expr);
            binary_operation.put("rightExpression", right_expr);
            
             /*
             *  x==y if x and y are strings ==> keccak256(x) ==  keccak256(y)
             */
            
//             int is = 0;
//             if(binaryExpr.getOperator().asString().equals("=="))is++;
//             if(left_expr.getString("nodeType").equals("Literal") && left_expr.getString("kind").equals("string"))is++;
//             if(left_expr.getString("nodeType").equals("Identifier") && left_expr.getJSONObject("typeDescriptions").getString("typeString").equals("String"))is++;
//             if(right_expr.getString("nodeType").equals("Literal") && right_expr.getString("kind").equals("string"))is++;
//             if(right_expr.getString("nodeType").equals("Identifier") && right_expr.getJSONObject("typeDescriptions").getString("typeString").equals("String"))is++;
//             System.out.println("Value of is : "+is);
             if(binaryExprType(binary_operation).equalsIgnoreCase("string")&& binaryExpr.getOperator().asString().equals("=="))
             {
            	 binary_operation.put("leftExpression",convertToKeccak256(left_expr));
            	 binary_operation.put("rightExpression",convertToKeccak256(right_expr));
             }
            
        } catch (Exception e) {
            failed_nodes++;
            LOGGER.severe("Error!: LeftExpr - " + binaryExpr.getLeft().getClass().getSimpleName()
                    + " :: RightExpr - " + binaryExpr.getRight().getClass().getSimpleName());
            e.printStackTrace();
        }

        return binary_operation;
    }

    public static JSONObject processUnaryExpr(Map<String, NodeProcessor> stringNodeProcessorMap,
                                              Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processUnaryExpr method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        UnaryExpr unaryExpr = (UnaryExpr) node;

        JSONObject unary_operation = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(unaryExpr.getClass().getSimpleName()) + ".json"))));

        if (unaryExpr.getComment().isPresent()) {
        	String comment = unaryExpr.getComment().get().toString();
            comments += comment.lines().count();
            unary_operation.put("comment", unaryExpr.getComment().get().toString());
        }

        unary_operation.put("operator", unaryExpr.getOperator().asString());
        unary_operation.put("prefix", unaryExpr.isPrefix());

        try {
        	//Expression expression = unaryExpr.getExpression().getClass().getSimpleName();
        	
            JSONObject sub_expr = stringNodeProcessorMap.get(unaryExpr.getExpression().getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, unaryExpr.getExpression(), mapper);


            unary_operation.put("subExpression", sub_expr);
            
        } catch (Exception e) {
            failed_nodes++;
            LOGGER.severe("Error!: " + unaryExpr.getExpression().getClass().getSimpleName());
            e.printStackTrace();
        }

        return unary_operation;
    }

    public static JSONObject processForStmt(Map<String, NodeProcessor> stringNodeProcessorMap,
                                            Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processForStmt method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        ForStmt forStmt = (ForStmt) node;

        JSONObject for_statement = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(forStmt.getClass().getSimpleName()) + ".json"))));

        if (forStmt.getComment().isPresent()) {
        	String comment = forStmt.getComment().get().toString();
            comments += comment.lines().count();
            for_statement.put("comment", forStmt.getComment().get().toString());
        }

       

       
        JSONObject empty = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        "Identifier" + ".json"))));
        
        empty.put("name", "");
       
        
        if(forStmt.getInitialization().isEmpty())
        {
            for_statement.put("initializationExpression", empty);
        }
        else 
        {
        
        Expression initialization_expression = forStmt.getInitialization().get(0);
       
        JSONObject initialization = stringNodeProcessorMap.get(initialization_expression.getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, initialization_expression, mapper);

        for_statement.put("initializationExpression", initialization);
        }
        
        if (forStmt.getCompare().isPresent()) {

            Expression condition_expression = forStmt.getCompare().get();
          
            JSONObject condition = stringNodeProcessorMap.get(condition_expression.getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, condition_expression, mapper);

            for_statement.put("condition", condition);
        }
        else {
            for_statement.put("condition", empty);

        }

        if(forStmt.getUpdate().isEmpty())
        {
        	for_statement.put("loopExpression",empty);
        }
        else
        {
        Expression update = forStmt.getUpdate().get(0);
   
        ExpressionStmt update_stmt = new ExpressionStmt(update);

        JSONObject loopExpression = stringNodeProcessorMap.get(update_stmt.getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, update_stmt, mapper);

        for_statement.put("loopExpression", loopExpression);
        }
        
        Statement body_statement = forStmt.getBody();

        JSONObject body = stringNodeProcessorMap.get(body_statement.getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, body_statement, mapper);

        //System.out.print("Method Called : "+body_statement.getClass().getSimpleName());
        for_statement.put("body", body);

        return for_statement;
    }

    public static JSONObject processWhileStmt(Map<String, NodeProcessor> stringNodeProcessorMap,
                                              Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processWhileStmt method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        WhileStmt whileStmt = (WhileStmt) node;

        JSONObject while_statement = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(whileStmt.getClass().getSimpleName()) + ".json"))));

        if (whileStmt.getComment().isPresent()) {
        	String comment = whileStmt.getComment().get().toString();
            comments += comment.lines().count();
            while_statement.put("comment", whileStmt.getComment().get().toString());
        }

        JSONObject body = stringNodeProcessorMap.get(whileStmt.getBody().getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, whileStmt.getBody(), mapper);

        JSONObject condition = stringNodeProcessorMap.get(whileStmt.getCondition().getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, whileStmt.getCondition(), mapper);

        while_statement.put("body", body);
        while_statement.put("condition", condition);

        return while_statement;
    }

    public static JSONObject processDoStmt(Map<String, NodeProcessor> stringNodeProcessorMap,
                                           Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processDoStmt method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        DoStmt doStmt = (DoStmt) node;

        JSONObject do_while_statement = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(doStmt.getClass().getSimpleName()) + ".json"))));

        if (doStmt.getComment().isPresent()) {
        	String comment = doStmt.getComment().get().toString();
            comments += comment.lines().count();
            do_while_statement.put("comment", doStmt.getComment().get().toString());
        }

        JSONObject body = stringNodeProcessorMap.get(doStmt.getBody().getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, doStmt.getBody(), mapper);

        JSONObject condition = stringNodeProcessorMap.get(doStmt.getCondition().getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, doStmt.getCondition(), mapper);

        do_while_statement.put("body", body);
        do_while_statement.put("condition", condition);

        return do_while_statement;
    }
    public static JSONObject processSwitchStmt(Map<String, NodeProcessor> stringNodeProcessorMap,
            Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processSwitchStmt method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        SwitchStmt switchStmt = (SwitchStmt) node;
        
       

        JSONObject do_while_statement = new JSONObject(new String(Files.readAllBytes(
        		Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
        				mapper.getString(switchStmt.getClass().getSimpleName()) + ".json"))));
        
        
        JSONObject block_statement =  new JSONObject(new String(Files.readAllBytes(
        		Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
        				"Block" + ".json"))));
        JSONObject literal = new JSONObject(new String(Files.readAllBytes(
        		Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
        				"Literal" + ".json"))));
        
        literal.put("kind", "bool");
        literal.put("value", "false");
        
        JSONObject variable_declaration = new JSONObject(new String(Files.readAllBytes(
        		Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
        				"VariableDeclaration" + ".json"))));
        
        //TODO:: 
        // search variable in available_variable  and then choose name
        // replace void with that name
        
        variable_declaration.put("name", "void");
        
        JSONObject elementary_type_name = new JSONObject(new String(Files.readAllBytes(
        		Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
        				"ElementaryTypeName" + ".json"))));
        elementary_type_name.put("name", "bool");
        variable_declaration.put("typeName",elementary_type_name);
        variable_declaration.getJSONObject("typeDescriptions").put("typeString", "bool");
        
        
        
        JSONObject variable_declaration_statement = new JSONObject(new String(Files.readAllBytes(
        		Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
        				"VariableDeclarationStatement" + ".json"))));
        
        variable_declaration_statement.append("declarations",variable_declaration);
        variable_declaration_statement.put("initialValue",literal);
        
        available_variables.put("void","bool");
        
        // added variable
        block_statement.append("statements",  variable_declaration_statement);
        
        JSONObject selector =  stringNodeProcessorMap.get(switchStmt.getSelector().getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, switchStmt.getSelector(), mapper);
        
        if(binaryExprType(selector).equalsIgnoreCase("string"))selector = convertToKeccak256(selector); 
        
        for(SwitchEntry switch_case :switchStmt.getEntries() )
        {
        	 JSONObject if_statement = new JSONObject(new String(Files.readAllBytes(
             		Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
             				"IfStatement" + ".json"))));
        	  
        	 NodeList<Expression> labels = switch_case.getLabels();
        	 NodeList<Statement> statements = switch_case.getStatements();
        	 
        	 JSONObject block = new JSONObject(new String(Files.readAllBytes(
 	        		Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
 	        				"Block" + ".json")))); 
        	
        	 if(labels.size()==0)
        	 {
        		 for(Statement statement : statements )
            	 {
            		 JSONObject stmt = stringNodeProcessorMap.get(statement.getClass().getSimpleName())
            				 .callRelevantMethod(stringNodeProcessorMap, statement, mapper);
            		 
            		 block.append("statements",stmt);
            	 }
        		 block_statement.append("statements", block);
        	 }
        	 else 
        	 {
        	     JSONObject label = stringNodeProcessorMap.get(switch_case.getLabels().get(0).getClass().getSimpleName())
                      .callRelevantMethod(stringNodeProcessorMap, switch_case.getLabels().get(0), mapper);
        	     
        	     if(binaryExprType(label).equalsIgnoreCase("string"))label = convertToKeccak256(label); 
        	     
        	     JSONObject binary_operation_inner = new JSONObject(new String(Files.readAllBytes(
                  		Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                  				"BinaryOperation" + ".json"))));
        	     
        	     binary_operation_inner.put("operator", "==");
        	     binary_operation_inner.put("leftExpression",selector);
        	     binary_operation_inner.put("rightExpression",label);
        	     
        	     
        	     
        	     JSONObject expression_statement = new JSONObject(new String(Files.readAllBytes(
      	        		Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
      	        				"ExpressionStatement" + ".json")))); 
        	     
        	     JSONObject assignment = new JSONObject(new String(Files.readAllBytes(
       	        		Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
       	        				"Assignment" + ".json")))); 
        	     
        	     
        	     JSONObject identifier = new JSONObject(new String(Files.readAllBytes(
        	        		Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
        	        				"Identifier" + ".json")))); 
        	     
        	     identifier.put("name", "void");
        	     identifier.getJSONObject("typeDescriptions").put("typeString","bool");
        	     JSONObject literal1 = new JSONObject(new String(Files.readAllBytes(
     	        		Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
     	        				"Literal" + ".json")))); 
        	     literal1.put("kind", "bool");
        	     literal1.put("value", "true");
        	     assignment.put("leftHandSide", identifier);
        	     assignment.put("rightHandSide", literal1);
        	     assignment.put("operator", "=");
        	     expression_statement.put("expression", assignment);
        	     
        	     block.append("statements",expression_statement);
        	     
        	     for(Statement statement : statements )
            	 {
            		 JSONObject stmt = stringNodeProcessorMap.get(statement.getClass().getSimpleName())
            				 .callRelevantMethod(stringNodeProcessorMap, statement, mapper);
            		 
            		 block.append("statements",stmt);
            	 }
        	     if_statement.put("trueBody", block);
        	     block_statement.append("statements",  if_statement);
        	     
        	     
        	     JSONObject binary_operation_outer = new JSONObject(new String(Files.readAllBytes(
                   		Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                   				"BinaryOperation" + ".json"))));
         	     
        	     binary_operation_outer.put("operator", "||");
        	     binary_operation_outer.put("leftExpression",identifier);
        	    
        	     
        	     JSONObject tuple_expression = new JSONObject(new String(Files.readAllBytes(
                    		Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                    				"TupleExpression" + ".json"))));
        	     tuple_expression.append("components",binary_operation_inner);
        	     tuple_expression.getJSONObject("typeDescriptions").put("typeString","bool");
        	     
        	     binary_operation_outer.put("rightExpression", tuple_expression);
        	     
        	     if_statement.put("condition", binary_operation_outer);
        	     
        	 }
   
        	 
        }
        
        
        
        // for entries
        
        
        
        
        do_while_statement.put("body",block_statement);
        do_while_statement.put("condition",literal);
      
        return do_while_statement;
    }
    

    public static JSONObject processMethodCallExpr(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                   Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processMethodCallExpr method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        MethodCallExpr methodCallExpr = (MethodCallExpr) node;

        NodeList<Expression> args_list = methodCallExpr.getArguments();
        String method_name = methodCallExpr.getNameAsString();
        
       
        
        Optional<Expression> scope = methodCallExpr.getScope();
        //System.out.println(scope);

        StringBuilder sb = new StringBuilder();
        sb.append(method_name);
        for (Expression arg : args_list) {
            JSONObject json_arg = stringNodeProcessorMap.get(arg.getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, arg, mapper);
            String type = binaryExprType(json_arg);
            if(type.equals("number"))
            {
             sb.append("int32");
            }
            else
            sb.append(type);
        }
        boolean isStatic = false;
        String prefix = "";
        
        for (HashMap.Entry<String,String> entry : static_signature.entrySet()) {
                 String key = entry.getKey();
                 if(key.equalsIgnoreCase(sb.toString()))
                 {
                	 isStatic = true;
                	 prefix= entry.getValue()+"_Library";
                	 
                 }
                 
        } 
        
        JSONObject function_call = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(methodCallExpr.getClass().getSimpleName()) + ".json"))));

        if (methodCallExpr.getComment().isPresent()) {
        	String comment = methodCallExpr.getComment().get().toString();
            comments += comment.lines().count();
            function_call.put("comment", methodCallExpr.getComment().get().toString());
        }

        JSONObject expression;

        if (scope.isPresent()) {
            expression = new JSONObject(new String(Files.readAllBytes(
                    Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/MemberAccess.json"))));

            JSONObject expression1 = stringNodeProcessorMap.get(scope.get().getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, scope.get(), mapper);
            expression1.put("name", scope.get());
           
            //System.out.println("Ok1 : " + expression1);
            

           
            expression.put("memberName", method_name);
            
            expression.put("expression", expression1);
        } else {
            expression = new JSONObject(new String(Files.readAllBytes(
                    Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                           "MemberAccess" + ".json"))));
            //System.out.println("Ok2 : " + expression);
//            Scanner sc = new Scanner(System.in);
//            sc.nextLine();
            expression.put("memberName", method_name);
        }

        function_call.put("expression", expression);

        for (Expression arg : args_list) {
            JSONObject json_arg = stringNodeProcessorMap.get(arg.getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, arg, mapper);
            function_call.append("arguments", json_arg);
        }
        
        return function_call;
    }

    public static JSONObject processAssignExpr(Map<String, NodeProcessor> stringNodeProcessorMap,
                                               Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processAssignExpr method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        AssignExpr assignExpr = (AssignExpr) node;

        JSONObject assignment = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(assignExpr.getClass().getSimpleName()) + ".json"))));

        if (assignExpr.getComment().isPresent()) {
        	String comment = assignExpr.getComment().get().toString();
            comments += comment.lines().count();
            assignment.put("comment", assignExpr.getComment().get().toString());
        }

        try {
            JSONObject left_expr = stringNodeProcessorMap.get(assignExpr.getTarget().getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, assignExpr.getTarget(), mapper);

            JSONObject right_expr = stringNodeProcessorMap.get(assignExpr.getValue().getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, assignExpr.getValue(), mapper);

            String operator = assignExpr.getOperator().asString();

            assignment.put("leftHandSide", left_expr);
            assignment.put("rightHandSide", right_expr);
            assignment.put("operator", operator);
        } catch (Exception e) {
            failed_nodes++;
            LOGGER.severe("Error!: LeftExpr - " + assignExpr.getTarget().getClass().getSimpleName()
                    + " :: RightExpr - " + assignExpr.getValue().getClass().getSimpleName());
            e.printStackTrace();
        }

        return assignment;
    }

    public static JSONObject processCastExpr(Map<String, NodeProcessor> stringNodeProcessorMap,
                                             Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processCastExpr method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        CastExpr castExpr = (CastExpr) node;

        JSONObject function_call = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(castExpr.getClass().getSimpleName()) + ".json"))));

        if (castExpr.getComment().isPresent()) {
        	String comment = castExpr.getComment().get().toString();
            comments += comment.lines().count();
            function_call.put("comment", castExpr.getComment().get().toString());
        }

        function_call.put("kind", "typeConversion");

        Expression expression = castExpr.getExpression();
        Type type = castExpr.getType();

        try {
            JSONObject type_obj = stringNodeProcessorMap.get(type.getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, type, mapper);

            function_call.put("expression", type_obj);

        } catch (Exception e) {
            failed_nodes++;
            LOGGER.severe("Error!: " + type.getClass().getSimpleName());
            e.printStackTrace();
        }

        try {
            JSONObject expr_obj = stringNodeProcessorMap.get(expression.getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, expression, mapper);

            function_call.append("arguments", expr_obj);
        } catch (Exception e) {
            failed_nodes++;
            LOGGER.severe("Error!: " + expression.getClass().getSimpleName());
            e.printStackTrace();
        }

        return function_call;
    }

    public static JSONObject processArrayAccessExpr(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                    Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processArrayAccessExpr method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        ArrayAccessExpr arrayAccessExpr = (ArrayAccessExpr) node;

        JSONObject index_access = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(arrayAccessExpr.getClass().getSimpleName()) + ".json"))));

        if (arrayAccessExpr.getComment().isPresent()) {
        	String comment = arrayAccessExpr.getComment().get().toString();
            comments += comment.lines().count();
            index_access.put("comment", arrayAccessExpr.getComment().get().toString());
        }

        JSONObject index_expr = stringNodeProcessorMap.get(arrayAccessExpr.getIndex().getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, arrayAccessExpr.getIndex(), mapper);

        JSONObject base_expr = stringNodeProcessorMap.get(arrayAccessExpr.getName().getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, arrayAccessExpr.getName(), mapper);

        index_access.put("baseExpression", base_expr);
        index_access.put("indexExpression", index_expr);

        return index_access;
    }

    public static JSONObject processBreakStmt(Map<String, NodeProcessor> stringNodeProcessorMap,
                                              Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processBreakStmt method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        BreakStmt breakStmt = (BreakStmt) node;

        JSONObject break_obj = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(breakStmt.getClass().getSimpleName()) + ".json"))));

        if (breakStmt.getComment().isPresent()) {
        	String comment = breakStmt.getComment().get().toString();
            comments += comment.lines().count();
            break_obj.put("comment", breakStmt.getComment().get().toString());
        }

        return break_obj;
    }

    public static JSONObject processContinueStmt(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                 Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processContinueStmt method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        ContinueStmt continueStmt = (ContinueStmt) node;

        JSONObject continue_obj = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(continueStmt.getClass().getSimpleName()) + ".json"))));

        if (continueStmt.getComment().isPresent()) {
        	String comment = continueStmt.getComment().get().toString();
            comments += comment.lines().count();
            continue_obj.put("comment", continueStmt.getComment().get().toString());
        }

        return continue_obj;
    }

    public static JSONObject processEnclosedExpr(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                 Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processEnclosedExpr method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        EnclosedExpr enclosedExpr = (EnclosedExpr) node;

        JSONObject tuple_expression = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(enclosedExpr.getClass().getSimpleName()) + ".json"))));

        if (enclosedExpr.getComment().isPresent()) {
        	String comment = enclosedExpr.getComment().get().toString();
            comments += comment.lines().count();
            tuple_expression.put("comment", enclosedExpr.getComment().get().toString());
        }

        Expression expression = enclosedExpr.getInner();

        try {
            JSONObject component = stringNodeProcessorMap.get(expression.getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, expression, mapper);

            tuple_expression.append("components", component);
        } catch (Exception e) {
            failed_nodes++;
            LOGGER.severe("Error!: " + expression.getClass().getSimpleName());
            e.printStackTrace();
        }

        return tuple_expression;
    }

    public static JSONObject processFieldAccessExpr(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                    Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processFieldAccessExpr method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        FieldAccessExpr fieldAccessExpr = (FieldAccessExpr) node;
        
        
        Expression expression = fieldAccessExpr.getScope();

        JSONObject member_access = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(fieldAccessExpr.getClass().getSimpleName()) + ".json"))));

        if (fieldAccessExpr.getComment().isPresent()) {
        	String comment = fieldAccessExpr.getComment().get().toString();
            comments += comment.lines().count();
            member_access.put("comment", fieldAccessExpr.getComment().get().toString());
        }

        try {
            JSONObject json_expr = stringNodeProcessorMap.get(expression.getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, expression, mapper);

            member_access.put("expression", json_expr);
            member_access.put("memberName", fieldAccessExpr.getName().asString());
        } catch (Exception e) {
            failed_nodes++;
            LOGGER.severe("Error!: " + expression.getClass().getSimpleName());
            e.printStackTrace();
        }

        return member_access;
    }

    public static JSONObject processForEachStmt(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processForEachStmt method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        ForEachStmt forEachStmt = (ForEachStmt) node;

        JSONObject for_loop = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(forEachStmt.getClass().getSimpleName()) + ".json"))));

        if (forEachStmt.getComment().isPresent()) {
        	String comment = forEachStmt.getComment().get().toString();
            comments += comment.lines().count();
            for_loop.put("comment", forEachStmt.getComment().get().toString());
        }

        Statement body = forEachStmt.getBody();
        Expression iterable = forEachStmt.getIterable();
        VariableDeclarationExpr variable = forEachStmt.getVariable();

        for_loop.getJSONObject("condition").getJSONObject("rightExpression").getJSONObject("expression")
                .put("name", iterable.asNameExpr().getName().asString());

        JSONObject body_obj = stringNodeProcessorMap.get(body.getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, body, mapper);

        //System.out.println(variable.getVariables().get(0).getClass().getSimpleName());
        JSONObject variableDeclaration = stringNodeProcessorMap
                .get(variable.getVariables().get(0).getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, variable.getVariables().get(0), mapper);

        JSONObject variableDeclarationStatement = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/ForEachSupportVariable.json"))));

        variableDeclarationStatement.getJSONObject("initialValue").getJSONObject("baseExpression")
                .put("name", iterable.asNameExpr().getName().asString());

        variableDeclarationStatement.append("declarations", variableDeclaration);

        JSONObject body_obj2 = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/Block.json"))));

        body_obj2.append("statements", variableDeclarationStatement);

        for (Object obj : body_obj.getJSONArray("statements")) {
            JSONObject obj1 = (JSONObject) obj;
            body_obj2.append("statements", obj1);
        }

        for_loop.put("body", body_obj2);

        return for_loop;
    }

    public static JSONObject processClassOrInterfaceType(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                         Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processClassOrInterfaceType method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        ClassOrInterfaceType classOrInterfaceType = (ClassOrInterfaceType) node;

        JSONObject user_defined_type_name = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(classOrInterfaceType.getClass().getSimpleName()) + ".json"))));

        if (classOrInterfaceType.getComment().isPresent()) {
        	String comment = classOrInterfaceType.getComment().get().toString();
            comments += comment.lines().count();
            user_defined_type_name.put("comment", classOrInterfaceType.getComment().get().toString());
        }

        user_defined_type_name.put("name", classOrInterfaceType.getName().asString());

        return user_defined_type_name;
    }

    public static JSONObject processObjectCreationExpr(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                       Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processObjectCreationExpr method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        ObjectCreationExpr objectCreationExpr = (ObjectCreationExpr) node;

        JSONObject function_call = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(objectCreationExpr.getClass().getSimpleName()) + ".json"))));

        if (objectCreationExpr.getComment().isPresent()) {
        	String comment = objectCreationExpr.getComment().get().toString();
            comments += comment.lines().count();
            function_call.put("comment", objectCreationExpr.getComment().get().toString());
        }

        ClassOrInterfaceType classOrInterfaceType = objectCreationExpr.getType();

        JSONObject user_defined_type_name = stringNodeProcessorMap.get(classOrInterfaceType.getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, classOrInterfaceType, mapper);

        JSONObject new_expression = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/NewExpression.json"))));

        new_expression.put("typeName", user_defined_type_name);

        function_call.put("expression", new_expression);

        NodeList<Expression> arguments = objectCreationExpr.getArguments();
        
        JSONArray arguments_array = new  JSONArray();
        
        ArrayList<String> types = new ArrayList<String>();
        
        for (Expression expression : arguments) {

            try {
           
                JSONObject argument = stringNodeProcessorMap.get(expression.getClass().getSimpleName())
                        .callRelevantMethod(stringNodeProcessorMap, expression, mapper);
                
                 //System.out.println("arguments : ");
                 
                 //System.out.println(argument);
                 function_call.append("arguments", argument);
                 
                 if (argument.get("nodeType").toString().equals("BinaryOperation"))
                 {
                	 String binaryType = binaryExprType(argument);
                	 
                	 if( binaryType.equals("number"))
                	 {
                		 binaryType  = "int32";
                	 }
                	 else  if( binaryType.equals("string"))
                	 { 
                		 binaryType  = "String";
                	 }
                	 
                	 types.add(binaryType);
                 }
                 else if(argument.get("nodeType").toString().equals("Literal"))
                 {
                	 if(argument.get("kind").toString().equals("number"))
                	 {
                		 types.add("int32");
                	 }
                	 else  if(argument.get("kind").toString().equals("bool"))
                	 { 
                		 types.add("bool");
                	 }
                	 else {
                		 types.add("String");
                	 }
                 }
                 else if(argument.get("nodeType").toString().equals("Identifier"))
                 {
//                	   Scanner sc = new Scanner(System.in);
//                	   System.out.println(argument);
//                	   sc.nextLine();
                	   if(argument.getJSONObject("typeDescriptions").has("typeString"))
                	   types.add(argument.getJSONObject("typeDescriptions").get("typeString").toString());
                 }
                
              
                 arguments_array.put(argument);
                                 
                
            } catch (Exception e) {
                failed_nodes++;
                LOGGER.severe("Error!: " + expression.getClass().getSimpleName());
                e.printStackTrace();
            }
        }
        
      //  System.out.println("typescons"+types);
        
        if(class_mapping.get(user_defined_type_name.get("name").toString()).size()>1)
        constructor_type=class_mapping.get(user_defined_type_name.get("name").toString()).get(types)+1;
       
        
        
        return function_call;
    }

    public static JSONObject processConstructorDeclaration(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                           Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processConstructorDeclaration method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        ConstructorDeclaration constructorDeclaration = (ConstructorDeclaration) node;

        JSONObject function_definition = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(constructorDeclaration.getClass().getSimpleName()) + ".json"))));
        
      //  System.out.println(mapper.getString(constructorDeclaration.getClass().getSimpleName()) + ".json");

        if (constructorDeclaration.getComment().isPresent()) {
        	String comment = constructorDeclaration.getComment().get().toString();
            comments += comment.lines().count();
            function_definition.put("comment", constructorDeclaration.getComment().get().toString());
        }

        function_definition.put("kind", "constructor");
        function_definition.put("implemented", true);

        BlockStmt body = constructorDeclaration.getBody();
        NodeList<Parameter> parameters = constructorDeclaration.getParameters();

        JSONObject json_body = stringNodeProcessorMap.get(body.getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, body, mapper);

        function_definition.put("body", json_body);

        //processing parameters
        JSONObject json_parameters = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/ParameterList.json"))));

        ArrayList<String>types = new ArrayList<String>();
        ArrayList<String>names = new ArrayList<String>();
        
        for (Parameter parameter : parameters) {

            JSONObject variable_declaration = stringNodeProcessorMap.get(parameter.getClass().getSimpleName())
                    .callRelevantMethod(stringNodeProcessorMap, parameter, mapper);
            
            names.add(variable_declaration.get("name").toString());
            types.add(variable_declaration.getJSONObject("typeName").get("name").toString());
//            System.out.println(variable_declaration.getJSONObject("typeDescriptions").get("typeString"));
//            System.out.println(variable_declaration.getJSONObject("typeDescriptions").get("typeIdentifier"));
//            System.out.println(variable_declaration.getJSONObject("typeName").get("name").toString());
            json_parameters.append("parameters", variable_declaration);
        }
        
        constructor_signature.put(types, current_id);
        constructor_signature_rev.put(current_id,types);
        
        constructor_parameter_names.put(current_id, names);
       
        
        
        

        function_definition.put("parameters", json_parameters);

        //processing modifiers
        if (constructorDeclaration.getModifiers().isEmpty()) {
            function_definition.put("visibility", "internal");
        } else {
            Modifier modifier = constructorDeclaration.getModifiers().get(0);
            String visibility = access_specifier_mapping.getString(modifier.getKeyword().asString());
            function_definition.put("visibility", visibility);
        }
        
        constructor_body.put(current_id,function_definition);
        current_id++;
      
        return function_definition;
        
//        return new JSONObject(new String(Files.readAllBytes(
//                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
//                       "Block" + ".json"))));
    }
    
    
//    public static JSONObject addConstructor(Map<String, NodeProcessor> stringNodeProcessorMap, JSONObject mapper) throws IOException {
//    	  total_nodes++;
//
//          LOGGER.info("addConstructor method is called!");
//
//          JSONObject function_definition = new JSONObject(new String(Files.readAllBytes(
//                  Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" + "ConstructorDefinitionNew" + ".json"))));
//          
//          JSONObject block = new JSONObject(new String(Files.readAllBytes(
//                  Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" + "Block" + ".json"))));
//          
//          System.out.println(current_id);
//          
//          for(int i = 0; i < current_id ;i++)
//          {
//        	  JSONObject if_statement = new JSONObject(new String(Files.readAllBytes(
//                      Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" + "IfStatement" + ".json")))); 
//        	  
//        	  JSONObject condition = new JSONObject(new String(Files.readAllBytes(
//                      Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" + "ConditionNew" + ".json"))));
//        	  
//        	  JSONObject right_expression = condition.getJSONObject("rightExpression");
//        	  right_expression.put("value", i+"");
//        	  
//        	  condition.put("rightExpression",right_expression);
//        	  
//        	  if_statement.put("condition",condition);
//        	  
//        	  // add statements in front
//        	  
//        	 
//      
//
//        	  JSONObject block_of_constructor = new JSONObject(new String(Files.readAllBytes(
//                      Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" + "Block" + ".json"))));
//        	  
//        	  
//        	  // Adding declarations in the begining
//        	  for(int  j = 0 ;j < constructor_parameter_names.get(i).size();j++)
//        	  {
//        		  JSONObject variable_declaration_new = new JSONObject(new String(Files.readAllBytes(
//                          Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" + "VariableDeclarationStatementNew"+ ".json"))));
//        		  
//        		  String name= constructor_parameter_names.get(i).get(j);
//        		  String typeName = constructor_signature_rev.get(i).get(j);
//        		  System.out.println(name);
//        		  JSONArray declaration = variable_declaration_new.getJSONArray("declarations");
//        		  JSONObject zeroth_obj = declaration.getJSONObject(0);
//        		  zeroth_obj.put("name", name);
//        		  
//        		  if(typeName.equals("String"))
//        		  {
//        			  zeroth_obj.put("storageLocation", "memory");
//        		  }
//        		  
//        		  zeroth_obj.getJSONObject("typeName").put("name", typeName);
//        		  
//        		  
//        		  declaration.remove(0);
//        		  declaration.put(zeroth_obj);
//        		  variable_declaration_new.put("declarations", declaration);
//        		  block_of_constructor.append("statements",variable_declaration_new);
//        	  }
//        	  
//        
//        	  
//        	  JSONArray blockStatements = constructor_body.get(i).getJSONArray("statements");
//        	  
//        	  for(int j = 0 ;j < blockStatements.length();j++)
//        	  {
//        		  block_of_constructor.append("statements",blockStatements.get(j));
//        	  }
//        	 
//        	  if_statement.put("trueBody",block_of_constructor);
//        	  
//        	  
//        	  block.append("statements", if_statement);
//        	  
//          }
//          function_definition.put("body",block);
//             
//    	 return function_definition;
//    }
    
    public static JSONObject modifyConstructor (JSONObject constructor_body,int i) throws IOException{
    	
    	constructor_body.put("kind", "function");
    	constructor_body.put("name", "constructor"+(i+1));
    	
    	JSONObject modifier_invocation = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        "ModifierInvocation" + ".json"))));
    	JSONObject modifier_name = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        "Identifier" + ".json"))));
    	
    	
    	modifier_name.put("name", "overloadedConstructor");
    	
    	modifier_invocation.put("modifierName", modifier_name);
    	
    	JSONObject literal = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" + "Literal" + ".json"))));
    	
    	literal.put("value",""+(i+1));
    	literal.put("kind", "number");
    	modifier_invocation.append("arguments", literal);
    	
    	
    	constructor_body.append("modifiers", modifier_invocation);
    	
    	return constructor_body;
    }
    
    public static JSONObject processTryStmt(Map<String, NodeProcessor> stringNodeProcessorMap,
            Node node, JSONObject mapper) throws IOException {
    	total_nodes++;

        LOGGER.info("processTryStmt method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());
        
        TryStmt trystmt = (TryStmt) node;
        
        BlockStmt blockstmt = trystmt.getTryBlock();
        
        
        // tryBlock
        JSONObject tryBlock = stringNodeProcessorMap.get(blockstmt.getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, blockstmt, mapper);
        
//        System.out.println("blockstmt : "+tryBlock);
        
        JSONObject block = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        "Block" + ".json"))));
        
        JSONObject singlelinecomment = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        "SingleLineComment" + ".json"))));
        singlelinecomment.put("content", "try");
        block.append("statements",singlelinecomment);
        block.append("statements", tryBlock);
        
//        JSONArray tryStatements = tryBlock.getJSONArray("statements");
//        
//        for(int i =0 ;i < tryStatements.length(); i++)
//        {
//        	 block.append("statements",tryStatements.getJSONObject(i));
//        }
//        
        
        // catch blocks
        NodeList<CatchClause> catchClauses = trystmt.getCatchClauses();
        
        for(CatchClause c : catchClauses)
        {
        	JSONObject multilinecomment = new JSONObject(new String(Files.readAllBytes(
                    Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                            "MultiLineComment" + ".json"))));
        	multilinecomment.put("content", c);
            block.append("statements",multilinecomment);
        }
        
        
        // finallyBlock
        Optional<BlockStmt> finallyBlockStmt = trystmt.getFinallyBlock();
        if(finallyBlockStmt.isPresent())
        {
        	JSONObject singlelinecomment1 = new JSONObject(new String(Files.readAllBytes(
                    Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                            "SingleLineComment" + ".json"))));
        	singlelinecomment1.put("content", "finally");
            block.append("statements",singlelinecomment1);
        	
        	BlockStmt finallyBlock = finallyBlockStmt.get();
        	JSONObject finalBlockStmt = stringNodeProcessorMap.get(finallyBlock.getClass().getSimpleName())
                      .callRelevantMethod(stringNodeProcessorMap,finallyBlock, mapper);
        	  block.append("statements", finalBlockStmt);
//            JSONArray finalStatements =  finalBlockStmt.getJSONArray("statements");    
//            for(int i =0 ;i < finalStatements.length(); i++)
//            {
//            	 block.append("statements",finalStatements.getJSONObject(i));
//            }
        }
        
        return block;
    }

    
    

    public static JSONObject processParameter(Map<String, NodeProcessor> stringNodeProcessorMap,
                                              Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processParameter method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        Parameter parameter = (Parameter) node;

        JSONObject variable_declaration = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(parameter.getClass().getSimpleName()) + ".json"))));

        if (parameter.getComment().isPresent()) {
        	String comment = parameter.getComment().get().toString();
            comments += comment.lines().count();
            variable_declaration.put("comment", parameter.getComment().get().toString());
        }

        variable_declaration.put("name", parameter.getName().asString());

        JSONObject type_name = stringNodeProcessorMap.get(parameter.getType().getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, parameter.getType(), mapper);

        variable_declaration.put("typeName", type_name);
        variable_declaration.put("visibility", "internal");
        variable_declaration.put("storageLocation", "default");
        return variable_declaration;
    }

    public static JSONObject processInitializerDeclaration(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                           Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processInitializerDeclaration method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        InitializerDeclaration initializerDeclaration = (InitializerDeclaration) node;

        JSONObject function_definition = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(initializerDeclaration.getClass().getSimpleName()) + ".json"))));

        if (initializerDeclaration.getComment().isPresent()) {
        	String comment = initializerDeclaration.getComment().get().toString();
            comments += comment.lines().count();
            function_definition.put("comment", initializerDeclaration.getComment().get().toString());
        }

        function_definition.put("kind", "constructor");
        function_definition.put("implemented", true);

        BlockStmt body = initializerDeclaration.getBody();
        JSONObject json_body = stringNodeProcessorMap.get(body.getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, body, mapper);

        function_definition.put("body", json_body);
        function_definition.put("visibility", "public");

        String initializer_type = "non-static";
        if (initializerDeclaration.isStatic()) {
            initializer_type = "static";
        }
        function_definition.put("comments", "// Converted from " + initializer_type + " initializer block of Java program.");

        return function_definition;
    }

    public static JSONObject processConditionalExpr(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                    Node node, JSONObject mapper) throws IOException {

        total_nodes++;

        LOGGER.info("processConditionalExpr method is called!");
        LOGGER.info("Node type is : " + node.getClass().getSimpleName());

        ConditionalExpr conditionalExpr = (ConditionalExpr) node;

        JSONObject conditional_obj = new JSONObject(new String(Files.readAllBytes(
                Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                        mapper.getString(conditionalExpr.getClass().getSimpleName()) + ".json"))));

        if (conditionalExpr.getComment().isPresent()) {
        	String comment = conditionalExpr.getComment().get().toString();
            comments += comment.lines().count();
            conditional_obj.put("comment", conditionalExpr.getComment().get().toString());
        }

        JSONObject condition = stringNodeProcessorMap.get(conditionalExpr.getCondition().getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, conditionalExpr.getCondition(), mapper);

        JSONObject false_expr = stringNodeProcessorMap.get(conditionalExpr.getElseExpr().getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, conditionalExpr.getElseExpr(), mapper);

        JSONObject true_expr = stringNodeProcessorMap.get(conditionalExpr.getThenExpr().getClass().getSimpleName())
                .callRelevantMethod(stringNodeProcessorMap, conditionalExpr.getThenExpr(), mapper);

        conditional_obj.put("condition", condition);
        conditional_obj.put("falseExpression", false_expr);
        conditional_obj.put("trueExpression", true_expr);

        return conditional_obj;
    }
    
    // takes binaryExpression as input and return its dataType
    public static String binaryExprType(JSONObject binary_operation)
    {
//    	System.out.println("Binary_operation : " + binary_operation);
    	String ans =  "";
    	boolean isString = false;
    	while(binary_operation.getString("nodeType").equals("BinaryOperation"))
    	{
        	JSONObject right_expr = binary_operation.getJSONObject("rightExpression");
    	    if(right_expr.getString("nodeType").equals("Literal") && right_expr.getString("kind").equals("string"))isString = true;
    	    if(right_expr.getString("nodeType").equals("Identifier") && right_expr.getJSONObject("typeDescriptions").getString("typeString").equals("String"))isString = true;
    	    binary_operation = binary_operation.getJSONObject("leftExpression");
    	}
    	if(isString)return "string";
        if(binary_operation.getString("nodeType").equals("Literal")) ans = binary_operation.getString("kind");
        //TODO : Now typestring is missing from typeDescription
        // previously it was there
        if(binary_operation.getString("nodeType").equals("Identifier")) ans = binary_operation.getJSONObject("typeDescriptions").getString("typeString");
    	return ans;
    }
    
    
    // convertToKeccak256 any string expression
    public static JSONObject convertToKeccak256(JSONObject expr)throws IOException
    {
    	 JSONObject function_call_left = new JSONObject(new String(Files.readAllBytes(
                 Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                         "FunctionCall" + ".json"))));
    	 
    	 JSONObject identifier  = new JSONObject(new String(Files.readAllBytes(
                 Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                         "Identifier" + ".json"))));
    	 
    	 identifier.put("name", "keccak256");
    	 
    	 JSONObject function_call_inner = new JSONObject(new String(Files.readAllBytes(
                 Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                         "FunctionCall" + ".json"))));
    	 
    	 JSONObject identifier_inner  = new JSONObject(new String(Files.readAllBytes(
                 Paths.get(SOLIDITY_AST_JSON_SCHEMAS_PATH + "/" +
                         "Identifier" + ".json"))));
    	 
    	 identifier_inner.put("name", "abi.encode");
    	 function_call_inner.put("expression",identifier_inner);
    	 function_call_inner.append("arguments",expr);
    	 
    	 function_call_left.append("arguments", function_call_inner );
    	 
    	 function_call_left.put("expression",identifier);
    	 
    	 return  function_call_left;
    }
    
    // returns function signature 
    public static String functionSignature(JSONObject function_node) {
        StringBuilder sb =new StringBuilder();
        sb.append(function_node.get("name"));
        
        JSONObject parameters_obj = (JSONObject) function_node.optJSONObject("parameters");
        if(parameters_obj==null)return sb.toString();
        
        JSONArray parameters = parameters_obj.getJSONArray("parameters");
        
        
        for(int i = 0; i < parameters.length() ; i++)
        {
        	 JSONObject parameter = (JSONObject) parameters.getJSONObject(i).getJSONObject("typeName");
        	 if(parameter.getString("nodeType").equals("ArrayTypeName"))
        		 sb.append(parameter.getJSONObject("baseType").getString("name"));
             else
        	  sb.append(parameter.getString("name"));
        }
        
        
    	
        
        return sb.toString();
    }
    // for import statements removes prefix if prefix is package name
    public static String remove_prefix(String a,String b)
    {
    	if(a.length() > b.length())return b;
    	int len =-1;
    	
    	for(int i=0;i<a.length();i++)
    	{
    		if(a.charAt(i)!=b.charAt(i))
    		{
    		    len = i;	
    		}
    	}
    	
    	if(len!=-1)return b;
    	if(b.charAt(a.length())=='/')return b.substring(a.length()+1);
    	return b;
    }
    
    
}
