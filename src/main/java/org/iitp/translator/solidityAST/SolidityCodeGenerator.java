package org.iitp.translator.solidityAST;

import org.iitp.translator.utilities.solidity.NodeProcessor;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Map;
import java.util.Scanner;
import java.util.logging.Logger;

import static org.iitp.translator.configs.Constants.*;

public class SolidityCodeGenerator {

    private final static Logger LOGGER = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);
    public static int number_of_comments_lines =0;

    public static String processSourceUnit(Map<String, NodeProcessor> stringNodeProcessorMap,
                                           JSONObject source_unit, int tab_count) {

        LOGGER.info("processSourceUnit method is called!");
        LOGGER.info("Node type is : " + source_unit.get("nodeType"));

        StringBuilder src_code = new StringBuilder();

        try {
        	
//        	src_code.append("pragma solidity ");
//        	src_code.append(source_unit.getString("solidityVersion"));
//        	src_code.append(";\n");
        	

            if (source_unit.has("comment")) {
                if (!source_unit.isNull("comment")) {
                    src_code.append(TAB.repeat(Math.max(0, tab_count))).append(source_unit.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            for (Object node : source_unit.getJSONArray("nodes")) {
                JSONObject component = (JSONObject) node;
                if (!component.equals(null)) {
                    try {
                        src_code.append(stringNodeProcessorMap.get(component.getString("nodeType"))
                                .callRelevantMethod(stringNodeProcessorMap, (JSONObject) node, tab_count));
                        src_code.append(NEWLINE).append(NEWLINE);
                    } catch (Exception e) {
                        LOGGER.severe("Error!: " + component.getString("nodeType"));
                        e.printStackTrace();
                    }
                }
            }
        } catch (Exception e) {
            LOGGER.severe("Error!: " + source_unit.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }
    public static String processPragmaDirective(Map<String, NodeProcessor> stringNodeProcessorMap,
            JSONObject pragma_directive, int tab_count) {
    	
    	LOGGER.info("procesPragmaDirective method is called!");
        LOGGER.info("Node type is : " + pragma_directive.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));
        src_code.append("pragma ");
        JSONArray jArray = (JSONArray)pragma_directive.get("literals");
    
        try {
          src_code.append(jArray.getString(0));
          src_code.append(" ");
          for(int i =1;i< jArray.length();i++)
          {
        	  src_code.append(jArray.getString(i));
          }
          src_code.append(";");
        } catch (Exception e) {
            LOGGER.severe("Error!: " + pragma_directive.getString("nodeType"));
            e.printStackTrace();
        }
      
        

        return src_code.toString();
    	
    }

    public static String processSingleLineComment(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                  JSONObject single_line_comment, int tab_count) {

        LOGGER.info("processSingleLineComment method is called!");
        LOGGER.info("Node type is : " + single_line_comment.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {
            src_code.append("//").append(single_line_comment.getString("content")).append(NEWLINE);
        } catch (Exception e) {
            LOGGER.severe("Error!: " + single_line_comment.getString("nodeType"));
            e.printStackTrace();
        }
        number_of_comments_lines+=1;
        
        return src_code.toString();
    }
    
    /*
     * process modifier invocation
     */
    
    public static String processModifierInvocation(Map<String, NodeProcessor> stringNodeProcessorMap,
            JSONObject modifier_invocation, int tab_count) {
    	LOGGER.info("processSingleLineComment method is called!");
        LOGGER.info("Node type is : " + modifier_invocation.get("nodeType"));
        
        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));
        
       try {
            src_code.append(stringNodeProcessorMap.get(modifier_invocation.getJSONObject("modifierName").getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap,modifier_invocation.getJSONObject("modifierName"),tab_count));
            
            src_code.append("( ");
            JSONArray arguments = modifier_invocation.getJSONArray("arguments");
            for(int i = 0 ; i < arguments.length();i++)
            {
            	 src_code.append(stringNodeProcessorMap.get(arguments.getJSONObject(i).getString("nodeType"))
                         .callRelevantMethod(stringNodeProcessorMap,arguments.getJSONObject(i),tab_count));
            	 if(i!=(arguments.length()-1))
            	 {
            		 src_code.append(", ");
            	 }
            }
            src_code.append(" )");
            
            
        } catch (Exception e) {
            LOGGER.severe("Error!: " + modifier_invocation.getString("nodeType"));
            e.printStackTrace();
        }
       
        return src_code.toString();
    }
    

    public static String processMultiLineComment(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                 JSONObject multi_line_comment, int tab_count) {

        LOGGER.info("processMultiLineComment method is called!");
        LOGGER.info("Node type is : " + multi_line_comment.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {
            src_code.append("/*").append(multi_line_comment.getString("content")).append("*/").append(NEWLINE);
        } catch (Exception e) {
            LOGGER.severe("Error!: " + multi_line_comment.getString("nodeType"));
            e.printStackTrace();
        }
        String[] lines =src_code.toString().split("\r\n|\r|\n");
        
        number_of_comments_lines+= lines.length;
        
        return src_code.toString();
    }

    public static String processImportDirective(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                JSONObject import_directive, int tab_count) {

        LOGGER.info("processContractDefinition method is called!");
        LOGGER.info("Node type is : " + import_directive.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {
            src_code.append("import").append(SPACE);
            src_code.append("\"").append(import_directive.getString("file"))
                    .append("\"")
                    .append(";");
        } catch (Exception e) {
            LOGGER.severe("Error!: " + import_directive.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processContractDefinition(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                   JSONObject contract_definition, int tab_count) {

        LOGGER.info("processContractDefinition method is called!");
        LOGGER.info("Node type is : " + contract_definition.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        if(contract_definition.getBoolean("abstract"))src_code.append("abstract").append(SPACE);
        try {
            if (contract_definition.has("comment")) {
                if (!contract_definition.isNull("comment")) {
                    src_code.append(contract_definition.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }
            boolean isInterface = false; 
            if (contract_definition.getString("contractKind").equals("contract")) {
                src_code.append("contract").append(SPACE);
            } 
            else  if (contract_definition.getString("contractKind").equals("library")) {
                src_code.append("library").append(SPACE);
            }
            else {
                src_code.append("interface").append(SPACE);
                isInterface = true;
            }

            src_code.append(contract_definition.getString("name"));

            //getting inherited contracts
            if (contract_definition.getJSONArray("baseContracts").length() > 0) {

                src_code.append(SPACE).append("is");

                String prefix = "";
                for (Object object : contract_definition.getJSONArray("baseContracts")) {
                    JSONObject user_defined_type_name = (JSONObject) object;
                    String user_defined_type_name_str = stringNodeProcessorMap.get(user_defined_type_name.getString("nodeType"))
                            .callRelevantMethod(stringNodeProcessorMap, user_defined_type_name, 0);
                    src_code.append(prefix).append(SPACE).append(user_defined_type_name_str);
                    prefix = ",";
                }
            }

            src_code.append(NEWLINE);
            src_code.append(TAB.repeat(Math.max(0, tab_count)));
            src_code.append("{").append(NEWLINE);

            for (Object node : contract_definition.getJSONArray("nodes")) {
            	JSONObject node1 = (JSONObject)(node);
            	String type = ((JSONObject) node).getString("nodeType");
            	if(isInterface && type.equals("VariableDeclaration"))src_code.append("// ");
            	if(isInterface && type.equals("FunctionDefinition") &&(node1.getBoolean("implemented")==true))src_code.append("/*").append(NEWLINE);
                src_code.append(stringNodeProcessorMap.get(((JSONObject) node).getString("nodeType")).
                        callRelevantMethod(stringNodeProcessorMap, (JSONObject) node, tab_count + 1));
            	if(isInterface && type.equals("FunctionDefinition") &&(node1.getBoolean("implemented")==true))src_code.append(NEWLINE).append("*/");

                src_code.append(NEWLINE).append(NEWLINE);
            }

            src_code.append(TAB.repeat(Math.max(0, tab_count)));
            src_code.append("}");
        } catch (Exception e) {
            LOGGER.severe("Error!: " + contract_definition.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processFunctionDefinition(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                   JSONObject function_definition, int tab_count) {

        LOGGER.info("processFunctionDefinition method is called!");
        LOGGER.info("Node type is : " + function_definition.getString("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));
        
       

        try {

            if (function_definition.has("comment")) {
                if (!function_definition.isNull("comment")) {
                    src_code.append(function_definition.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            if (function_definition.get("kind").equals("constructor")) {
                src_code.append("constructor");
            } else {
                src_code.append("function").append(SPACE).append(function_definition.get("name").toString());
            }

            src_code.append("(");

            //Setting function arguments
            String prefix = "";
            for (Object object : function_definition.getJSONObject("parameters").getJSONArray("parameters")) {
                JSONObject parameter = (JSONObject) object;

                src_code.append(prefix);
                prefix = ", ";

                String parameter_string = stringNodeProcessorMap.get(parameter.getString("nodeType"))
                        .callRelevantMethod(stringNodeProcessorMap, parameter, 0);

                if (parameter_string.indexOf(';') != -1) {
                    src_code.append(parameter_string, 0, parameter_string.length() - 1);
                } else {
                    src_code.append(parameter_string);
                }
            }

            src_code.append(")").append(SPACE);
            
            if(function_definition.getBoolean("implemented")==false)
            {
            	src_code.append("virtual").append(SPACE);
            }
            else 
            {
                if(function_definition.optJSONObject("overrides")!=null)
                {
                	src_code.append("override").append(SPACE);
                }
            }
            

            src_code.append(function_definition.get("visibility"));
            
            /*
             * 
             * adding modifiers
             */
            
            JSONArray modifiers = function_definition.getJSONArray("modifiers");
            for(int i = 0; i < modifiers.length();i++)
            {
//            	 src_code.append(SPACE);
                 src_code.append(processModifierInvocation(stringNodeProcessorMap,function_definition.getJSONArray("modifiers").getJSONObject(i),tab_count));
            }
            

            JSONObject returnParameters = function_definition.getJSONObject("returnParameters");
            if (returnParameters.getJSONArray("parameters").length() != 0) {
                src_code.append(SPACE).append("returns(");

                prefix = "";
                for (Object object : returnParameters.getJSONArray("parameters")) {
                    JSONObject jsonObject = (JSONObject) object;

                    src_code.append(prefix);
                    prefix = ", ";
                    src_code.append(jsonObject.getJSONObject("typeName").getString("name"));
                }

                src_code.append(")");
            }

            if (function_definition.getBoolean("implemented")) {

                String body = stringNodeProcessorMap.get(function_definition.getJSONObject("body").getString("nodeType"))
                        .callRelevantMethod(stringNodeProcessorMap, function_definition.getJSONObject("body"),
                                tab_count + 1);

                src_code.append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count))).append("{")
                        .append(NEWLINE).append(body);
                src_code.append(TAB.repeat(Math.max(0, tab_count))).append("}");
            } else {
                src_code.append(";");
            }

            if (!function_definition.isNull("comments")) {
                src_code.append(SPACE).append(function_definition.getString("comments"));
            }
        } catch (Exception e) {
            LOGGER.severe("Error!: " + function_definition.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processBlock(Map<String, NodeProcessor> stringNodeProcessorMap,
                                      JSONObject block, int tab_count) {

        LOGGER.info("processBlock method is called!");
        LOGGER.info("Node type is : " + block.get("nodeType"));

        StringBuilder src_code = new StringBuilder();
        
     //  src_code.append(TAB.repeat(Math.max(0, tab_count))).append("{").append(NEWLINE);

        try {

            if (block.has("comment")) {
                if (!block.isNull("comment")) {
                    src_code.append(block.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count+1)));
                }
            }

            for (Object object : block.getJSONArray("statements")) {

                JSONObject statement = (JSONObject) object;

                try {
                    src_code.append(stringNodeProcessorMap.get(statement.getString("nodeType")).
                            callRelevantMethod(stringNodeProcessorMap, statement, tab_count+1));
                    src_code.append(NEWLINE);
                } catch (Exception e) {
                    LOGGER.severe("Error!: " + statement.getString("nodeType"));
                    e.printStackTrace();
                }
            }
        } catch (Exception e) {
            LOGGER.severe("Error!: " + block.getString("nodeType"));
            e.printStackTrace();
        }
        
//        src_code.append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count))).append("}");
//        src_code.append(NEWLINE);
        return src_code.toString();
    }

    public static String processVariableDeclarationStatement(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                             JSONObject variable_declaration_statement, int tab_count) {

        LOGGER.info("processVariableDeclarationStatement method is called!");
        LOGGER.info("Node type is : " + variable_declaration_statement.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {

            JSONObject variable_declaration = variable_declaration_statement.getJSONArray("declarations")
                    .getJSONObject(0);

            JSONObject type_name = variable_declaration.getJSONObject("typeName");

            String type_name_str = stringNodeProcessorMap.get(type_name.getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, type_name, 0);

            if (type_name.getString("nodeType").equals("ArrayTypeName")) {
                int idx = type_name_str.indexOf("[");
                type_name_str = type_name_str.substring(0, idx);
            }

            if (variable_declaration_statement.has("comment")) {
                if (!variable_declaration_statement.isNull("comment")) {
                    src_code.append(variable_declaration_statement.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            String var_declaration = stringNodeProcessorMap.get(variable_declaration.getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, variable_declaration, 0);

            if (var_declaration.contains(";")) {
                src_code.append(var_declaration, 0, var_declaration.length() - 1);
            } else {
                src_code.append(var_declaration);
            }

            if (!variable_declaration_statement.isNull("initialValue")) {

                JSONObject initial_value = variable_declaration_statement.getJSONObject("initialValue");
                String initial_value_string = stringNodeProcessorMap.get(initial_value.getString("nodeType"))
                        .callRelevantMethod(stringNodeProcessorMap, initial_value, 0);

                src_code.append(SPACE).append("=").append(SPACE);
                if (!type_name.getString("nodeType").equals("ArrayTypeName")) 
                {
                	// if contains new then don't typecast
                	if(initial_value_string.contains("new"))
                	{
                          if (initial_value_string.contains(";")) {
                              initial_value_string = initial_value_string.substring(0, initial_value_string.length() - 1);
                           }
                           src_code.append(initial_value_string);
                	}
                	else
                	{
                       src_code.append(type_name_str).append("(");
                       if (initial_value_string.contains(";")) {
                           initial_value_string = initial_value_string.substring(0, initial_value_string.length() - 1);
                        }
                        src_code.append(initial_value_string).append(")");
                	}
                    
                } else {
                    if (!initial_value_string.contains("new")) {
                        src_code.append("[").append(type_name_str).append("(");

                        initial_value_string = initial_value_string.substring(1); //stripping "()" from tuple expression
                        initial_value_string = initial_value_string.substring(0, initial_value_string.length() - 1);

                        int idx = initial_value_string.indexOf(',');
                        if (idx == -1) {
                            src_code.append(initial_value_string).append(")");
                        } else {
                            String first_val = initial_value_string.substring(0, idx);
                            src_code.append(first_val).append(")").append(initial_value_string.substring(idx));
                        }
                        src_code.append("]");
                    } else {
                        src_code.append(initial_value_string);
                    }
                }
            }

            if (src_code.indexOf(";") == -1) {
                src_code.append(";");
            }

            if (!type_name.isNull("comments")) {
                src_code.append(SPACE).append(type_name.getString("comments"));
            }
        } catch (Exception e) {
            LOGGER.severe("Error!: " + variable_declaration_statement.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processVariableDeclaration(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                    JSONObject variable_declaration, int tab_count) {

        LOGGER.info("processVariableDeclaration method is called!");
        LOGGER.info("Node type is : " + variable_declaration.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {

            JSONObject type_name = variable_declaration.getJSONObject("typeName");

            String type_name_str = stringNodeProcessorMap.get(type_name.getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, type_name, 0);

            if (variable_declaration.has("comment")) {
                if (!variable_declaration.isNull("comment")) {
                    src_code.append(variable_declaration.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            src_code.append(type_name_str);

            if (!variable_declaration.isNull("visibility")) {
                if (!variable_declaration.getString("visibility").equals("internal")) {
                    src_code.append(SPACE).append(variable_declaration.getString("visibility"));
                }
            }
            
            // Adding code for mutability 

            if (!variable_declaration.isNull("mutability")) {
        
                    src_code.append(SPACE).append(variable_declaration.getString("mutability"));
                
            }

            if (!variable_declaration.getString("storageLocation").equals("default")) {
                src_code.append(SPACE).append(variable_declaration.getString("storageLocation"));
            }

            src_code.append(SPACE).append(variable_declaration.getString("name"));

            if (!variable_declaration.isNull("value")) {

                if (type_name.getString("nodeType").equals("ArrayTypeName")) {
                    type_name_str = type_name_str.substring(0, type_name_str.length() - 4);
                }

                JSONObject value = variable_declaration.getJSONObject("value");

                String value_str = stringNodeProcessorMap.get(value.getString("nodeType"))
                        .callRelevantMethod(stringNodeProcessorMap, value, 0);

                src_code.append(SPACE).append("=").append(SPACE);
                if (!type_name.getString("nodeType").equals("ArrayTypeName")) {
                    src_code.append(type_name_str).append("(");
                    if (value_str.contains(";")) {
                        value_str = value_str.substring(0, value_str.length() - 1);
                    }
                    src_code.append(value_str).append(")");
                } else {
                    if (!value_str.contains("new")) {
                        src_code.append("[").append(type_name_str).append("(");
                        int idx = value_str.indexOf(',');
                        if (idx == -1) {
                            src_code.append(value_str).append(")");
                        } else {
                            String first_val = value_str.substring(0, idx);
                            src_code.append(first_val).append(")").append(value_str.substring(idx))
                                    .append("]");
                        }
                    } else {
                        src_code.append(value_str);
                    }
                }
            }

            if (src_code.indexOf(";") == -1) {
                src_code.append(";");
            }
        } catch (Exception e) {
            LOGGER.severe("Error!: " + variable_declaration.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processArrayTypeName(Map<String, NodeProcessor> stringNodeProcessorMap,
                                              JSONObject array_type_name, int tab_count) {

        LOGGER.info("processArrayTypeName method is called!");
        LOGGER.info("Node type is : " + array_type_name.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {

            if (array_type_name.has("comment")) {
                if (!array_type_name.isNull("comment")) {
                    src_code.append(array_type_name.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            JSONObject base_type = array_type_name.getJSONObject("baseType");

            String base_type_str = stringNodeProcessorMap.get(base_type.getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, base_type, 0);

            String length_str = "";

            if (!array_type_name.isNull("length")) {
                JSONObject length = array_type_name.getJSONObject("length");
                length_str = stringNodeProcessorMap.get(length.getString("nodeType"))
                        .callRelevantMethod(stringNodeProcessorMap, length, 0);
            }

            src_code.append(base_type_str).append("[").append(length_str).append("]");
        } catch (Exception e) {
            LOGGER.severe("Error!: " + array_type_name.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processElementaryTypeName(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                   JSONObject elementary_type_name, int tab_count) {

        LOGGER.info("processElementaryTypeName method is called!");
        LOGGER.info("Node type is : " + elementary_type_name.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {

            if (elementary_type_name.has("comment")) {
                if (!elementary_type_name.isNull("comment")) {
                    src_code.append(elementary_type_name.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            src_code.append(elementary_type_name.getString("name"));
        } catch (Exception e) {
            LOGGER.severe("Error!: " + elementary_type_name.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processReturn(Map<String, NodeProcessor> stringNodeProcessorMap,
                                       JSONObject return_statement, int tab_count) {

        LOGGER.info("processReturn method is called!");
        LOGGER.info("Node type is : " + return_statement.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {
            if (return_statement.has("comment")) {
                if (!return_statement.isNull("comment")) {
                    src_code.append(return_statement.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            src_code.append("return").append(SPACE);

            JSONObject expr = return_statement.getJSONObject("expression");

            String string_expr = stringNodeProcessorMap.get(expr.getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, expr, 0);

            src_code.append(string_expr);

            if (src_code.indexOf(";") == -1) {
                src_code.append(";");
            }
        } catch (Exception e) {
            LOGGER.severe("Error!: " + return_statement.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processIdentifier(Map<String, NodeProcessor> stringNodeProcessorMap,
                                           JSONObject identifier, int tab_count) {

        LOGGER.info("processIdentifier method is called!");
        LOGGER.info("Node type is : " + identifier.get("nodeType"));

        try {
            return identifier.getString("name");
        } catch (Exception e) {
            LOGGER.severe("Error!: " + identifier.getString("nodeType"));
            e.printStackTrace();
            throw e;
        }
    }

    public static String processLiteral(Map<String, NodeProcessor> stringNodeProcessorMap,
                                        JSONObject literal, int tab_count) {

        LOGGER.info("processLiteral method is called!");
        LOGGER.info("Node type is : " + literal.get("nodeType"));

        try {
            if (literal.getString("kind").equals("string")) {
                return ("\"" + literal.get("value").toString() + "\"");
            }
            String output = literal.get("value").toString();
            if(output.endsWith("L"))
            {
            	return output.substring(0,output.length()-1);
            }
            return output;
        } catch (Exception e) {
            LOGGER.severe("Error!: " + literal.getString("nodeType"));
            e.printStackTrace();
            throw e;
        }
    }

    public static String processIfStatement(Map<String, NodeProcessor> stringNodeProcessorMap,
                                            JSONObject if_statement, int tab_count) {

        LOGGER.info("processIfStatement method is called!");
        LOGGER.info("Node type is : " + if_statement.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {
            if (if_statement.has("comment")) {
                if (!if_statement.isNull("comment")) {
                    src_code.append(if_statement.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            src_code.append("if").append("(");

            String condition = stringNodeProcessorMap.get(if_statement.getJSONObject("condition").
                    getString("nodeType")).callRelevantMethod(stringNodeProcessorMap,
                    if_statement.getJSONObject("condition"), 0);

            src_code.append(condition).append(")");

            if (!if_statement.isNull("trueBody")) {

                String then_body = stringNodeProcessorMap.get(if_statement.getJSONObject("trueBody").getString("nodeType"))
                        .callRelevantMethod(stringNodeProcessorMap,
                                if_statement.getJSONObject("trueBody"), tab_count + 1);

                src_code.append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count))).append("{")
                        .append(NEWLINE).append(then_body)
                        .append(TAB.repeat(Math.max(0, tab_count))).append("}");
            } else {
                src_code.append(";");
            }

            if (!if_statement.isNull("falseBody")) {

                src_code.append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count))).append("else").append(NEWLINE)
                        .append(TAB.repeat(Math.max(0, tab_count))).append("{").append(NEWLINE);

                String else_body = stringNodeProcessorMap.get(if_statement.getJSONObject("falseBody")
                        .getString("nodeType"))
                        .callRelevantMethod(stringNodeProcessorMap, if_statement.getJSONObject("falseBody"),
                                tab_count + 1);

                src_code.append(else_body).append(TAB.repeat(Math.max(0, tab_count))).append("}").append(NEWLINE);
            }
        } catch (Exception e) {
            LOGGER.severe("Error!: " + if_statement.getString("nodeType"));
            e.printStackTrace();
        }
        return src_code.toString();
    }

    public static String processBinaryOperation(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                JSONObject binary_expression, int tab_count) {

        LOGGER.info("processBinaryOperation method is called!");
        LOGGER.info("Node type is : " + binary_expression.get("nodeType"));

        StringBuilder src_code = new StringBuilder();

        try {
            if (binary_expression.has("comment")) {
                if (!binary_expression.isNull("comment")) {
                    src_code.append(binary_expression.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            String left_operand = stringNodeProcessorMap.get(binary_expression.getJSONObject("leftExpression").getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, binary_expression.getJSONObject("leftExpression"), 0);

            String right_operand = stringNodeProcessorMap.get(binary_expression.getJSONObject("rightExpression").getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, binary_expression.getJSONObject("rightExpression"), 0);

            String operator = binary_expression.getString("operator");

            src_code.append(left_operand).append(SPACE).append(operator).append(SPACE).append(right_operand);
        } catch (Exception e) {
            LOGGER.severe("Error!: " + binary_expression.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processForStatement(Map<String, NodeProcessor> stringNodeProcessorMap,
                                             JSONObject for_statement, int tab_count) {

        LOGGER.info("processForStatement method is called!");
        LOGGER.info("Node type is : " + for_statement.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {
            if (for_statement.has("comment")) {
                if (!for_statement.isNull("comment")) {
                    src_code.append(for_statement.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            src_code.append("for(");

            JSONObject for_loop_body = for_statement.getJSONObject("body");
            JSONObject for_loop_initialization = for_statement.getJSONObject("initializationExpression");
            JSONObject for_loop_expr = for_statement.getJSONObject("loopExpression");
            JSONObject for_loop_cond = for_statement.getJSONObject("condition");

            String body = stringNodeProcessorMap.get(for_loop_body.getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, for_loop_body, tab_count + 1);

            String initial_expr = stringNodeProcessorMap.get(for_loop_initialization.getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, for_loop_initialization, 0);

            String condition = stringNodeProcessorMap.get(for_loop_cond.getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, for_loop_cond, 0);

            String update_expr = stringNodeProcessorMap.get(for_loop_expr.getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, for_loop_expr, 0);
            int temp = update_expr.length()-1;
            
            if(update_expr.charAt(temp)==';')
            	update_expr = update_expr.substring(0, temp);
            	
            src_code.append(initial_expr);

            if (src_code.indexOf(";") == -1) {
                src_code.append(";");
            }
            
            src_code.append(SPACE).append(condition).append(";").append(SPACE)
                    .append(update_expr, 0, update_expr.length() );
            
            src_code.append(")").append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count))).append("{").append(NEWLINE);
            src_code.append(body).append(TAB.repeat(Math.max(0, tab_count))).append("}");
        } catch (Exception e) {
            LOGGER.severe("Error!: " + for_statement.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processExpressionStatement(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                    JSONObject expr_statement, int tab_count) {

        LOGGER.info("processExpressionStatement method is called!");
        LOGGER.info("Node type is : " + expr_statement.get("nodeType"));
        JSONObject expr = null;
        //System.out.println(expr_statement);
        if (!expr_statement.isNull("expression"))
        	expr = expr_statement.getJSONObject("expression");
        
        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {

            if (expr_statement.has("comment")) {
                if (!expr_statement.isNull("comment")) {
                    src_code.append(expr_statement.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            String expr_code = "";
            if(expr!=null) {
            	expr_code = stringNodeProcessorMap.get(expr.getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, expr, 0);

            	src_code.append(expr_code);
            }
            
            if (src_code.indexOf(";") == -1) {
                src_code.append(";");
            }
        } catch (Exception e) {
            LOGGER.severe("Error!: " + expr_statement.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processUnaryOperation(Map<String, NodeProcessor> stringNodeProcessorMap,
                                               JSONObject unary_op, int tab_count) {

        LOGGER.info("processUnaryOperation method is called!");
        LOGGER.info("Node type is : " + unary_op.get("nodeType"));

        JSONObject sub_expr = unary_op.getJSONObject("subExpression");

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {

            if (unary_op.has("comment")) {
                if (!unary_op.isNull("comment")) {
                    src_code.append(unary_op.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            String sub_expr_code = stringNodeProcessorMap.get(sub_expr.getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, sub_expr, 0);

            String operator = unary_op.getString("operator");

            if (unary_op.getBoolean("prefix")) {
                src_code.append(operator).append(sub_expr_code);
            } else {
                src_code.append(sub_expr_code).append(operator);
            }

            if (src_code.indexOf(";") == -1) {
                src_code.append(";");
            }
        } catch (Exception e) {
            LOGGER.severe("Error!: " + unary_op.getString("nodeType"));
            e.printStackTrace();
        }
        return src_code.toString();
    }

    public static String processWhileStatement(Map<String, NodeProcessor> stringNodeProcessorMap,
                                               JSONObject while_stmt, int tab_count) {

        LOGGER.info("processWhileStatement method is called!");
        LOGGER.info("Node type is : " + while_stmt.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {
            if (while_stmt.has("comment")) {
                if (!while_stmt.isNull("comment")) {
                    src_code.append(while_stmt.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            src_code.append("while").append("(");

            String condition = stringNodeProcessorMap.get(while_stmt.getJSONObject("condition").getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, while_stmt.getJSONObject("condition"), 0);

            src_code.append(condition).append(")").append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)))
                    .append("{").append(NEWLINE);

            String body = stringNodeProcessorMap.get(while_stmt.getJSONObject("body").getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, while_stmt.getJSONObject("body"), tab_count + 1);

            src_code.append(body).append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count))).append("}");
        } catch (Exception e) {
            LOGGER.severe("Error!: " + while_stmt.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processDoWhileStatement(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                 JSONObject do_while_stmt, int tab_count) {

        LOGGER.info("processDoWhileStatement method is called!");
        LOGGER.info("Node type is : " + do_while_stmt.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {

            if (do_while_stmt.has("comment")) {
                if (!do_while_stmt.isNull("comment")) {
                    src_code.append(do_while_stmt.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            src_code.append("do").append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count))).append("{").append(NEWLINE);

            String body = stringNodeProcessorMap.get(do_while_stmt.getJSONObject("body").getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, do_while_stmt.getJSONObject("body"), tab_count + 1);

            src_code.append(body).append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count))).append("}");

            src_code.append("while").append("(");

            String condition = stringNodeProcessorMap.get(do_while_stmt.getJSONObject("condition").getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, do_while_stmt.getJSONObject("condition"), 0);

            src_code.append(condition).append(")").append(";");
        } catch (Exception e) {
            LOGGER.severe("Error!: " + do_while_stmt.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processFunctionCall(Map<String, NodeProcessor> stringNodeProcessorMap,
                                             JSONObject function_call, int tab_count) {

        LOGGER.info("processFunctionCall method is called!");
        LOGGER.info("Node type is : " + function_call.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {

            if (function_call.has("comment")) {
                if (!function_call.isNull("comment")) {
                    src_code.append(function_call.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            JSONObject expression = function_call.getJSONObject("expression");

            String expression_str = stringNodeProcessorMap.get(expression.getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, expression, 0);
            
//            if(expression_str.contains("."))
//            {
//            	String prefix="";
//            	String ending="";
//            	boolean first=true;
//            	for(int i=0;i<expression_str.length();i++)
//            	{
//            		char x = expression_str.charAt(i);
//            		if(x=='.')
//            		{
//            			prefix+="_Library";
//            			first=false;
//            		}
//            		 
//            		
//            		if(first)prefix+=x;
//            		else
//            		ending+=x;
//            		
//            	}
//            	src_code.append(prefix+ending);
//            }
//            else
            src_code.append(expression_str);

            src_code.append("(");
            JSONArray args = function_call.getJSONArray("arguments");

            boolean comma = false;
            for (Object arg : args) {
                if (comma) {
                    src_code.append(",").append(SPACE);
                }
                JSONObject argument = (JSONObject) arg;
                String arg_string = stringNodeProcessorMap.get(argument.getString("nodeType"))
                        .callRelevantMethod(stringNodeProcessorMap, argument, 0);

                src_code.append(arg_string);
                comma = true;
            }

            src_code.append(")");
            /*
             *  if(fun()) {} then we don't have to append ";" so commented following code
             */
            
//            src_code.append(';');
            
        } catch (Exception e) {
            LOGGER.severe("Error!: " + function_call.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processNewExpression(Map<String, NodeProcessor> stringNodeProcessorMap,
                                              JSONObject new_expression, int tab_count) {

        LOGGER.info("processNewExpression method is called!");
        LOGGER.info("Node type is : " + new_expression.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {

            if (new_expression.has("comment")) {
                if (!new_expression.isNull("comment")) {
                    src_code.append(new_expression.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            src_code.append("new").append(SPACE);

            JSONObject type_name = new_expression.getJSONObject("typeName");
            String type_name_str = stringNodeProcessorMap.get(type_name.getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, type_name, 0);

            src_code.append(type_name_str);
        } catch (Exception e) {
            LOGGER.severe("Error!: " + new_expression.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processAssignment(Map<String, NodeProcessor> stringNodeProcessorMap,
                                           JSONObject assignment, int tab_count) {

        LOGGER.info("processAssignment method is called!");
        LOGGER.info("Node type is : " + assignment.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {
            if (assignment.has("comment")) {
                if (!assignment.isNull("comment")) {
                    src_code.append(assignment.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            String left_expr = stringNodeProcessorMap.get(assignment.getJSONObject("leftHandSide").getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, assignment.getJSONObject("leftHandSide"), 0);

            String right_expr = stringNodeProcessorMap.get(assignment.getJSONObject("rightHandSide").getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, assignment.getJSONObject("rightHandSide"), 0);

            String operator = assignment.getString("operator");

            src_code.append(left_expr).append(SPACE).append(operator)
                    .append(SPACE).append(right_expr);

            if (src_code.indexOf(";") == -1) {
                src_code.append(";");
            }
        } catch (Exception e) {
            LOGGER.severe("Error!: " + assignment.getString("nodeType"));
            e.printStackTrace();
        }
        return src_code.toString();
    }

    public static String processIndexAccess(Map<String, NodeProcessor> stringNodeProcessorMap,
                                            JSONObject index_access, int tab_count) {

        LOGGER.info("processAssignment method is called!");
        LOGGER.info("Node type is : " + index_access.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {
            if (index_access.has("comment")) {
                if (!index_access.isNull("comment")) {
                    src_code.append(index_access.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            JSONObject index_expr = index_access.getJSONObject("indexExpression");
            JSONObject base_expr = index_access.getJSONObject("baseExpression");

            String array_name = stringNodeProcessorMap.get(base_expr.getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, base_expr, 0);

            String array_index = stringNodeProcessorMap.get(index_expr.getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, index_expr, 0);

            src_code.append(array_name).append("[").append("uint256(").append(array_index).append(")")
                    .append("]");
        } catch (Exception e) {
            LOGGER.severe("Error!: " + index_access.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processBreak(Map<String, NodeProcessor> stringNodeProcessorMap,
                                      JSONObject break_obj, int tab_count) {

        LOGGER.info("processBreak method is called!");
        LOGGER.info("Node type is : " + break_obj.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {
            if (break_obj.has("comment")) {
                if (!break_obj.isNull("comment")) {
                    src_code.append(break_obj.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            src_code.append(BREAK_SYMBOL).append(";");
        } catch (Exception e) {
            LOGGER.severe("Error!: " + break_obj.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processContinue(Map<String, NodeProcessor> stringNodeProcessorMap,
                                         JSONObject continue_obj, int tab_count) {

        LOGGER.info("processBreak method is called!");
        LOGGER.info("Node type is : " + continue_obj.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {
            if (continue_obj.has("comment")) {
                if (!continue_obj.isNull("comment")) {
                    src_code.append(continue_obj.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            src_code.append(CONTINUE_SYMBOL).append(";");
        } catch (Exception e) {
            LOGGER.severe("Error!: " + continue_obj.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processTupleExpression(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                JSONObject tuple_expression, int tab_count) {

        LOGGER.info("processTupleExpression method is called!");
        LOGGER.info("Node type is : " + tuple_expression.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {
            if (tuple_expression.has("comment")) {
                if (!tuple_expression.isNull("comment")) {
                    src_code.append(tuple_expression.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            src_code.append("(");
            String prefix = "";
            for (Object object : tuple_expression.getJSONArray("components")) {
                JSONObject component = (JSONObject) object;
                String comp_string = stringNodeProcessorMap.get(component.getString("nodeType"))
                        .callRelevantMethod(stringNodeProcessorMap, component, tab_count);

                src_code.append(prefix);
                prefix = ", ";
                src_code.append(comp_string);
            }
            src_code.append(")");
        } catch (Exception e) {
            LOGGER.severe("Error!: " + tuple_expression.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processMemberAccess(Map<String, NodeProcessor> stringNodeProcessorMap,
                                             JSONObject member_access, int tab_count) {

        LOGGER.info("processMemberAccess method is called!");
        LOGGER.info("Node type is : " + member_access.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {

            if (member_access.has("comment")) {
                if (!member_access.isNull("comment")) {
                    src_code.append(member_access.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }
        
            
            String member = member_access.getString("memberName");
           
            if(!member_access.isNull("expression"))
            {

            String identifier = stringNodeProcessorMap.get(member_access.getJSONObject("expression").getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, member_access.getJSONObject("expression"), 0);


            src_code.append(identifier).append(".").append(member);
            }
            else {
            	src_code.append(member);
            }
            
        } catch (Exception e) {
            LOGGER.severe("Error!: " + member_access.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }

    public static String processUserDefinedTypeName(Map<String, NodeProcessor> stringNodeProcessorMap,
                                                    JSONObject user_defined_type_name, int tab_count) {

        LOGGER.info("processUserDefinedTypeName method is called!");
        LOGGER.info("Node type is : " + user_defined_type_name.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {
            if (user_defined_type_name.has("comment")) {
                if (!user_defined_type_name.isNull("comment")) {
                    src_code.append(user_defined_type_name.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            if (user_defined_type_name.getString("name").equals("String")) {
                src_code.append("string");
            } else {
                src_code.append(user_defined_type_name.getString("name"));
            }
        } catch (Exception e) {
            LOGGER.severe("Error!: " + user_defined_type_name.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }
    
    public static String processModifierDefinition(Map<String, NodeProcessor> stringNodeProcessorMap,
           JSONObject modifier_definition, int tab_count) {
    	 LOGGER.info("processModifierDefinition method is called!");
         LOGGER.info("Node type is : " + modifier_definition.get("nodeType"));
         //System.out.println("ok1");

         StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));
         src_code.append("modifier");
         src_code.append(SPACE);
         src_code.append(modifier_definition.get("name"));
         src_code.append("(");
         JSONArray parameters =  modifier_definition.getJSONObject("parameters").getJSONArray("parameters");
         for(int i = 0; i < parameters.length();i++)
         {
        	
        	   String parameter_string = stringNodeProcessorMap.get(parameters.getJSONObject(i).getString("nodeType"))
                       .callRelevantMethod(stringNodeProcessorMap, parameters.getJSONObject(i), 0);
        	   if (parameter_string.indexOf(';') != -1) {
                   src_code.append(parameter_string, 0, parameter_string.length() - 1);
               } else {
                   src_code.append(parameter_string);
               }
        	   if(i!=( parameters.length()-1))src_code.append(", ");
         }
         src_code.append(")");
         JSONObject body = modifier_definition.getJSONObject("body");
         String body_string = stringNodeProcessorMap.get(body.getString("nodeType"))
                 .callRelevantMethod(stringNodeProcessorMap, body, tab_count+1);
         src_code.append(NEWLINE);
         src_code.append(TAB.repeat(Math.max(0, tab_count)));
         src_code.append("{");
         src_code.append(NEWLINE);
         src_code.append(body_string);
         src_code.append(TAB.repeat(Math.max(0, tab_count)));
         src_code.append("}");
         return src_code.toString();
    }

    public static String processPlaceholderStatement(Map<String, NodeProcessor> stringNodeProcessorMap,
            JSONObject placeholder_statement, int tab_count) {
    
    	 LOGGER.info("processConditional method is called!");
         LOGGER.info("Node type is : " + placeholder_statement.get("nodeType"));

         StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));
         src_code.append("_;");
         
         return src_code.toString();
    }

    public static String processConditional(Map<String, NodeProcessor> stringNodeProcessorMap,
                                            JSONObject conditional, int tab_count) {

        LOGGER.info("processConditional method is called!");
        LOGGER.info("Node type is : " + conditional.get("nodeType"));

        StringBuilder src_code = new StringBuilder(TAB.repeat(Math.max(0, tab_count)));

        try {
            if (conditional.has("comment")) {
                if (!conditional.isNull("comment")) {
                    src_code.append(conditional.getString("comment"))
                            .append(NEWLINE).append(TAB.repeat(Math.max(0, tab_count)));
                }
            }

            JSONObject condition_obj = conditional.getJSONObject("condition");
            JSONObject true_expr_obj = conditional.getJSONObject("falseExpression");
            JSONObject false_expr_obj = conditional.getJSONObject("trueExpression");

            String condition = stringNodeProcessorMap.get(condition_obj.getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, condition_obj, 0);

            String true_expr = stringNodeProcessorMap.get(true_expr_obj.getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, true_expr_obj, 0);
            
            true_expr = true_expr.replaceAll(";", "");
            

            String false_expr = stringNodeProcessorMap.get(false_expr_obj.getString("nodeType"))
                    .callRelevantMethod(stringNodeProcessorMap, false_expr_obj, 0);

            src_code.append(condition).append(SPACE).append("?").append(SPACE)
                    .append(false_expr).append(SPACE).append(":").append(SPACE).append(true_expr);
            
        } catch (Exception e) {
            LOGGER.severe("Error!: " + conditional.getString("nodeType"));
            e.printStackTrace();
        }

        return src_code.toString();
    }
}