// Generated from D:/Users/DELL/Desktop/compiler-lite/Mx/src/main/java/AstBuilder\Mx.g4 by ANTLR 4.7
package AstBuilder;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link MxParser}.
 */
public interface MxListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link MxParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(MxParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(MxParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#classDefinition}.
	 * @param ctx the parse tree
	 */
	void enterClassDefinition(MxParser.ClassDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#classDefinition}.
	 * @param ctx the parse tree
	 */
	void exitClassDefinition(MxParser.ClassDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#memberVariable}.
	 * @param ctx the parse tree
	 */
	void enterMemberVariable(MxParser.MemberVariableContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#memberVariable}.
	 * @param ctx the parse tree
	 */
	void exitMemberVariable(MxParser.MemberVariableContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#constructionMethodDefinition}.
	 * @param ctx the parse tree
	 */
	void enterConstructionMethodDefinition(MxParser.ConstructionMethodDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#constructionMethodDefinition}.
	 * @param ctx the parse tree
	 */
	void exitConstructionMethodDefinition(MxParser.ConstructionMethodDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#methodDefinition}.
	 * @param ctx the parse tree
	 */
	void enterMethodDefinition(MxParser.MethodDefinitionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#methodDefinition}.
	 * @param ctx the parse tree
	 */
	void exitMethodDefinition(MxParser.MethodDefinitionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#formalParameterList}.
	 * @param ctx the parse tree
	 */
	void enterFormalParameterList(MxParser.FormalParameterListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#formalParameterList}.
	 * @param ctx the parse tree
	 */
	void exitFormalParameterList(MxParser.FormalParameterListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#formalParameter}.
	 * @param ctx the parse tree
	 */
	void enterFormalParameter(MxParser.FormalParameterContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#formalParameter}.
	 * @param ctx the parse tree
	 */
	void exitFormalParameter(MxParser.FormalParameterContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#actualParameterList}.
	 * @param ctx the parse tree
	 */
	void enterActualParameterList(MxParser.ActualParameterListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#actualParameterList}.
	 * @param ctx the parse tree
	 */
	void exitActualParameterList(MxParser.ActualParameterListContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#block}.
	 * @param ctx the parse tree
	 */
	void enterBlock(MxParser.BlockContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#block}.
	 * @param ctx the parse tree
	 */
	void exitBlock(MxParser.BlockContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#blockOrStatement}.
	 * @param ctx the parse tree
	 */
	void enterBlockOrStatement(MxParser.BlockOrStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#blockOrStatement}.
	 * @param ctx the parse tree
	 */
	void exitBlockOrStatement(MxParser.BlockOrStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code definitionStat}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterDefinitionStat(MxParser.DefinitionStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code definitionStat}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitDefinitionStat(MxParser.DefinitionStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expressionStat}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterExpressionStat(MxParser.ExpressionStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expressionStat}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitExpressionStat(MxParser.ExpressionStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ifStat}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterIfStat(MxParser.IfStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ifStat}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitIfStat(MxParser.IfStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code forStat}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterForStat(MxParser.ForStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code forStat}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitForStat(MxParser.ForStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code whileStat}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterWhileStat(MxParser.WhileStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code whileStat}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitWhileStat(MxParser.WhileStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code returnStat}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterReturnStat(MxParser.ReturnStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code returnStat}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitReturnStat(MxParser.ReturnStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code breakStat}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterBreakStat(MxParser.BreakStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code breakStat}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitBreakStat(MxParser.BreakStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code continueStat}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterContinueStat(MxParser.ContinueStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code continueStat}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitContinueStat(MxParser.ContinueStatContext ctx);
	/**
	 * Enter a parse tree produced by the {@code emptyStat}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterEmptyStat(MxParser.EmptyStatContext ctx);
	/**
	 * Exit a parse tree produced by the {@code emptyStat}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitEmptyStat(MxParser.EmptyStatContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#definitionStatement}.
	 * @param ctx the parse tree
	 */
	void enterDefinitionStatement(MxParser.DefinitionStatementContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#definitionStatement}.
	 * @param ctx the parse tree
	 */
	void exitDefinitionStatement(MxParser.DefinitionStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code newExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterNewExpr(MxParser.NewExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code newExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitNewExpr(MxParser.NewExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code thisExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterThisExpr(MxParser.ThisExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code thisExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitThisExpr(MxParser.ThisExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code definitionExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterDefinitionExpr(MxParser.DefinitionExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code definitionExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitDefinitionExpr(MxParser.DefinitionExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code methodCallExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterMethodCallExpr(MxParser.MethodCallExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code methodCallExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitMethodCallExpr(MxParser.MethodCallExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code unaryExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterUnaryExpr(MxParser.UnaryExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code unaryExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitUnaryExpr(MxParser.UnaryExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code indexAccessExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterIndexAccessExpr(MxParser.IndexAccessExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code indexAccessExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitIndexAccessExpr(MxParser.IndexAccessExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code memberAccessExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterMemberAccessExpr(MxParser.MemberAccessExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code memberAccessExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitMemberAccessExpr(MxParser.MemberAccessExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code binaryExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterBinaryExpr(MxParser.BinaryExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code binaryExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitBinaryExpr(MxParser.BinaryExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code parensExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterParensExpr(MxParser.ParensExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code parensExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitParensExpr(MxParser.ParensExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code identifierExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterIdentifierExpr(MxParser.IdentifierExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code identifierExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitIdentifierExpr(MxParser.IdentifierExprContext ctx);
	/**
	 * Enter a parse tree produced by the {@code constantExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterConstantExpr(MxParser.ConstantExprContext ctx);
	/**
	 * Exit a parse tree produced by the {@code constantExpr}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitConstantExpr(MxParser.ConstantExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#definitionExpression}.
	 * @param ctx the parse tree
	 */
	void enterDefinitionExpression(MxParser.DefinitionExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#definitionExpression}.
	 * @param ctx the parse tree
	 */
	void exitDefinitionExpression(MxParser.DefinitionExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#creator}.
	 * @param ctx the parse tree
	 */
	void enterCreator(MxParser.CreatorContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#creator}.
	 * @param ctx the parse tree
	 */
	void exitCreator(MxParser.CreatorContext ctx);
	/**
	 * Enter a parse tree produced by the {@code nonArrayVariableType}
	 * labeled alternative in {@link MxParser#variableType}.
	 * @param ctx the parse tree
	 */
	void enterNonArrayVariableType(MxParser.NonArrayVariableTypeContext ctx);
	/**
	 * Exit a parse tree produced by the {@code nonArrayVariableType}
	 * labeled alternative in {@link MxParser#variableType}.
	 * @param ctx the parse tree
	 */
	void exitNonArrayVariableType(MxParser.NonArrayVariableTypeContext ctx);
	/**
	 * Enter a parse tree produced by the {@code arrayVariableType}
	 * labeled alternative in {@link MxParser#variableType}.
	 * @param ctx the parse tree
	 */
	void enterArrayVariableType(MxParser.ArrayVariableTypeContext ctx);
	/**
	 * Exit a parse tree produced by the {@code arrayVariableType}
	 * labeled alternative in {@link MxParser#variableType}.
	 * @param ctx the parse tree
	 */
	void exitArrayVariableType(MxParser.ArrayVariableTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#arrayCreatorRest}.
	 * @param ctx the parse tree
	 */
	void enterArrayCreatorRest(MxParser.ArrayCreatorRestContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#arrayCreatorRest}.
	 * @param ctx the parse tree
	 */
	void exitArrayCreatorRest(MxParser.ArrayCreatorRestContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#primitiveType}.
	 * @param ctx the parse tree
	 */
	void enterPrimitiveType(MxParser.PrimitiveTypeContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#primitiveType}.
	 * @param ctx the parse tree
	 */
	void exitPrimitiveType(MxParser.PrimitiveTypeContext ctx);
	/**
	 * Enter a parse tree produced by {@link MxParser#constant}.
	 * @param ctx the parse tree
	 */
	void enterConstant(MxParser.ConstantContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#constant}.
	 * @param ctx the parse tree
	 */
	void exitConstant(MxParser.ConstantContext ctx);
}