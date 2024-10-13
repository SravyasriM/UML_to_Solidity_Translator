package org.iitp.translator.configs;

public class Constants {

    // File paths
//    public static final String JAVA_FILE_PATH =
//            "/home/hacker29/IdeaProjects/jdk8/src/share/classes/java/awt/Window.java";
    public static final String JAVA_FILE_PATH = "testing/MyPrograms.java";
    public static String JAVA_FOLDER_PATH = "src/main/java/org/iitp/translator/utilities/samples";
    public static final String SOLIDITY_JAVA_MAPPER_FILE_PATH =
            "src/main/resources/java_solidity_mappers/ast_node_mappers/mapper.json";
    public static final String JAVA_CLOC_RESULT_PATH =
            "src/main/output_files/cloc_test_results/java_result.json";
    public static final String SOLIDITY_CLOC_RESULT_PATH =
            "src/main/output_files/cloc_test_results/solidity_result.json";
    public static final String EXECUTION_RESULT_PATH =
            "src/main/output_files/execution_results/execution_result.json";
    public static final String JAVA_STATISTICS_RESULT_PATH =
            "src/main/output_files/execution_results/java_file_info.json";
    public static final String STATISTICS_FILE_PATH =
            "src/main/output_files/statistics/statistics.json";
    public static final String JAVA_STATISTICS_FILE_PATH =
            "src/main/output_files/statistics/java_stats.json";
    public static final String LOC_VS_TIME_CHART_PATH =
            "src/main/output_files/statistics/LOC_vs_Time.png";
    public static final String JAVA_CODE_STATS_CHART_PATH =
            "src/main/output_files/statistics/Java_code_stats.png";
    public static final String LOC_VS_MEMORY_CHART_PATH =
            "src/main/output_files/statistics/LOC_vs_Memory.png";
    public static final String STATISTICS_RESULT_TEMPLATE_PATH =
            "src/main/resources/benchmark_testing/result_template.json";
    public static final String STATISTICS_JAVA_TEMPLATE_PATH =
            "src/main/resources/benchmark_testing/java_file_stats_template.json";
    public static final String SOLIDITY_AST_JSON_SCHEMAS_PATH =
            "src/main/resources/solidity_ast/json_schemas";
    public static final String SOLIDITY_AST_JSON_OUTPUT_PATH =
            "src/main/output_files/solidity/ast/Sample_Solidity_AST.json";
    public static final String SOLIDITY_CODE_OUTPUT_PATH =
            "testing_output/MyPrograms.sol";
    public static final String JAVA_AST_XML_OUTPUT_PATH = "src/main/output_files/java/java_ast.xml";
    public static final String JAVA_AST_YML_OUTPUT_PATH = "src/main/output_files/java/Sample_Java_AST.yml";
    public static final String ACCESS_SPECIFIER_MAPPING_PATH =
            "src/main/resources/java_solidity_mappers/data_type_mappers/access_specifier_mapping.json";
    public static final String DATA_TYPE_MAPPING_PATH =
            "src/main/resources/java_solidity_mappers/data_type_mappers/data_type_mapping.json";
    public static final String JAVA_AST_MAPPING_PATH =
            "src/main/resources/java_ast/java_ast_mapper.json";
    public static final String OUTPUT_DIRECTORY = "src/main/output_files/solidity/code/";

