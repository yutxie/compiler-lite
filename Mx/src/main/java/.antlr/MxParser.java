// Generated from d:\Users\DELL\Desktop\compiler-lite\Mx\src\main\java\MxParser.g4 by ANTLR 4.7.1
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class MxParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		Operator=1, SeparatorOperator=2, LPAREN=3, RPAREN=4, LBRACE=5, RBRACE=6, 
		LBRACK=7, RBRACK=8, SEMI=9, COMMA=10, DOT=11, AssignmentOperator=12, ASSIGN=13, 
		InDecreaseOperator=14, INC=15, DEC=16, ArithmeticOperator=17, ADD=18, 
		SUB=19, MUL=20, DIV=21, MOD=22, LogicOperator=23, LAND=24, LOR=25, LNOT=26, 
		BitOperator=27, LSHIFT=28, RSHIFT=29, NOT=30, OR=31, AND=32, XOR=33, RelationshipOperator=34, 
		LT=35, GT=36, EQUAL=37, LE=38, GE=39, NOTEQUAL=40, Keyword=41, ConditionWord=42, 
		IF=43, ELSE=44, LoopWord=45, FOR=46, WHILE=47, JumpWord=48, BREAK=49, 
		CONTINUE=50, RETURN=51, ObjectiveWord=52, CLASS=53, NEW=54, THIS=55, PrimitiveType=56, 
		BOOL=57, INT=58, STRING=59, VOID=60, Constant=61, LogicConstant=62, IntegerConstant=63, 
		StringConstant=64, NullConstant=65, Identifier=66, SpecialToken=67, WhiteSpace=68, 
		NewLine=69, Comment=70, LineComment=71, BlockComment=72;
	public static final int
		RULE_program = 0, RULE_classDefinition = 1, RULE_classBody = 2, RULE_memberVariable = 3, 
		RULE_memberMethod = 4, RULE_constructionMethodDefinition = 5, RULE_methodDefinition = 6, 
		RULE_formalParameterList = 7, RULE_formalParameter = 8, RULE_actualParameterList = 9, 
		RULE_methodBody = 10, RULE_block = 11, RULE_blockOrStatement = 12, RULE_statement = 13, 
		RULE_expression = 14, RULE_creator = 15, RULE_variableType = 16, RULE_arrayCreatorRest = 17, 
		RULE_expressionList = 18;
	public static final String[] ruleNames = {
		"program", "classDefinition", "classBody", "memberVariable", "memberMethod", 
		"constructionMethodDefinition", "methodDefinition", "formalParameterList", 
		"formalParameter", "actualParameterList", "methodBody", "block", "blockOrStatement", 
		"statement", "expression", "creator", "variableType", "arrayCreatorRest", 
		"expressionList"
	};

	private static final String[] _LITERAL_NAMES = {
		null, null, null, "'('", "')'", "'{'", "'}'", "'['", "']'", "';'", "','", 
		"'.'", null, "'='", null, "'++'", "'--'", null, "'+'", "'-'", "'*'", "'/'", 
		"'%'", null, "'&&'", "'||'", "'!'", null, "'<<'", "'>>'", "'~'", "'|'", 
		"'&'", "'^'", null, "'<'", "'>'", "'=='", "'<='", "'>='", "'!='", null, 
		null, "'if'", "'else'", null, "'for'", "'while'", null, "'break'", "'continue'", 
		"'return'", null, "'class'", "'new'", "'this'", null, "'bool'", "'int'", 
		"'string'", "'void'", null, null, null, null, "'null'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, "Operator", "SeparatorOperator", "LPAREN", "RPAREN", "LBRACE", "RBRACE", 
		"LBRACK", "RBRACK", "SEMI", "COMMA", "DOT", "AssignmentOperator", "ASSIGN", 
		"InDecreaseOperator", "INC", "DEC", "ArithmeticOperator", "ADD", "SUB", 
		"MUL", "DIV", "MOD", "LogicOperator", "LAND", "LOR", "LNOT", "BitOperator", 
		"LSHIFT", "RSHIFT", "NOT", "OR", "AND", "XOR", "RelationshipOperator", 
		"LT", "GT", "EQUAL", "LE", "GE", "NOTEQUAL", "Keyword", "ConditionWord", 
		"IF", "ELSE", "LoopWord", "FOR", "WHILE", "JumpWord", "BREAK", "CONTINUE", 
		"RETURN", "ObjectiveWord", "CLASS", "NEW", "THIS", "PrimitiveType", "BOOL", 
		"INT", "STRING", "VOID", "Constant", "LogicConstant", "IntegerConstant", 
		"StringConstant", "NullConstant", "Identifier", "SpecialToken", "WhiteSpace", 
		"NewLine", "Comment", "LineComment", "BlockComment"
	};
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "MxParser.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public MxParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}
	public static class ProgramContext extends ParserRuleContext {
		public List<ClassDefinitionContext> classDefinition() {
			return getRuleContexts(ClassDefinitionContext.class);
		}
		public ClassDefinitionContext classDefinition(int i) {
			return getRuleContext(ClassDefinitionContext.class,i);
		}
		public List<MethodDefinitionContext> methodDefinition() {
			return getRuleContexts(MethodDefinitionContext.class);
		}
		public MethodDefinitionContext methodDefinition(int i) {
			return getRuleContext(MethodDefinitionContext.class,i);
		}
		public List<StatementContext> statement() {
			return getRuleContexts(StatementContext.class);
		}
		public StatementContext statement(int i) {
			return getRuleContext(StatementContext.class,i);
		}
		public ProgramContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_program; }
	}

	public final ProgramContext program() throws RecognitionException {
		ProgramContext _localctx = new ProgramContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_program);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(43);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (((((_la - 3)) & ~0x3f) == 0 && ((1L << (_la - 3)) & ((1L << (LPAREN - 3)) | (1L << (SEMI - 3)) | (1L << (INC - 3)) | (1L << (DEC - 3)) | (1L << (ADD - 3)) | (1L << (SUB - 3)) | (1L << (LNOT - 3)) | (1L << (NOT - 3)) | (1L << (IF - 3)) | (1L << (FOR - 3)) | (1L << (WHILE - 3)) | (1L << (BREAK - 3)) | (1L << (CONTINUE - 3)) | (1L << (RETURN - 3)) | (1L << (CLASS - 3)) | (1L << (NEW - 3)) | (1L << (THIS - 3)) | (1L << (PrimitiveType - 3)) | (1L << (Constant - 3)) | (1L << (Identifier - 3)))) != 0)) {
				{
				setState(41);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,0,_ctx) ) {
				case 1:
					{
					setState(38);
					classDefinition();
					}
					break;
				case 2:
					{
					setState(39);
					methodDefinition();
					}
					break;
				case 3:
					{
					setState(40);
					statement();
					}
					break;
				}
				}
				setState(45);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ClassDefinitionContext extends ParserRuleContext {
		public TerminalNode CLASS() { return getToken(MxParser.CLASS, 0); }
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public TerminalNode LBRACE() { return getToken(MxParser.LBRACE, 0); }
		public ClassBodyContext classBody() {
			return getRuleContext(ClassBodyContext.class,0);
		}
		public TerminalNode RBRACE() { return getToken(MxParser.RBRACE, 0); }
		public ClassDefinitionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_classDefinition; }
	}

	public final ClassDefinitionContext classDefinition() throws RecognitionException {
		ClassDefinitionContext _localctx = new ClassDefinitionContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_classDefinition);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(46);
			match(CLASS);
			setState(47);
			match(Identifier);
			setState(48);
			match(LBRACE);
			setState(49);
			classBody();
			setState(50);
			match(RBRACE);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ClassBodyContext extends ParserRuleContext {
		public List<MemberVariableContext> memberVariable() {
			return getRuleContexts(MemberVariableContext.class);
		}
		public MemberVariableContext memberVariable(int i) {
			return getRuleContext(MemberVariableContext.class,i);
		}
		public List<MemberMethodContext> memberMethod() {
			return getRuleContexts(MemberMethodContext.class);
		}
		public MemberMethodContext memberMethod(int i) {
			return getRuleContext(MemberMethodContext.class,i);
		}
		public ClassBodyContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_classBody; }
	}

	public final ClassBodyContext classBody() throws RecognitionException {
		ClassBodyContext _localctx = new ClassBodyContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_classBody);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(55);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,2,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(52);
					memberVariable();
					}
					} 
				}
				setState(57);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,2,_ctx);
			}
			setState(61);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==PrimitiveType || _la==Identifier) {
				{
				{
				setState(58);
				memberMethod();
				}
				}
				setState(63);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MemberVariableContext extends ParserRuleContext {
		public VariableTypeContext variableType() {
			return getRuleContext(VariableTypeContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public TerminalNode SEMI() { return getToken(MxParser.SEMI, 0); }
		public MemberVariableContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_memberVariable; }
	}

	public final MemberVariableContext memberVariable() throws RecognitionException {
		MemberVariableContext _localctx = new MemberVariableContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_memberVariable);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(64);
			variableType();
			setState(65);
			match(Identifier);
			setState(66);
			match(SEMI);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MemberMethodContext extends ParserRuleContext {
		public ConstructionMethodDefinitionContext constructionMethodDefinition() {
			return getRuleContext(ConstructionMethodDefinitionContext.class,0);
		}
		public MethodDefinitionContext methodDefinition() {
			return getRuleContext(MethodDefinitionContext.class,0);
		}
		public MemberMethodContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_memberMethod; }
	}

	public final MemberMethodContext memberMethod() throws RecognitionException {
		MemberMethodContext _localctx = new MemberMethodContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_memberMethod);
		try {
			setState(70);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,4,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(68);
				constructionMethodDefinition();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(69);
				methodDefinition();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ConstructionMethodDefinitionContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public TerminalNode LPAREN() { return getToken(MxParser.LPAREN, 0); }
		public TerminalNode RPAREN() { return getToken(MxParser.RPAREN, 0); }
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public FormalParameterListContext formalParameterList() {
			return getRuleContext(FormalParameterListContext.class,0);
		}
		public ConstructionMethodDefinitionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_constructionMethodDefinition; }
	}

	public final ConstructionMethodDefinitionContext constructionMethodDefinition() throws RecognitionException {
		ConstructionMethodDefinitionContext _localctx = new ConstructionMethodDefinitionContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_constructionMethodDefinition);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(72);
			match(Identifier);
			setState(73);
			match(LPAREN);
			setState(75);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==PrimitiveType || _la==Identifier) {
				{
				setState(74);
				formalParameterList();
				}
			}

			setState(77);
			match(RPAREN);
			setState(78);
			block();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MethodDefinitionContext extends ParserRuleContext {
		public VariableTypeContext variableType() {
			return getRuleContext(VariableTypeContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public TerminalNode LPAREN() { return getToken(MxParser.LPAREN, 0); }
		public TerminalNode RPAREN() { return getToken(MxParser.RPAREN, 0); }
		public TerminalNode LBRACE() { return getToken(MxParser.LBRACE, 0); }
		public MethodBodyContext methodBody() {
			return getRuleContext(MethodBodyContext.class,0);
		}
		public TerminalNode RBRACE() { return getToken(MxParser.RBRACE, 0); }
		public FormalParameterListContext formalParameterList() {
			return getRuleContext(FormalParameterListContext.class,0);
		}
		public MethodDefinitionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_methodDefinition; }
	}

	public final MethodDefinitionContext methodDefinition() throws RecognitionException {
		MethodDefinitionContext _localctx = new MethodDefinitionContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_methodDefinition);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(80);
			variableType();
			setState(81);
			match(Identifier);
			setState(82);
			match(LPAREN);
			setState(84);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==PrimitiveType || _la==Identifier) {
				{
				setState(83);
				formalParameterList();
				}
			}

			setState(86);
			match(RPAREN);
			setState(87);
			match(LBRACE);
			setState(88);
			methodBody();
			setState(89);
			match(RBRACE);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FormalParameterListContext extends ParserRuleContext {
		public List<FormalParameterContext> formalParameter() {
			return getRuleContexts(FormalParameterContext.class);
		}
		public FormalParameterContext formalParameter(int i) {
			return getRuleContext(FormalParameterContext.class,i);
		}
		public List<TerminalNode> COMMA() { return getTokens(MxParser.COMMA); }
		public TerminalNode COMMA(int i) {
			return getToken(MxParser.COMMA, i);
		}
		public FormalParameterListContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_formalParameterList; }
	}

	public final FormalParameterListContext formalParameterList() throws RecognitionException {
		FormalParameterListContext _localctx = new FormalParameterListContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_formalParameterList);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(91);
			formalParameter();
			setState(96);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==COMMA) {
				{
				{
				setState(92);
				match(COMMA);
				setState(93);
				formalParameter();
				}
				}
				setState(98);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class FormalParameterContext extends ParserRuleContext {
		public VariableTypeContext variableType() {
			return getRuleContext(VariableTypeContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public TerminalNode ASSIGN() { return getToken(MxParser.ASSIGN, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public FormalParameterContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_formalParameter; }
	}

	public final FormalParameterContext formalParameter() throws RecognitionException {
		FormalParameterContext _localctx = new FormalParameterContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_formalParameter);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(99);
			variableType();
			setState(100);
			match(Identifier);
			setState(103);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==ASSIGN) {
				{
				setState(101);
				match(ASSIGN);
				setState(102);
				expression(0);
				}
			}

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ActualParameterListContext extends ParserRuleContext {
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public List<TerminalNode> COMMA() { return getTokens(MxParser.COMMA); }
		public TerminalNode COMMA(int i) {
			return getToken(MxParser.COMMA, i);
		}
		public ActualParameterListContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_actualParameterList; }
	}

	public final ActualParameterListContext actualParameterList() throws RecognitionException {
		ActualParameterListContext _localctx = new ActualParameterListContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_actualParameterList);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(105);
			expression(0);
			setState(110);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,9,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(106);
					match(COMMA);
					setState(107);
					expression(0);
					}
					} 
				}
				setState(112);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,9,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MethodBodyContext extends ParserRuleContext {
		public List<StatementContext> statement() {
			return getRuleContexts(StatementContext.class);
		}
		public StatementContext statement(int i) {
			return getRuleContext(StatementContext.class,i);
		}
		public MethodBodyContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_methodBody; }
	}

	public final MethodBodyContext methodBody() throws RecognitionException {
		MethodBodyContext _localctx = new MethodBodyContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_methodBody);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(116);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (((((_la - 3)) & ~0x3f) == 0 && ((1L << (_la - 3)) & ((1L << (LPAREN - 3)) | (1L << (SEMI - 3)) | (1L << (INC - 3)) | (1L << (DEC - 3)) | (1L << (ADD - 3)) | (1L << (SUB - 3)) | (1L << (LNOT - 3)) | (1L << (NOT - 3)) | (1L << (IF - 3)) | (1L << (FOR - 3)) | (1L << (WHILE - 3)) | (1L << (BREAK - 3)) | (1L << (CONTINUE - 3)) | (1L << (RETURN - 3)) | (1L << (NEW - 3)) | (1L << (THIS - 3)) | (1L << (PrimitiveType - 3)) | (1L << (Constant - 3)) | (1L << (Identifier - 3)))) != 0)) {
				{
				{
				setState(113);
				statement();
				}
				}
				setState(118);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class BlockContext extends ParserRuleContext {
		public TerminalNode LBRACE() { return getToken(MxParser.LBRACE, 0); }
		public TerminalNode RBRACE() { return getToken(MxParser.RBRACE, 0); }
		public List<StatementContext> statement() {
			return getRuleContexts(StatementContext.class);
		}
		public StatementContext statement(int i) {
			return getRuleContext(StatementContext.class,i);
		}
		public BlockContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_block; }
	}

	public final BlockContext block() throws RecognitionException {
		BlockContext _localctx = new BlockContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_block);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(119);
			match(LBRACE);
			setState(123);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (((((_la - 3)) & ~0x3f) == 0 && ((1L << (_la - 3)) & ((1L << (LPAREN - 3)) | (1L << (SEMI - 3)) | (1L << (INC - 3)) | (1L << (DEC - 3)) | (1L << (ADD - 3)) | (1L << (SUB - 3)) | (1L << (LNOT - 3)) | (1L << (NOT - 3)) | (1L << (IF - 3)) | (1L << (FOR - 3)) | (1L << (WHILE - 3)) | (1L << (BREAK - 3)) | (1L << (CONTINUE - 3)) | (1L << (RETURN - 3)) | (1L << (NEW - 3)) | (1L << (THIS - 3)) | (1L << (PrimitiveType - 3)) | (1L << (Constant - 3)) | (1L << (Identifier - 3)))) != 0)) {
				{
				{
				setState(120);
				statement();
				}
				}
				setState(125);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(126);
			match(RBRACE);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class BlockOrStatementContext extends ParserRuleContext {
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public StatementContext statement() {
			return getRuleContext(StatementContext.class,0);
		}
		public BlockOrStatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_blockOrStatement; }
	}

	public final BlockOrStatementContext blockOrStatement() throws RecognitionException {
		BlockOrStatementContext _localctx = new BlockOrStatementContext(_ctx, getState());
		enterRule(_localctx, 24, RULE_blockOrStatement);
		try {
			setState(130);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case LBRACE:
				enterOuterAlt(_localctx, 1);
				{
				setState(128);
				block();
				}
				break;
			case LPAREN:
			case SEMI:
			case INC:
			case DEC:
			case ADD:
			case SUB:
			case LNOT:
			case NOT:
			case IF:
			case FOR:
			case WHILE:
			case BREAK:
			case CONTINUE:
			case RETURN:
			case NEW:
			case THIS:
			case PrimitiveType:
			case Constant:
			case Identifier:
				enterOuterAlt(_localctx, 2);
				{
				setState(129);
				statement();
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class StatementContext extends ParserRuleContext {
		public StatementContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_statement; }
	 
		public StatementContext() { }
		public void copyFrom(StatementContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class WhileStatementContext extends StatementContext {
		public TerminalNode WHILE() { return getToken(MxParser.WHILE, 0); }
		public TerminalNode LPAREN() { return getToken(MxParser.LPAREN, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode RPAREN() { return getToken(MxParser.RPAREN, 0); }
		public BlockOrStatementContext blockOrStatement() {
			return getRuleContext(BlockOrStatementContext.class,0);
		}
		public WhileStatementContext(StatementContext ctx) { copyFrom(ctx); }
	}
	public static class EmptyStatementContext extends StatementContext {
		public TerminalNode SEMI() { return getToken(MxParser.SEMI, 0); }
		public EmptyStatementContext(StatementContext ctx) { copyFrom(ctx); }
	}
	public static class DefinitionStatementContext extends StatementContext {
		public VariableTypeContext variableType() {
			return getRuleContext(VariableTypeContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public TerminalNode SEMI() { return getToken(MxParser.SEMI, 0); }
		public TerminalNode ASSIGN() { return getToken(MxParser.ASSIGN, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public DefinitionStatementContext(StatementContext ctx) { copyFrom(ctx); }
	}
	public static class ForStatementContext extends StatementContext {
		public TerminalNode FOR() { return getToken(MxParser.FOR, 0); }
		public TerminalNode LPAREN() { return getToken(MxParser.LPAREN, 0); }
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public List<TerminalNode> SEMI() { return getTokens(MxParser.SEMI); }
		public TerminalNode SEMI(int i) {
			return getToken(MxParser.SEMI, i);
		}
		public TerminalNode RPAREN() { return getToken(MxParser.RPAREN, 0); }
		public BlockOrStatementContext blockOrStatement() {
			return getRuleContext(BlockOrStatementContext.class,0);
		}
		public ForStatementContext(StatementContext ctx) { copyFrom(ctx); }
	}
	public static class BreakStatementContext extends StatementContext {
		public TerminalNode BREAK() { return getToken(MxParser.BREAK, 0); }
		public TerminalNode SEMI() { return getToken(MxParser.SEMI, 0); }
		public BreakStatementContext(StatementContext ctx) { copyFrom(ctx); }
	}
	public static class ExpressionStatementContext extends StatementContext {
		public ExpressionListContext expressionList() {
			return getRuleContext(ExpressionListContext.class,0);
		}
		public TerminalNode SEMI() { return getToken(MxParser.SEMI, 0); }
		public ExpressionStatementContext(StatementContext ctx) { copyFrom(ctx); }
	}
	public static class ContinueStatementContext extends StatementContext {
		public TerminalNode CONTINUE() { return getToken(MxParser.CONTINUE, 0); }
		public TerminalNode SEMI() { return getToken(MxParser.SEMI, 0); }
		public ContinueStatementContext(StatementContext ctx) { copyFrom(ctx); }
	}
	public static class IfStatementContext extends StatementContext {
		public TerminalNode IF() { return getToken(MxParser.IF, 0); }
		public TerminalNode LPAREN() { return getToken(MxParser.LPAREN, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode RPAREN() { return getToken(MxParser.RPAREN, 0); }
		public List<BlockOrStatementContext> blockOrStatement() {
			return getRuleContexts(BlockOrStatementContext.class);
		}
		public BlockOrStatementContext blockOrStatement(int i) {
			return getRuleContext(BlockOrStatementContext.class,i);
		}
		public TerminalNode ELSE() { return getToken(MxParser.ELSE, 0); }
		public IfStatementContext(StatementContext ctx) { copyFrom(ctx); }
	}
	public static class ReturnStatementContext extends StatementContext {
		public TerminalNode RETURN() { return getToken(MxParser.RETURN, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode SEMI() { return getToken(MxParser.SEMI, 0); }
		public ReturnStatementContext(StatementContext ctx) { copyFrom(ctx); }
	}

	public final StatementContext statement() throws RecognitionException {
		StatementContext _localctx = new StatementContext(_ctx, getState());
		enterRule(_localctx, 26, RULE_statement);
		int _la;
		try {
			setState(177);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,15,_ctx) ) {
			case 1:
				_localctx = new DefinitionStatementContext(_localctx);
				enterOuterAlt(_localctx, 1);
				{
				setState(132);
				variableType();
				setState(133);
				match(Identifier);
				setState(136);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==ASSIGN) {
					{
					setState(134);
					match(ASSIGN);
					setState(135);
					expression(0);
					}
				}

				setState(138);
				match(SEMI);
				}
				break;
			case 2:
				_localctx = new ExpressionStatementContext(_localctx);
				enterOuterAlt(_localctx, 2);
				{
				setState(140);
				expressionList();
				setState(141);
				match(SEMI);
				}
				break;
			case 3:
				_localctx = new IfStatementContext(_localctx);
				enterOuterAlt(_localctx, 3);
				{
				setState(143);
				match(IF);
				setState(144);
				match(LPAREN);
				setState(145);
				expression(0);
				setState(146);
				match(RPAREN);
				setState(147);
				blockOrStatement();
				setState(150);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,14,_ctx) ) {
				case 1:
					{
					setState(148);
					match(ELSE);
					setState(149);
					blockOrStatement();
					}
					break;
				}
				}
				break;
			case 4:
				_localctx = new ForStatementContext(_localctx);
				enterOuterAlt(_localctx, 4);
				{
				setState(152);
				match(FOR);
				setState(153);
				match(LPAREN);
				setState(154);
				expression(0);
				setState(155);
				match(SEMI);
				setState(156);
				expression(0);
				setState(157);
				match(SEMI);
				setState(158);
				expression(0);
				setState(159);
				match(RPAREN);
				setState(160);
				blockOrStatement();
				}
				break;
			case 5:
				_localctx = new WhileStatementContext(_localctx);
				enterOuterAlt(_localctx, 5);
				{
				setState(162);
				match(WHILE);
				setState(163);
				match(LPAREN);
				setState(164);
				expression(0);
				setState(165);
				match(RPAREN);
				setState(166);
				blockOrStatement();
				}
				break;
			case 6:
				_localctx = new ReturnStatementContext(_localctx);
				enterOuterAlt(_localctx, 6);
				{
				setState(168);
				match(RETURN);
				setState(169);
				expression(0);
				setState(170);
				match(SEMI);
				}
				break;
			case 7:
				_localctx = new BreakStatementContext(_localctx);
				enterOuterAlt(_localctx, 7);
				{
				setState(172);
				match(BREAK);
				setState(173);
				match(SEMI);
				}
				break;
			case 8:
				_localctx = new ContinueStatementContext(_localctx);
				enterOuterAlt(_localctx, 8);
				{
				setState(174);
				match(CONTINUE);
				setState(175);
				match(SEMI);
				}
				break;
			case 9:
				_localctx = new EmptyStatementContext(_localctx);
				enterOuterAlt(_localctx, 9);
				{
				setState(176);
				match(SEMI);
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExpressionContext extends ParserRuleContext {
		public ExpressionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expression; }
	 
		public ExpressionContext() { }
		public void copyFrom(ExpressionContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class BinaryExpressionContext extends ExpressionContext {
		public ExpressionContext lhs;
		public Token op;
		public ExpressionContext rhs;
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public TerminalNode MUL() { return getToken(MxParser.MUL, 0); }
		public TerminalNode DIV() { return getToken(MxParser.DIV, 0); }
		public TerminalNode MOD() { return getToken(MxParser.MOD, 0); }
		public TerminalNode ADD() { return getToken(MxParser.ADD, 0); }
		public TerminalNode SUB() { return getToken(MxParser.SUB, 0); }
		public TerminalNode LSHIFT() { return getToken(MxParser.LSHIFT, 0); }
		public TerminalNode RSHIFT() { return getToken(MxParser.RSHIFT, 0); }
		public TerminalNode LE() { return getToken(MxParser.LE, 0); }
		public TerminalNode GE() { return getToken(MxParser.GE, 0); }
		public TerminalNode LT() { return getToken(MxParser.LT, 0); }
		public TerminalNode GT() { return getToken(MxParser.GT, 0); }
		public TerminalNode EQUAL() { return getToken(MxParser.EQUAL, 0); }
		public TerminalNode NOTEQUAL() { return getToken(MxParser.NOTEQUAL, 0); }
		public TerminalNode AND() { return getToken(MxParser.AND, 0); }
		public TerminalNode XOR() { return getToken(MxParser.XOR, 0); }
		public TerminalNode OR() { return getToken(MxParser.OR, 0); }
		public TerminalNode LAND() { return getToken(MxParser.LAND, 0); }
		public TerminalNode LOR() { return getToken(MxParser.LOR, 0); }
		public TerminalNode ASSIGN() { return getToken(MxParser.ASSIGN, 0); }
		public BinaryExpressionContext(ExpressionContext ctx) { copyFrom(ctx); }
	}
	public static class DeclarationExpressionContext extends ExpressionContext {
		public VariableTypeContext variableType() {
			return getRuleContext(VariableTypeContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public TerminalNode ASSIGN() { return getToken(MxParser.ASSIGN, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public DeclarationExpressionContext(ExpressionContext ctx) { copyFrom(ctx); }
	}
	public static class ConstantExpressionContext extends ExpressionContext {
		public TerminalNode Constant() { return getToken(MxParser.Constant, 0); }
		public ConstantExpressionContext(ExpressionContext ctx) { copyFrom(ctx); }
	}
	public static class ThisExpressionContext extends ExpressionContext {
		public TerminalNode THIS() { return getToken(MxParser.THIS, 0); }
		public ThisExpressionContext(ExpressionContext ctx) { copyFrom(ctx); }
	}
	public static class NewExpressionContext extends ExpressionContext {
		public TerminalNode NEW() { return getToken(MxParser.NEW, 0); }
		public CreatorContext creator() {
			return getRuleContext(CreatorContext.class,0);
		}
		public NewExpressionContext(ExpressionContext ctx) { copyFrom(ctx); }
	}
	public static class IdentifierExpressionContext extends ExpressionContext {
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public IdentifierExpressionContext(ExpressionContext ctx) { copyFrom(ctx); }
	}
	public static class ParensExpressionContext extends ExpressionContext {
		public TerminalNode LPAREN() { return getToken(MxParser.LPAREN, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode RPAREN() { return getToken(MxParser.RPAREN, 0); }
		public ParensExpressionContext(ExpressionContext ctx) { copyFrom(ctx); }
	}
	public static class MemberAccessExpressionContext extends ExpressionContext {
		public Token op;
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode DOT() { return getToken(MxParser.DOT, 0); }
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public TerminalNode THIS() { return getToken(MxParser.THIS, 0); }
		public MemberAccessExpressionContext(ExpressionContext ctx) { copyFrom(ctx); }
	}
	public static class MethodCallExpressionContext extends ExpressionContext {
		public ExpressionContext caller;
		public ActualParameterListContext actual_parameter_list;
		public TerminalNode LPAREN() { return getToken(MxParser.LPAREN, 0); }
		public TerminalNode RPAREN() { return getToken(MxParser.RPAREN, 0); }
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public ActualParameterListContext actualParameterList() {
			return getRuleContext(ActualParameterListContext.class,0);
		}
		public MethodCallExpressionContext(ExpressionContext ctx) { copyFrom(ctx); }
	}
	public static class IndexAccessExpressionContext extends ExpressionContext {
		public ExpressionContext caller;
		public ExpressionContext index;
		public TerminalNode LBRACK() { return getToken(MxParser.LBRACK, 0); }
		public TerminalNode RBRACK() { return getToken(MxParser.RBRACK, 0); }
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public IndexAccessExpressionContext(ExpressionContext ctx) { copyFrom(ctx); }
	}
	public static class UnaryExpressionContext extends ExpressionContext {
		public Token prefix;
		public Token postfix;
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode INC() { return getToken(MxParser.INC, 0); }
		public TerminalNode DEC() { return getToken(MxParser.DEC, 0); }
		public TerminalNode ADD() { return getToken(MxParser.ADD, 0); }
		public TerminalNode SUB() { return getToken(MxParser.SUB, 0); }
		public TerminalNode NOT() { return getToken(MxParser.NOT, 0); }
		public TerminalNode LNOT() { return getToken(MxParser.LNOT, 0); }
		public UnaryExpressionContext(ExpressionContext ctx) { copyFrom(ctx); }
	}

	public final ExpressionContext expression() throws RecognitionException {
		return expression(0);
	}

	private ExpressionContext expression(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		ExpressionContext _localctx = new ExpressionContext(_ctx, _parentState);
		ExpressionContext _prevctx = _localctx;
		int _startState = 28;
		enterRecursionRule(_localctx, 28, RULE_expression, _p);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(201);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,17,_ctx) ) {
			case 1:
				{
				_localctx = new IdentifierExpressionContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;

				setState(180);
				match(Identifier);
				}
				break;
			case 2:
				{
				_localctx = new ConstantExpressionContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(181);
				match(Constant);
				}
				break;
			case 3:
				{
				_localctx = new ThisExpressionContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(182);
				match(THIS);
				}
				break;
			case 4:
				{
				_localctx = new DeclarationExpressionContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(183);
				variableType();
				setState(184);
				match(Identifier);
				setState(187);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,16,_ctx) ) {
				case 1:
					{
					setState(185);
					match(ASSIGN);
					setState(186);
					expression(0);
					}
					break;
				}
				}
				break;
			case 5:
				{
				_localctx = new ParensExpressionContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(189);
				match(LPAREN);
				setState(190);
				expression(0);
				setState(191);
				match(RPAREN);
				}
				break;
			case 6:
				{
				_localctx = new NewExpressionContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(193);
				match(NEW);
				setState(194);
				creator();
				}
				break;
			case 7:
				{
				_localctx = new UnaryExpressionContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(195);
				((UnaryExpressionContext)_localctx).prefix = _input.LT(1);
				_la = _input.LA(1);
				if ( !(_la==INC || _la==DEC) ) {
					((UnaryExpressionContext)_localctx).prefix = (Token)_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(196);
				expression(14);
				}
				break;
			case 8:
				{
				_localctx = new UnaryExpressionContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(197);
				((UnaryExpressionContext)_localctx).prefix = _input.LT(1);
				_la = _input.LA(1);
				if ( !(_la==ADD || _la==SUB) ) {
					((UnaryExpressionContext)_localctx).prefix = (Token)_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(198);
				expression(13);
				}
				break;
			case 9:
				{
				_localctx = new UnaryExpressionContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(199);
				((UnaryExpressionContext)_localctx).prefix = _input.LT(1);
				_la = _input.LA(1);
				if ( !(_la==LNOT || _la==NOT) ) {
					((UnaryExpressionContext)_localctx).prefix = (Token)_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(200);
				expression(12);
				}
				break;
			}
			_ctx.stop = _input.LT(-1);
			setState(254);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,20,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					setState(252);
					_errHandler.sync(this);
					switch ( getInterpreter().adaptivePredict(_input,19,_ctx) ) {
					case 1:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExpressionContext)_localctx).lhs = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(203);
						if (!(precpred(_ctx, 11))) throw new FailedPredicateException(this, "precpred(_ctx, 11)");
						setState(204);
						((BinaryExpressionContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << MUL) | (1L << DIV) | (1L << MOD))) != 0)) ) {
							((BinaryExpressionContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(205);
						((BinaryExpressionContext)_localctx).rhs = expression(12);
						}
						break;
					case 2:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExpressionContext)_localctx).lhs = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(206);
						if (!(precpred(_ctx, 10))) throw new FailedPredicateException(this, "precpred(_ctx, 10)");
						setState(207);
						((BinaryExpressionContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==ADD || _la==SUB) ) {
							((BinaryExpressionContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(208);
						((BinaryExpressionContext)_localctx).rhs = expression(11);
						}
						break;
					case 3:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExpressionContext)_localctx).lhs = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(209);
						if (!(precpred(_ctx, 9))) throw new FailedPredicateException(this, "precpred(_ctx, 9)");
						setState(210);
						((BinaryExpressionContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==LSHIFT || _la==RSHIFT) ) {
							((BinaryExpressionContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(211);
						((BinaryExpressionContext)_localctx).rhs = expression(10);
						}
						break;
					case 4:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExpressionContext)_localctx).lhs = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(212);
						if (!(precpred(_ctx, 8))) throw new FailedPredicateException(this, "precpred(_ctx, 8)");
						setState(213);
						((BinaryExpressionContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << LT) | (1L << GT) | (1L << LE) | (1L << GE))) != 0)) ) {
							((BinaryExpressionContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(214);
						((BinaryExpressionContext)_localctx).rhs = expression(9);
						}
						break;
					case 5:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExpressionContext)_localctx).lhs = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(215);
						if (!(precpred(_ctx, 7))) throw new FailedPredicateException(this, "precpred(_ctx, 7)");
						setState(216);
						((BinaryExpressionContext)_localctx).op = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==EQUAL || _la==NOTEQUAL) ) {
							((BinaryExpressionContext)_localctx).op = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(217);
						((BinaryExpressionContext)_localctx).rhs = expression(8);
						}
						break;
					case 6:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExpressionContext)_localctx).lhs = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(218);
						if (!(precpred(_ctx, 6))) throw new FailedPredicateException(this, "precpred(_ctx, 6)");
						setState(219);
						((BinaryExpressionContext)_localctx).op = match(AND);
						setState(220);
						((BinaryExpressionContext)_localctx).rhs = expression(7);
						}
						break;
					case 7:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExpressionContext)_localctx).lhs = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(221);
						if (!(precpred(_ctx, 5))) throw new FailedPredicateException(this, "precpred(_ctx, 5)");
						setState(222);
						((BinaryExpressionContext)_localctx).op = match(XOR);
						setState(223);
						((BinaryExpressionContext)_localctx).rhs = expression(6);
						}
						break;
					case 8:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExpressionContext)_localctx).lhs = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(224);
						if (!(precpred(_ctx, 4))) throw new FailedPredicateException(this, "precpred(_ctx, 4)");
						setState(225);
						((BinaryExpressionContext)_localctx).op = match(OR);
						setState(226);
						((BinaryExpressionContext)_localctx).rhs = expression(5);
						}
						break;
					case 9:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExpressionContext)_localctx).lhs = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(227);
						if (!(precpred(_ctx, 3))) throw new FailedPredicateException(this, "precpred(_ctx, 3)");
						setState(228);
						((BinaryExpressionContext)_localctx).op = match(LAND);
						setState(229);
						((BinaryExpressionContext)_localctx).rhs = expression(4);
						}
						break;
					case 10:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExpressionContext)_localctx).lhs = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(230);
						if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
						setState(231);
						((BinaryExpressionContext)_localctx).op = match(LOR);
						setState(232);
						((BinaryExpressionContext)_localctx).rhs = expression(3);
						}
						break;
					case 11:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						((BinaryExpressionContext)_localctx).lhs = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(233);
						if (!(precpred(_ctx, 1))) throw new FailedPredicateException(this, "precpred(_ctx, 1)");
						setState(234);
						((BinaryExpressionContext)_localctx).op = match(ASSIGN);
						setState(235);
						((BinaryExpressionContext)_localctx).rhs = expression(2);
						}
						break;
					case 12:
						{
						_localctx = new MemberAccessExpressionContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(236);
						if (!(precpred(_ctx, 19))) throw new FailedPredicateException(this, "precpred(_ctx, 19)");
						setState(237);
						((MemberAccessExpressionContext)_localctx).op = match(DOT);
						setState(238);
						_la = _input.LA(1);
						if ( !(_la==THIS || _la==Identifier) ) {
						_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						}
						break;
					case 13:
						{
						_localctx = new IndexAccessExpressionContext(new ExpressionContext(_parentctx, _parentState));
						((IndexAccessExpressionContext)_localctx).caller = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(239);
						if (!(precpred(_ctx, 18))) throw new FailedPredicateException(this, "precpred(_ctx, 18)");
						setState(240);
						match(LBRACK);
						setState(241);
						((IndexAccessExpressionContext)_localctx).index = expression(0);
						setState(242);
						match(RBRACK);
						}
						break;
					case 14:
						{
						_localctx = new MethodCallExpressionContext(new ExpressionContext(_parentctx, _parentState));
						((MethodCallExpressionContext)_localctx).caller = _prevctx;
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(244);
						if (!(precpred(_ctx, 17))) throw new FailedPredicateException(this, "precpred(_ctx, 17)");
						setState(245);
						match(LPAREN);
						setState(247);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if (((((_la - 3)) & ~0x3f) == 0 && ((1L << (_la - 3)) & ((1L << (LPAREN - 3)) | (1L << (INC - 3)) | (1L << (DEC - 3)) | (1L << (ADD - 3)) | (1L << (SUB - 3)) | (1L << (LNOT - 3)) | (1L << (NOT - 3)) | (1L << (NEW - 3)) | (1L << (THIS - 3)) | (1L << (PrimitiveType - 3)) | (1L << (Constant - 3)) | (1L << (Identifier - 3)))) != 0)) {
							{
							setState(246);
							((MethodCallExpressionContext)_localctx).actual_parameter_list = actualParameterList();
							}
						}

						setState(249);
						match(RPAREN);
						}
						break;
					case 15:
						{
						_localctx = new UnaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(250);
						if (!(precpred(_ctx, 15))) throw new FailedPredicateException(this, "precpred(_ctx, 15)");
						setState(251);
						((UnaryExpressionContext)_localctx).postfix = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==INC || _la==DEC) ) {
							((UnaryExpressionContext)_localctx).postfix = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						}
						break;
					}
					} 
				}
				setState(256);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,20,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public static class CreatorContext extends ParserRuleContext {
		public VariableTypeContext variableType() {
			return getRuleContext(VariableTypeContext.class,0);
		}
		public ActualParameterListContext actualParameterList() {
			return getRuleContext(ActualParameterListContext.class,0);
		}
		public CreatorContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_creator; }
	}

	public final CreatorContext creator() throws RecognitionException {
		CreatorContext _localctx = new CreatorContext(_ctx, getState());
		enterRule(_localctx, 30, RULE_creator);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(257);
			variableType();
			setState(258);
			actualParameterList();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class VariableTypeContext extends ParserRuleContext {
		public VariableTypeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_variableType; }
	 
		public VariableTypeContext() { }
		public void copyFrom(VariableTypeContext ctx) {
			super.copyFrom(ctx);
		}
	}
	public static class NonArrayVariableTypeContext extends VariableTypeContext {
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public TerminalNode PrimitiveType() { return getToken(MxParser.PrimitiveType, 0); }
		public NonArrayVariableTypeContext(VariableTypeContext ctx) { copyFrom(ctx); }
	}
	public static class ArrayVariableTypeContext extends VariableTypeContext {
		public ArrayCreatorRestContext arrayCreatorRest() {
			return getRuleContext(ArrayCreatorRestContext.class,0);
		}
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public TerminalNode PrimitiveType() { return getToken(MxParser.PrimitiveType, 0); }
		public ArrayVariableTypeContext(VariableTypeContext ctx) { copyFrom(ctx); }
	}

	public final VariableTypeContext variableType() throws RecognitionException {
		VariableTypeContext _localctx = new VariableTypeContext(_ctx, getState());
		enterRule(_localctx, 32, RULE_variableType);
		int _la;
		try {
			setState(263);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,21,_ctx) ) {
			case 1:
				_localctx = new NonArrayVariableTypeContext(_localctx);
				enterOuterAlt(_localctx, 1);
				{
				setState(260);
				_la = _input.LA(1);
				if ( !(_la==PrimitiveType || _la==Identifier) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				}
				break;
			case 2:
				_localctx = new ArrayVariableTypeContext(_localctx);
				enterOuterAlt(_localctx, 2);
				{
				setState(261);
				_la = _input.LA(1);
				if ( !(_la==PrimitiveType || _la==Identifier) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(262);
				arrayCreatorRest();
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ArrayCreatorRestContext extends ParserRuleContext {
		public List<TerminalNode> LBRACK() { return getTokens(MxParser.LBRACK); }
		public TerminalNode LBRACK(int i) {
			return getToken(MxParser.LBRACK, i);
		}
		public List<TerminalNode> RBRACK() { return getTokens(MxParser.RBRACK); }
		public TerminalNode RBRACK(int i) {
			return getToken(MxParser.RBRACK, i);
		}
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public ArrayCreatorRestContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_arrayCreatorRest; }
	}

	public final ArrayCreatorRestContext arrayCreatorRest() throws RecognitionException {
		ArrayCreatorRestContext _localctx = new ArrayCreatorRestContext(_ctx, getState());
		enterRule(_localctx, 34, RULE_arrayCreatorRest);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(265);
			match(LBRACK);
			setState(292);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case RBRACK:
				{
				setState(266);
				match(RBRACK);
				setState(271);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==LBRACK) {
					{
					{
					setState(267);
					match(LBRACK);
					setState(268);
					match(RBRACK);
					}
					}
					setState(273);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				}
				break;
			case LPAREN:
			case INC:
			case DEC:
			case ADD:
			case SUB:
			case LNOT:
			case NOT:
			case NEW:
			case THIS:
			case PrimitiveType:
			case Constant:
			case Identifier:
				{
				setState(274);
				expression(0);
				setState(275);
				match(RBRACK);
				setState(282);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,23,_ctx);
				while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
					if ( _alt==1 ) {
						{
						{
						setState(276);
						match(LBRACK);
						setState(277);
						expression(0);
						setState(278);
						match(RBRACK);
						}
						} 
					}
					setState(284);
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,23,_ctx);
				}
				setState(289);
				_errHandler.sync(this);
				_la = _input.LA(1);
				while (_la==LBRACK) {
					{
					{
					setState(285);
					match(LBRACK);
					setState(286);
					match(RBRACK);
					}
					}
					setState(291);
					_errHandler.sync(this);
					_la = _input.LA(1);
				}
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExpressionListContext extends ParserRuleContext {
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public List<TerminalNode> COMMA() { return getTokens(MxParser.COMMA); }
		public TerminalNode COMMA(int i) {
			return getToken(MxParser.COMMA, i);
		}
		public ExpressionListContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expressionList; }
	}

	public final ExpressionListContext expressionList() throws RecognitionException {
		ExpressionListContext _localctx = new ExpressionListContext(_ctx, getState());
		enterRule(_localctx, 36, RULE_expressionList);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(294);
			expression(0);
			setState(299);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==COMMA) {
				{
				{
				setState(295);
				match(COMMA);
				setState(296);
				expression(0);
				}
				}
				setState(301);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public boolean sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 14:
			return expression_sempred((ExpressionContext)_localctx, predIndex);
		}
		return true;
	}
	private boolean expression_sempred(ExpressionContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return precpred(_ctx, 11);
		case 1:
			return precpred(_ctx, 10);
		case 2:
			return precpred(_ctx, 9);
		case 3:
			return precpred(_ctx, 8);
		case 4:
			return precpred(_ctx, 7);
		case 5:
			return precpred(_ctx, 6);
		case 6:
			return precpred(_ctx, 5);
		case 7:
			return precpred(_ctx, 4);
		case 8:
			return precpred(_ctx, 3);
		case 9:
			return precpred(_ctx, 2);
		case 10:
			return precpred(_ctx, 1);
		case 11:
			return precpred(_ctx, 19);
		case 12:
			return precpred(_ctx, 18);
		case 13:
			return precpred(_ctx, 17);
		case 14:
			return precpred(_ctx, 15);
		}
		return true;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3J\u0131\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\3\2\3\2\3\2\7\2,\n\2\f\2\16\2/\13\2\3\3\3\3\3\3\3"+
		"\3\3\3\3\3\3\4\7\48\n\4\f\4\16\4;\13\4\3\4\7\4>\n\4\f\4\16\4A\13\4\3\5"+
		"\3\5\3\5\3\5\3\6\3\6\5\6I\n\6\3\7\3\7\3\7\5\7N\n\7\3\7\3\7\3\7\3\b\3\b"+
		"\3\b\3\b\5\bW\n\b\3\b\3\b\3\b\3\b\3\b\3\t\3\t\3\t\7\ta\n\t\f\t\16\td\13"+
		"\t\3\n\3\n\3\n\3\n\5\nj\n\n\3\13\3\13\3\13\7\13o\n\13\f\13\16\13r\13\13"+
		"\3\f\7\fu\n\f\f\f\16\fx\13\f\3\r\3\r\7\r|\n\r\f\r\16\r\177\13\r\3\r\3"+
		"\r\3\16\3\16\5\16\u0085\n\16\3\17\3\17\3\17\3\17\5\17\u008b\n\17\3\17"+
		"\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\5\17\u0099\n\17"+
		"\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17"+
		"\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\5\17\u00b4\n\17"+
		"\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\5\20\u00be\n\20\3\20\3\20\3\20"+
		"\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\5\20\u00cc\n\20\3\20\3\20"+
		"\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20"+
		"\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20"+
		"\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20"+
		"\5\20\u00fa\n\20\3\20\3\20\3\20\7\20\u00ff\n\20\f\20\16\20\u0102\13\20"+
		"\3\21\3\21\3\21\3\22\3\22\3\22\5\22\u010a\n\22\3\23\3\23\3\23\3\23\7\23"+
		"\u0110\n\23\f\23\16\23\u0113\13\23\3\23\3\23\3\23\3\23\3\23\3\23\7\23"+
		"\u011b\n\23\f\23\16\23\u011e\13\23\3\23\3\23\7\23\u0122\n\23\f\23\16\23"+
		"\u0125\13\23\5\23\u0127\n\23\3\24\3\24\3\24\7\24\u012c\n\24\f\24\16\24"+
		"\u012f\13\24\3\24\2\3\36\25\2\4\6\b\n\f\16\20\22\24\26\30\32\34\36 \""+
		"$&\2\13\3\2\21\22\3\2\24\25\4\2\34\34  \3\2\26\30\3\2\36\37\4\2%&()\4"+
		"\2\'\'**\4\299DD\4\2::DD\2\u0154\2-\3\2\2\2\4\60\3\2\2\2\69\3\2\2\2\b"+
		"B\3\2\2\2\nH\3\2\2\2\fJ\3\2\2\2\16R\3\2\2\2\20]\3\2\2\2\22e\3\2\2\2\24"+
		"k\3\2\2\2\26v\3\2\2\2\30y\3\2\2\2\32\u0084\3\2\2\2\34\u00b3\3\2\2\2\36"+
		"\u00cb\3\2\2\2 \u0103\3\2\2\2\"\u0109\3\2\2\2$\u010b\3\2\2\2&\u0128\3"+
		"\2\2\2(,\5\4\3\2),\5\16\b\2*,\5\34\17\2+(\3\2\2\2+)\3\2\2\2+*\3\2\2\2"+
		",/\3\2\2\2-+\3\2\2\2-.\3\2\2\2.\3\3\2\2\2/-\3\2\2\2\60\61\7\67\2\2\61"+
		"\62\7D\2\2\62\63\7\7\2\2\63\64\5\6\4\2\64\65\7\b\2\2\65\5\3\2\2\2\668"+
		"\5\b\5\2\67\66\3\2\2\28;\3\2\2\29\67\3\2\2\29:\3\2\2\2:?\3\2\2\2;9\3\2"+
		"\2\2<>\5\n\6\2=<\3\2\2\2>A\3\2\2\2?=\3\2\2\2?@\3\2\2\2@\7\3\2\2\2A?\3"+
		"\2\2\2BC\5\"\22\2CD\7D\2\2DE\7\13\2\2E\t\3\2\2\2FI\5\f\7\2GI\5\16\b\2"+
		"HF\3\2\2\2HG\3\2\2\2I\13\3\2\2\2JK\7D\2\2KM\7\5\2\2LN\5\20\t\2ML\3\2\2"+
		"\2MN\3\2\2\2NO\3\2\2\2OP\7\6\2\2PQ\5\30\r\2Q\r\3\2\2\2RS\5\"\22\2ST\7"+
		"D\2\2TV\7\5\2\2UW\5\20\t\2VU\3\2\2\2VW\3\2\2\2WX\3\2\2\2XY\7\6\2\2YZ\7"+
		"\7\2\2Z[\5\26\f\2[\\\7\b\2\2\\\17\3\2\2\2]b\5\22\n\2^_\7\f\2\2_a\5\22"+
		"\n\2`^\3\2\2\2ad\3\2\2\2b`\3\2\2\2bc\3\2\2\2c\21\3\2\2\2db\3\2\2\2ef\5"+
		"\"\22\2fi\7D\2\2gh\7\17\2\2hj\5\36\20\2ig\3\2\2\2ij\3\2\2\2j\23\3\2\2"+
		"\2kp\5\36\20\2lm\7\f\2\2mo\5\36\20\2nl\3\2\2\2or\3\2\2\2pn\3\2\2\2pq\3"+
		"\2\2\2q\25\3\2\2\2rp\3\2\2\2su\5\34\17\2ts\3\2\2\2ux\3\2\2\2vt\3\2\2\2"+
		"vw\3\2\2\2w\27\3\2\2\2xv\3\2\2\2y}\7\7\2\2z|\5\34\17\2{z\3\2\2\2|\177"+
		"\3\2\2\2}{\3\2\2\2}~\3\2\2\2~\u0080\3\2\2\2\177}\3\2\2\2\u0080\u0081\7"+
		"\b\2\2\u0081\31\3\2\2\2\u0082\u0085\5\30\r\2\u0083\u0085\5\34\17\2\u0084"+
		"\u0082\3\2\2\2\u0084\u0083\3\2\2\2\u0085\33\3\2\2\2\u0086\u0087\5\"\22"+
		"\2\u0087\u008a\7D\2\2\u0088\u0089\7\17\2\2\u0089\u008b\5\36\20\2\u008a"+
		"\u0088\3\2\2\2\u008a\u008b\3\2\2\2\u008b\u008c\3\2\2\2\u008c\u008d\7\13"+
		"\2\2\u008d\u00b4\3\2\2\2\u008e\u008f\5&\24\2\u008f\u0090\7\13\2\2\u0090"+
		"\u00b4\3\2\2\2\u0091\u0092\7-\2\2\u0092\u0093\7\5\2\2\u0093\u0094\5\36"+
		"\20\2\u0094\u0095\7\6\2\2\u0095\u0098\5\32\16\2\u0096\u0097\7.\2\2\u0097"+
		"\u0099\5\32\16\2\u0098\u0096\3\2\2\2\u0098\u0099\3\2\2\2\u0099\u00b4\3"+
		"\2\2\2\u009a\u009b\7\60\2\2\u009b\u009c\7\5\2\2\u009c\u009d\5\36\20\2"+
		"\u009d\u009e\7\13\2\2\u009e\u009f\5\36\20\2\u009f\u00a0\7\13\2\2\u00a0"+
		"\u00a1\5\36\20\2\u00a1\u00a2\7\6\2\2\u00a2\u00a3\5\32\16\2\u00a3\u00b4"+
		"\3\2\2\2\u00a4\u00a5\7\61\2\2\u00a5\u00a6\7\5\2\2\u00a6\u00a7\5\36\20"+
		"\2\u00a7\u00a8\7\6\2\2\u00a8\u00a9\5\32\16\2\u00a9\u00b4\3\2\2\2\u00aa"+
		"\u00ab\7\65\2\2\u00ab\u00ac\5\36\20\2\u00ac\u00ad\7\13\2\2\u00ad\u00b4"+
		"\3\2\2\2\u00ae\u00af\7\63\2\2\u00af\u00b4\7\13\2\2\u00b0\u00b1\7\64\2"+
		"\2\u00b1\u00b4\7\13\2\2\u00b2\u00b4\7\13\2\2\u00b3\u0086\3\2\2\2\u00b3"+
		"\u008e\3\2\2\2\u00b3\u0091\3\2\2\2\u00b3\u009a\3\2\2\2\u00b3\u00a4\3\2"+
		"\2\2\u00b3\u00aa\3\2\2\2\u00b3\u00ae\3\2\2\2\u00b3\u00b0\3\2\2\2\u00b3"+
		"\u00b2\3\2\2\2\u00b4\35\3\2\2\2\u00b5\u00b6\b\20\1\2\u00b6\u00cc\7D\2"+
		"\2\u00b7\u00cc\7?\2\2\u00b8\u00cc\79\2\2\u00b9\u00ba\5\"\22\2\u00ba\u00bd"+
		"\7D\2\2\u00bb\u00bc\7\17\2\2\u00bc\u00be\5\36\20\2\u00bd\u00bb\3\2\2\2"+
		"\u00bd\u00be\3\2\2\2\u00be\u00cc\3\2\2\2\u00bf\u00c0\7\5\2\2\u00c0\u00c1"+
		"\5\36\20\2\u00c1\u00c2\7\6\2\2\u00c2\u00cc\3\2\2\2\u00c3\u00c4\78\2\2"+
		"\u00c4\u00cc\5 \21\2\u00c5\u00c6\t\2\2\2\u00c6\u00cc\5\36\20\20\u00c7"+
		"\u00c8\t\3\2\2\u00c8\u00cc\5\36\20\17\u00c9\u00ca\t\4\2\2\u00ca\u00cc"+
		"\5\36\20\16\u00cb\u00b5\3\2\2\2\u00cb\u00b7\3\2\2\2\u00cb\u00b8\3\2\2"+
		"\2\u00cb\u00b9\3\2\2\2\u00cb\u00bf\3\2\2\2\u00cb\u00c3\3\2\2\2\u00cb\u00c5"+
		"\3\2\2\2\u00cb\u00c7\3\2\2\2\u00cb\u00c9\3\2\2\2\u00cc\u0100\3\2\2\2\u00cd"+
		"\u00ce\f\r\2\2\u00ce\u00cf\t\5\2\2\u00cf\u00ff\5\36\20\16\u00d0\u00d1"+
		"\f\f\2\2\u00d1\u00d2\t\3\2\2\u00d2\u00ff\5\36\20\r\u00d3\u00d4\f\13\2"+
		"\2\u00d4\u00d5\t\6\2\2\u00d5\u00ff\5\36\20\f\u00d6\u00d7\f\n\2\2\u00d7"+
		"\u00d8\t\7\2\2\u00d8\u00ff\5\36\20\13\u00d9\u00da\f\t\2\2\u00da\u00db"+
		"\t\b\2\2\u00db\u00ff\5\36\20\n\u00dc\u00dd\f\b\2\2\u00dd\u00de\7\"\2\2"+
		"\u00de\u00ff\5\36\20\t\u00df\u00e0\f\7\2\2\u00e0\u00e1\7#\2\2\u00e1\u00ff"+
		"\5\36\20\b\u00e2\u00e3\f\6\2\2\u00e3\u00e4\7!\2\2\u00e4\u00ff\5\36\20"+
		"\7\u00e5\u00e6\f\5\2\2\u00e6\u00e7\7\32\2\2\u00e7\u00ff\5\36\20\6\u00e8"+
		"\u00e9\f\4\2\2\u00e9\u00ea\7\33\2\2\u00ea\u00ff\5\36\20\5\u00eb\u00ec"+
		"\f\3\2\2\u00ec\u00ed\7\17\2\2\u00ed\u00ff\5\36\20\4\u00ee\u00ef\f\25\2"+
		"\2\u00ef\u00f0\7\r\2\2\u00f0\u00ff\t\t\2\2\u00f1\u00f2\f\24\2\2\u00f2"+
		"\u00f3\7\t\2\2\u00f3\u00f4\5\36\20\2\u00f4\u00f5\7\n\2\2\u00f5\u00ff\3"+
		"\2\2\2\u00f6\u00f7\f\23\2\2\u00f7\u00f9\7\5\2\2\u00f8\u00fa\5\24\13\2"+
		"\u00f9\u00f8\3\2\2\2\u00f9\u00fa\3\2\2\2\u00fa\u00fb\3\2\2\2\u00fb\u00ff"+
		"\7\6\2\2\u00fc\u00fd\f\21\2\2\u00fd\u00ff\t\2\2\2\u00fe\u00cd\3\2\2\2"+
		"\u00fe\u00d0\3\2\2\2\u00fe\u00d3\3\2\2\2\u00fe\u00d6\3\2\2\2\u00fe\u00d9"+
		"\3\2\2\2\u00fe\u00dc\3\2\2\2\u00fe\u00df\3\2\2\2\u00fe\u00e2\3\2\2\2\u00fe"+
		"\u00e5\3\2\2\2\u00fe\u00e8\3\2\2\2\u00fe\u00eb\3\2\2\2\u00fe\u00ee\3\2"+
		"\2\2\u00fe\u00f1\3\2\2\2\u00fe\u00f6\3\2\2\2\u00fe\u00fc\3\2\2\2\u00ff"+
		"\u0102\3\2\2\2\u0100\u00fe\3\2\2\2\u0100\u0101\3\2\2\2\u0101\37\3\2\2"+
		"\2\u0102\u0100\3\2\2\2\u0103\u0104\5\"\22\2\u0104\u0105\5\24\13\2\u0105"+
		"!\3\2\2\2\u0106\u010a\t\n\2\2\u0107\u0108\t\n\2\2\u0108\u010a\5$\23\2"+
		"\u0109\u0106\3\2\2\2\u0109\u0107\3\2\2\2\u010a#\3\2\2\2\u010b\u0126\7"+
		"\t\2\2\u010c\u0111\7\n\2\2\u010d\u010e\7\t\2\2\u010e\u0110\7\n\2\2\u010f"+
		"\u010d\3\2\2\2\u0110\u0113\3\2\2\2\u0111\u010f\3\2\2\2\u0111\u0112\3\2"+
		"\2\2\u0112\u0127\3\2\2\2\u0113\u0111\3\2\2\2\u0114\u0115\5\36\20\2\u0115"+
		"\u011c\7\n\2\2\u0116\u0117\7\t\2\2\u0117\u0118\5\36\20\2\u0118\u0119\7"+
		"\n\2\2\u0119\u011b\3\2\2\2\u011a\u0116\3\2\2\2\u011b\u011e\3\2\2\2\u011c"+
		"\u011a\3\2\2\2\u011c\u011d\3\2\2\2\u011d\u0123\3\2\2\2\u011e\u011c\3\2"+
		"\2\2\u011f\u0120\7\t\2\2\u0120\u0122\7\n\2\2\u0121\u011f\3\2\2\2\u0122"+
		"\u0125\3\2\2\2\u0123\u0121\3\2\2\2\u0123\u0124\3\2\2\2\u0124\u0127\3\2"+
		"\2\2\u0125\u0123\3\2\2\2\u0126\u010c\3\2\2\2\u0126\u0114\3\2\2\2\u0127"+
		"%\3\2\2\2\u0128\u012d\5\36\20\2\u0129\u012a\7\f\2\2\u012a\u012c\5\36\20"+
		"\2\u012b\u0129\3\2\2\2\u012c\u012f\3\2\2\2\u012d\u012b\3\2\2\2\u012d\u012e"+
		"\3\2\2\2\u012e\'\3\2\2\2\u012f\u012d\3\2\2\2\35+-9?HMVbipv}\u0084\u008a"+
		"\u0098\u00b3\u00bd\u00cb\u00f9\u00fe\u0100\u0109\u0111\u011c\u0123\u0126"+
		"\u012d";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}