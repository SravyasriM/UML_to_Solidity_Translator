package org.iitp.translator.utilities.solidity;

import org.iitp.translator.solidityAST.SolidityCodeGenerator;

import java.util.Map;

import static org.iitp.translator.configs.Constants.*;

public class NodeProcessorMapInitializer {

    public static void initialize(Map<String, NodeProcessor> stringNodeProcessorMap) {

        stringNodeProcessorMap.put(SOURCE_UNIT, SolidityCodeGenerator::processSourceUnit);
        stringNodeProcessorMap.put(CONTRACT_DEFINITION, SolidityCodeGenerator::processContractDefinition);
        stringNodeProcessorMap.put(FUNCTION_DEFINITION, SolidityCodeGenerator::processFunctionDefinition);
        stringNodeProcessorMap.put(VARIABLE_DECLARATION, SolidityCodeGenerator::processVariableDeclaration);
        stringNodeProcessorMap.put(RETURN, SolidityCodeGenerator::processReturn);
        stringNodeProcessorMap.put(IDENTIFIER, SolidityCodeGenerator::processIdentifier);
        stringNodeProcessorMap.put(LITERAL, SolidityCodeGenerator::processLiteral);
        stringNodeProcessorMap.put(VARIABLE_DECLARATION_STATEMENT, SolidityCodeGenerator::processVariableDeclarationStatement);
        stringNodeProcessorMap.put(ARRAY_TYPE_NAME, SolidityCodeGenerator::processArrayTypeName);
        stringNodeProcessorMap.put(ELEMENTARY_TYPE_NAME, SolidityCodeGenerator::processElementaryTypeName);
        stringNodeProcessorMap.put(IF_STATEMENT, SolidityCodeGenerator::processIfStatement);
        stringNodeProcessorMap.put(BLOCK, SolidityCodeGenerator::processBlock);
        stringNodeProcessorMap.put(BINARY_OPERATION, SolidityCodeGenerator::processBinaryOperation);
        stringNodeProcessorMap.put(FOR_STATEMENT, SolidityCodeGenerator::processForStatement);
        stringNodeProcessorMap.put(UNARY_OPERATION, SolidityCodeGenerator::processUnaryOperation);
        stringNodeProcessorMap.put(EXPRESSION_STATEMENT, SolidityCodeGenerator::processExpressionStatement);
        stringNodeProcessorMap.put(WHILE_STATEMENT, SolidityCodeGenerator::processWhileStatement);
        stringNodeProcessorMap.put(DO_WHILE_STATEMENT, SolidityCodeGenerator::processDoWhileStatement);
        stringNodeProcessorMap.put(FUNCTION_CALL, SolidityCodeGenerator::processFunctionCall);
        stringNodeProcessorMap.put(ASSIGNMENT, SolidityCodeGenerator::processAssignment);
        stringNodeProcessorMap.put(INDEX_ACCESS, SolidityCodeGenerator::processIndexAccess);
        stringNodeProcessorMap.put(BREAK, SolidityCodeGenerator::processBreak);
        stringNodeProcessorMap.put(CONTINUE, SolidityCodeGenerator::processContinue);
        stringNodeProcessorMap.put(TUPLE_EXPRESSION, SolidityCodeGenerator::processTupleExpression);
        stringNodeProcessorMap.put(MEMBER_ACCESS, SolidityCodeGenerator::processMemberAccess);
        stringNodeProcessorMap.put(USER_DEFINED_TYPE_NAME, SolidityCodeGenerator::processUserDefinedTypeName);
        stringNodeProcessorMap.put(NEW_EXPRESSION, SolidityCodeGenerator::processNewExpression);
        stringNodeProcessorMap.put(IMPORT_DIRECTIVE, SolidityCodeGenerator::processImportDirective);
        stringNodeProcessorMap.put(SINGLE_LINE_COMMENT, SolidityCodeGenerator::processSingleLineComment);
        stringNodeProcessorMap.put(MULTI_LINE_COMMENT, SolidityCodeGenerator::processMultiLineComment);
        stringNodeProcessorMap.put(CONDITIONAL, SolidityCodeGenerator::processConditional);
        
        stringNodeProcessorMap.put(PRAGMA_DIRECTIVE, SolidityCodeGenerator::processPragmaDirective);
        stringNodeProcessorMap.put(MODIFIER_INVOCATION, SolidityCodeGenerator::processModifierInvocation);
        stringNodeProcessorMap.put(MODIFIER_DEFINITION, SolidityCodeGenerator::processModifierDefinition);
        stringNodeProcessorMap.put(PLACEHOLDER_STATEMENT , SolidityCodeGenerator::processPlaceholderStatement);
    }
    
}
