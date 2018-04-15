// Generated from MxParser.g4 by ANTLR 4.7.1
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link MxParser}.
 */
public interface MxParserListener extends ParseTreeListener {
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
	 * Enter a parse tree produced by {@link MxParser#classBody}.
	 * @param ctx the parse tree
	 */
	void enterClassBody(MxParser.ClassBodyContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#classBody}.
	 * @param ctx the parse tree
	 */
	void exitClassBody(MxParser.ClassBodyContext ctx);
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
	 * Enter a parse tree produced by {@link MxParser#memberMethod}.
	 * @param ctx the parse tree
	 */
	void enterMemberMethod(MxParser.MemberMethodContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#memberMethod}.
	 * @param ctx the parse tree
	 */
	void exitMemberMethod(MxParser.MemberMethodContext ctx);
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
	 * Enter a parse tree produced by {@link MxParser#methodBody}.
	 * @param ctx the parse tree
	 */
	void enterMethodBody(MxParser.MethodBodyContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#methodBody}.
	 * @param ctx the parse tree
	 */
	void exitMethodBody(MxParser.MethodBodyContext ctx);
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
	 * Enter a parse tree produced by the {@code DefinitionStatement}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterDefinitionStatement(MxParser.DefinitionStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code DefinitionStatement}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitDefinitionStatement(MxParser.DefinitionStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code expressionStatement}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterExpressionStatement(MxParser.ExpressionStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code expressionStatement}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitExpressionStatement(MxParser.ExpressionStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code ifStatement}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterIfStatement(MxParser.IfStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code ifStatement}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitIfStatement(MxParser.IfStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code forStatement}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterForStatement(MxParser.ForStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code forStatement}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitForStatement(MxParser.ForStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code whileStatement}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterWhileStatement(MxParser.WhileStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code whileStatement}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitWhileStatement(MxParser.WhileStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code returnStatement}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterReturnStatement(MxParser.ReturnStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code returnStatement}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitReturnStatement(MxParser.ReturnStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code breakStatement}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterBreakStatement(MxParser.BreakStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code breakStatement}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitBreakStatement(MxParser.BreakStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code continueStatement}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterContinueStatement(MxParser.ContinueStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code continueStatement}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitContinueStatement(MxParser.ContinueStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code emptyStatement}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void enterEmptyStatement(MxParser.EmptyStatementContext ctx);
	/**
	 * Exit a parse tree produced by the {@code emptyStatement}
	 * labeled alternative in {@link MxParser#statement}.
	 * @param ctx the parse tree
	 */
	void exitEmptyStatement(MxParser.EmptyStatementContext ctx);
	/**
	 * Enter a parse tree produced by the {@code binaryExpression}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterBinaryExpression(MxParser.BinaryExpressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code binaryExpression}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitBinaryExpression(MxParser.BinaryExpressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code constantExpression}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterConstantExpression(MxParser.ConstantExpressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code constantExpression}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitConstantExpression(MxParser.ConstantExpressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code thisExpression}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterThisExpression(MxParser.ThisExpressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code thisExpression}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitThisExpression(MxParser.ThisExpressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code newExpression}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterNewExpression(MxParser.NewExpressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code newExpression}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitNewExpression(MxParser.NewExpressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code identifierExpression}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterIdentifierExpression(MxParser.IdentifierExpressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code identifierExpression}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitIdentifierExpression(MxParser.IdentifierExpressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code memberAccessExpression}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterMemberAccessExpression(MxParser.MemberAccessExpressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code memberAccessExpression}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitMemberAccessExpression(MxParser.MemberAccessExpressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code methodCallExpression}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterMethodCallExpression(MxParser.MethodCallExpressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code methodCallExpression}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitMethodCallExpression(MxParser.MethodCallExpressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code indexAccessExpression}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterIndexAccessExpression(MxParser.IndexAccessExpressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code indexAccessExpression}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitIndexAccessExpression(MxParser.IndexAccessExpressionContext ctx);
	/**
	 * Enter a parse tree produced by the {@code unaryExpression}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterUnaryExpression(MxParser.UnaryExpressionContext ctx);
	/**
	 * Exit a parse tree produced by the {@code unaryExpression}
	 * labeled alternative in {@link MxParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitUnaryExpression(MxParser.UnaryExpressionContext ctx);
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
	 * Enter a parse tree produced by {@link MxParser#expressionList}.
	 * @param ctx the parse tree
	 */
	void enterExpressionList(MxParser.ExpressionListContext ctx);
	/**
	 * Exit a parse tree produced by {@link MxParser#expressionList}.
	 * @param ctx the parse tree
	 */
	void exitExpressionList(MxParser.ExpressionListContext ctx);
}