    // JAVA AST Keywords
    public static final String COMPILATION_UNIT = "CompilationUnit";
    public static final String CLASS_OR_INTERFACE_DECLARATION = "ClassOrInterfaceDeclaration";
    public static final String METHOD_DECLARATION = "MethodDeclaration";
    public static final String BLOCK_STMT = "BlockStmt";
    public static final String FIELD_DECLARATION = "FieldDeclaration";
    public static final String RETURN_STATEMENT = "ReturnStmt";
    public static final String STRING_LITERAL_EXPR = "StringLiteralExpr";
    public static final String INTEGER_LITERAL_EXPR = "IntegerLiteralExpr";
    public static final String NAME_EXPR = "NameExpr";
    public static final String VARIABLE_DECLARATION_EXPR = "VariableDeclarationExpr";
    public static final String EXPRESSION_STMT = "ExpressionStmt";
    public static final String PRIMITIVE_TYPE = "PrimitiveType";
    public static final String ARRAY_TYPE = "ArrayType";
    public static final String ARRAY_INITIALIZER_EXPR = "ArrayInitializerExpr";
    public static final String BOOLEAN_LITERAL_EXPR = "BooleanLiteralExpr";
    public static final String IF_STMT = "IfStmt";
    public static final String BINARY_EXPR = "BinaryExpr";
    public static final String UNARY_EXPR = "UnaryExpr";
    public static final String FOR_STMT = "ForStmt";
    public static final String WHILE_STMT = "WhileStmt";
    public static final String DO_STMT = "DoStmt";
    public static final String METHOD_CALL_EXPR = "MethodCallExpr";
    public static final String ASSIGN_EXPR = "AssignExpr";
    public static final String ARRAY_ACCESS_EXPR = "ArrayAccessExpr";
    public static final String BREAK_STMT = "BreakStmt";
    public static final String CONTINUE_STMT = "ContinueStmt";
    public static final String ENCLOSED_EXPR = "EnclosedExpr";
    public static final String FIELD_ACCESS_EXPR = "FieldAccessExpr";
    public static final String FOR_EACH_STMT = "ForEachStmt";
    public static final String CLASS_OR_INTERFACE_TYPE = "ClassOrInterfaceType";
    public static final String LINE_COMMENT = "LineComment";
    public static final String BLOCK_COMMENT = "BlockComment";
    public static final String JAVADOC_COMMENT = "JavadocComment";
    public static final String CONSTRUCTOR_DECLARATION = "ConstructorDeclaration";
    public static final String PARAMETER = "Parameter";
    public static final String OBJECT_CREATION_EXPR = "ObjectCreationExpr";
    public static final String CHAR_LITERAL_EXPR = "CharLiteralExpr";
    public static final String DOUBLE_LITERAL_EXPR = "DoubleLiteralExpr";
    public static final String LONG_LITERAL_EXPR = "LongLiteralExpr";
    public static final String INITIALIZER_DECLARATION = "InitializerDeclaration";
    public static final String VARIABLE_DECLARATOR = "VariableDeclarator";
    public static final String IMPORT_DECLARATION = "ImportDeclaration";
    public static final String ARRAY_CREATION_EXPR = "ArrayCreationExpr";
    public static final String ARRAY_CREATION_LEVEL = "ArrayCreationLevel";
    public static final String CAST_EXPR = "CastExpr";
    public static final String PACKAGE_DECLARATION = "PackageDeclaration";
    public static final String CONDITIONAL_EXPR = "ConditionalExpr";
    public static final String SWITCH_STMT = "SwitchStmt";
    public static final String TRY_STMT = "TryStmt";
    public static final String THIS_EXPR = "ThisExpr";
    public static final String NULL_LITERAL_EXPR = "NullLiteralExpr";
    

    // SOLIDITY AST Keywords
    public static final String SOURCE_UNIT = "SourceUnit";
    public static final String CONTRACT_DEFINITION = "ContractDefinition";
    public static final String FUNCTION_DEFINITION = "FunctionDefinition";
    public static final String BLOCK = "Block";
    public static final String VARIABLE_DECLARATION = "VariableDeclaration";
    public static final String VARIABLE_DECLARATION_STATEMENT = "VariableDeclarationStatement";
    public static final String RETURN = "Return";
    public static final String LITERAL = "Literal";
    public static final String IDENTIFIER = "Identifier";
    public static final String ARRAY_TYPE_NAME = "ArrayTypeName";
    public static final String ELEMENTARY_TYPE_NAME = "ElementaryTypeName";
    public static final String IF_STATEMENT = "IfStatement";
    public static final String BINARY_OPERATION = "BinaryOperation";
    public static final String UNARY_OPERATION = "UnaryOperation";
    public static final String EXPRESSION_STATEMENT = "ExpressionStatement";
    public static final String FOR_STATEMENT = "ForStatement";
    public static final String WHILE_STATEMENT = "WhileStatement";
    public static final String DO_WHILE_STATEMENT = "DoWhileStatement";
    public static final String FUNCTION_CALL = "FunctionCall";
    public static final String ASSIGNMENT = "Assignment";
    public static final String INDEX_ACCESS = "IndexAccess";
    public static final String BREAK = "Break";
    public static final String CONTINUE = "Continue";
    public static final String TUPLE_EXPRESSION = "TupleExpression";
    public static final String MEMBER_ACCESS = "MemberAccess";
    public static final String USER_DEFINED_TYPE_NAME = "UserDefinedTypeName";
    public static final String NEW_EXPRESSION = "NewExpression";
    public static final String INHERITANCE_SPECIFIER = "InheritanceSpecifier";
    public static final String IMPORT_DIRECTIVE = "ImportDirective";
    public static final String MULTI_LINE_COMMENT = "MultiLineComment";
    public static final String SINGLE_LINE_COMMENT = "SingleLineComment";
    public static final String CONDITIONAL = "Conditional";
    public static final String PRAGMA_DIRECTIVE = "PragmaDirective";
    public static final String MODIFIER_INVOCATION = "ModifierInvocation";
    public static final String MODIFIER_DEFINITION = "ModifierDefinition";
    public static final String PLACEHOLDER_STATEMENT = "PlaceholderStatement";

    // SOLIDITY Code Formatting
    public static final String NEWLINE = "\n";
    public static final String TAB = "\t";
    public static final String SPACE = " ";
    public static final String BREAK_SYMBOL = "break";
    public static final String CONTINUE_SYMBOL = "continue";
    
    //SOLIDITY VERSION
    public static String SOLIDITY_VERSION_DEFAULT = "^0.5.11";
}
