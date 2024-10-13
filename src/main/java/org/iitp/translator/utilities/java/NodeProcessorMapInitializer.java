package org.iitp.translator.utilities.java;

import org.iitp.translator.javaAST.Translator;

import java.util.Map;

import static org.iitp.translator.configs.Constants.*;

public class NodeProcessorMapInitializer {

    public static void initialize(Map<String, NodeProcessor> stringNodeProcessorMap) {

        stringNodeProcessorMap.put(COMPILATION_UNIT, Translator::processCompilationUnit);
        stringNodeProcessorMap.put(CLASS_OR_INTERFACE_DECLARATION, Translator::processClassOrInterfaceDeclaration);
        stringNodeProcessorMap.put(METHOD_DECLARATION, Translator::processMethodDeclaration);
        stringNodeProcessorMap.put(FIELD_DECLARATION, Translator::processFieldDeclaration);
        stringNodeProcessorMap.put(RETURN_STATEMENT, Translator::processReturnStatement);
        stringNodeProcessorMap.put(STRING_LITERAL_EXPR, Translator::processLiteralExpr);
        stringNodeProcessorMap.put(INTEGER_LITERAL_EXPR, Translator::processLiteralExpr);
        stringNodeProcessorMap.put(NAME_EXPR, Translator::processNameExpr);
        stringNodeProcessorMap.put(VARIABLE_DECLARATION_EXPR, Translator::processVariableDeclarationExpr);
        stringNodeProcessorMap.put(EXPRESSION_STMT, Translator::processExpressionStmt);
        stringNodeProcessorMap.put(PRIMITIVE_TYPE, Translator::processPrimitiveType);
        stringNodeProcessorMap.put(ARRAY_TYPE, Translator::processArrayType);
        stringNodeProcessorMap.put(ARRAY_INITIALIZER_EXPR, Translator::processArrayInitializerExpr);
        stringNodeProcessorMap.put(IF_STMT, Translator::processIfStmt);
        stringNodeProcessorMap.put(BOOLEAN_LITERAL_EXPR, Translator::processLiteralExpr);
        stringNodeProcessorMap.put(BLOCK_STMT, Translator::processBlockStmt);
        stringNodeProcessorMap.put(BINARY_EXPR, Translator::processBinaryExpr);
        stringNodeProcessorMap.put(UNARY_EXPR, Translator::processUnaryExpr);
        stringNodeProcessorMap.put(FOR_STMT, Translator::processForStmt);
        stringNodeProcessorMap.put(WHILE_STMT, Translator::processWhileStmt);
        stringNodeProcessorMap.put(DO_STMT, Translator::processDoStmt);
        stringNodeProcessorMap.put(METHOD_CALL_EXPR, Translator::processMethodCallExpr);
        stringNodeProcessorMap.put(ASSIGN_EXPR, Translator::processAssignExpr);
        stringNodeProcessorMap.put(ARRAY_ACCESS_EXPR, Translator::processArrayAccessExpr);
        stringNodeProcessorMap.put(BREAK_STMT, Translator::processBreakStmt);
        stringNodeProcessorMap.put(CONTINUE_STMT, Translator::processContinueStmt);
        stringNodeProcessorMap.put(ENCLOSED_EXPR, Translator::processEnclosedExpr);
        stringNodeProcessorMap.put(FIELD_ACCESS_EXPR, Translator::processFieldAccessExpr);
        stringNodeProcessorMap.put(CLASS_OR_INTERFACE_TYPE, Translator::processClassOrInterfaceType);
        stringNodeProcessorMap.put(LINE_COMMENT, Translator::processLineComment);
        stringNodeProcessorMap.put(BLOCK_COMMENT, Translator::processBlockComment);
        stringNodeProcessorMap.put(JAVADOC_COMMENT, Translator::processJavadocComment);
        stringNodeProcessorMap.put(CONSTRUCTOR_DECLARATION, Translator::processConstructorDeclaration);
        stringNodeProcessorMap.put(PARAMETER, Translator::processParameter);
        stringNodeProcessorMap.put(OBJECT_CREATION_EXPR, Translator::processObjectCreationExpr);
        stringNodeProcessorMap.put(CHAR_LITERAL_EXPR, Translator::processLiteralExpr);
        stringNodeProcessorMap.put(DOUBLE_LITERAL_EXPR, Translator::processLiteralExpr);
        stringNodeProcessorMap.put(LONG_LITERAL_EXPR, Translator::processLiteralExpr);
        stringNodeProcessorMap.put(INITIALIZER_DECLARATION, Translator::processInitializerDeclaration);
        stringNodeProcessorMap.put(FOR_EACH_STMT, Translator::processForEachStmt);
        stringNodeProcessorMap.put(VARIABLE_DECLARATOR, Translator::processVariableDeclarator);
        stringNodeProcessorMap.put(IMPORT_DECLARATION, Translator::processImportDeclaration);
        stringNodeProcessorMap.put(ARRAY_CREATION_EXPR, Translator::processArrayCreationExpr);
        stringNodeProcessorMap.put(ARRAY_CREATION_LEVEL, Translator::processArrayCreationLevel);
        stringNodeProcessorMap.put(CAST_EXPR, Translator::processCastExpr);
        stringNodeProcessorMap.put(PACKAGE_DECLARATION, Translator::processPackageDeclaration);
        stringNodeProcessorMap.put(CONDITIONAL_EXPR, Translator::processConditionalExpr);
        stringNodeProcessorMap.put(SWITCH_STMT, Translator::processSwitchStmt);
        stringNodeProcessorMap.put(TRY_STMT, Translator::processTryStmt);
        stringNodeProcessorMap.put(THIS_EXPR,Translator::processThisExpr);
        stringNodeProcessorMap.put(NULL_LITERAL_EXPR,Translator::processNullLiteralExpr);
    }
}
