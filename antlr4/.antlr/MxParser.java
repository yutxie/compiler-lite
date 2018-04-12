// Generated from d:\Users\DELL\Desktop\compiler-lite\antlr4\MxParser.g4 by ANTLR 4.7.1
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
		CONTINUE=50, RETURN=51, ObjectiveWord=52, CLASS=53, NEW=54, THIS=55, VariableType=56, 
		BOOL=57, INT=58, STRING=59, VOID=60, Constant=61, LogicConstant=62, IntegerConstant=63, 
		StringConstant=64, NullConstant=65, Identifier=66, SpecialToken=67, WhiteSpace=68, 
		NewLine=69, Comment=70, LineComment=71, BlockComment=72;
	public static final int
		RULE_program = 0, RULE_classDef = 1, RULE_classBody = 2, RULE_memberVariable = 3, 
		RULE_memberMethod = 4, RULE_constructionMethod = 5, RULE_method = 6, RULE_formalParameterList = 7, 
		RULE_formalParameter = 8, RULE_actualParameterList = 9, RULE_methodBody = 10, 
		RULE_block = 11, RULE_blockOrStatement = 12, RULE_statement = 13, RULE_expression = 14, 
		RULE_creator = 15, RULE_expressionList = 16;
	public static final String[] ruleNames = {
		"program", "classDef", "classBody", "memberVariable", "memberMethod", 
		"constructionMethod", "method", "formalParameterList", "formalParameter", 
		"actualParameterList", "methodBody", "block", "blockOrStatement", "statement", 
		"expression", "creator", "expressionList"
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
		"RETURN", "ObjectiveWord", "CLASS", "NEW", "THIS", "VariableType", "BOOL", 
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
		public List<ClassDefContext> classDef() {
			return getRuleContexts(ClassDefContext.class);
		}
		public ClassDefContext classDef(int i) {
			return getRuleContext(ClassDefContext.class,i);
		}
		public List<MethodContext> method() {
			return getRuleContexts(MethodContext.class);
		}
		public MethodContext method(int i) {
			return getRuleContext(MethodContext.class,i);
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
			setState(38);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==CLASS || _la==VariableType) {
				{
				setState(36);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case CLASS:
					{
					setState(34);
					classDef();
					}
					break;
				case VariableType:
					{
					setState(35);
					method();
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				}
				setState(40);
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

	public static class ClassDefContext extends ParserRuleContext {
		public TerminalNode CLASS() { return getToken(MxParser.CLASS, 0); }
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public TerminalNode LBRACE() { return getToken(MxParser.LBRACE, 0); }
		public ClassBodyContext classBody() {
			return getRuleContext(ClassBodyContext.class,0);
		}
		public TerminalNode RBRACE() { return getToken(MxParser.RBRACE, 0); }
		public ClassDefContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_classDef; }
	}

	public final ClassDefContext classDef() throws RecognitionException {
		ClassDefContext _localctx = new ClassDefContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_classDef);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(41);
			match(CLASS);
			setState(42);
			match(Identifier);
			setState(43);
			match(LBRACE);
			setState(44);
			classBody();
			setState(45);
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
		public MemberMethodContext memberMethod() {
			return getRuleContext(MemberMethodContext.class,0);
		}
		public List<MemberVariableContext> memberVariable() {
			return getRuleContexts(MemberVariableContext.class);
		}
		public MemberVariableContext memberVariable(int i) {
			return getRuleContext(MemberVariableContext.class,i);
		}
		public ClassBodyContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_classBody; }
	}

	public final ClassBodyContext classBody() throws RecognitionException {
		ClassBodyContext _localctx = new ClassBodyContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_classBody);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(50);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,2,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					{
					{
					setState(47);
					memberVariable();
					}
					} 
				}
				setState(52);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,2,_ctx);
			}
			setState(53);
			memberMethod();
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
		public List<TerminalNode> Identifier() { return getTokens(MxParser.Identifier); }
		public TerminalNode Identifier(int i) {
			return getToken(MxParser.Identifier, i);
		}
		public TerminalNode SEMI() { return getToken(MxParser.SEMI, 0); }
		public TerminalNode VariableType() { return getToken(MxParser.VariableType, 0); }
		public MemberVariableContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_memberVariable; }
	}

	public final MemberVariableContext memberVariable() throws RecognitionException {
		MemberVariableContext _localctx = new MemberVariableContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_memberVariable);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(55);
			_la = _input.LA(1);
			if ( !(_la==VariableType || _la==Identifier) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			setState(56);
			match(Identifier);
			setState(57);
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
		public MethodContext method() {
			return getRuleContext(MethodContext.class,0);
		}
		public ConstructionMethodContext constructionMethod() {
			return getRuleContext(ConstructionMethodContext.class,0);
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
			setState(61);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case VariableType:
				enterOuterAlt(_localctx, 1);
				{
				setState(59);
				method();
				}
				break;
			case Identifier:
				enterOuterAlt(_localctx, 2);
				{
				setState(60);
				constructionMethod();
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

	public static class ConstructionMethodContext extends ParserRuleContext {
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public TerminalNode LPAREN() { return getToken(MxParser.LPAREN, 0); }
		public TerminalNode RPAREN() { return getToken(MxParser.RPAREN, 0); }
		public BlockContext block() {
			return getRuleContext(BlockContext.class,0);
		}
		public FormalParameterContext formalParameter() {
			return getRuleContext(FormalParameterContext.class,0);
		}
		public ConstructionMethodContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_constructionMethod; }
	}

	public final ConstructionMethodContext constructionMethod() throws RecognitionException {
		ConstructionMethodContext _localctx = new ConstructionMethodContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_constructionMethod);
		try {
			setState(73);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,4,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(63);
				match(Identifier);
				setState(64);
				match(LPAREN);
				setState(65);
				match(RPAREN);
				setState(66);
				block();
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(67);
				match(Identifier);
				setState(68);
				match(LPAREN);
				setState(69);
				formalParameter();
				setState(70);
				match(RPAREN);
				setState(71);
				block();
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

	public static class MethodContext extends ParserRuleContext {
		public TerminalNode VariableType() { return getToken(MxParser.VariableType, 0); }
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
		public MethodContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_method; }
	}

	public final MethodContext method() throws RecognitionException {
		MethodContext _localctx = new MethodContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_method);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(75);
			match(VariableType);
			setState(76);
			match(Identifier);
			setState(77);
			match(LPAREN);
			setState(79);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==VariableType) {
				{
				setState(78);
				formalParameterList();
				}
			}

			setState(81);
			match(RPAREN);
			setState(82);
			match(LBRACE);
			setState(83);
			methodBody();
			setState(84);
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
			setState(86);
			formalParameter();
			setState(91);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==COMMA) {
				{
				{
				setState(87);
				match(COMMA);
				setState(88);
				formalParameter();
				}
				}
				setState(93);
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
		public TerminalNode VariableType() { return getToken(MxParser.VariableType, 0); }
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
			setState(94);
			match(VariableType);
			setState(95);
			match(Identifier);
			setState(98);
			_errHandler.sync(this);
			_la = _input.LA(1);
			if (_la==ASSIGN) {
				{
				setState(96);
				match(ASSIGN);
				setState(97);
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
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(100);
			expression(0);
			setState(105);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==COMMA) {
				{
				{
				setState(101);
				match(COMMA);
				setState(102);
				expression(0);
				}
				}
				setState(107);
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
			setState(111);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (((((_la - 9)) & ~0x3f) == 0 && ((1L << (_la - 9)) & ((1L << (SEMI - 9)) | (1L << (INC - 9)) | (1L << (DEC - 9)) | (1L << (ADD - 9)) | (1L << (SUB - 9)) | (1L << (LNOT - 9)) | (1L << (NOT - 9)) | (1L << (IF - 9)) | (1L << (FOR - 9)) | (1L << (WHILE - 9)) | (1L << (BREAK - 9)) | (1L << (CONTINUE - 9)) | (1L << (RETURN - 9)) | (1L << (NEW - 9)) | (1L << (THIS - 9)) | (1L << (VariableType - 9)) | (1L << (Constant - 9)) | (1L << (Identifier - 9)))) != 0)) {
				{
				{
				setState(108);
				statement();
				}
				}
				setState(113);
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
			setState(114);
			match(LBRACE);
			setState(118);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (((((_la - 9)) & ~0x3f) == 0 && ((1L << (_la - 9)) & ((1L << (SEMI - 9)) | (1L << (INC - 9)) | (1L << (DEC - 9)) | (1L << (ADD - 9)) | (1L << (SUB - 9)) | (1L << (LNOT - 9)) | (1L << (NOT - 9)) | (1L << (IF - 9)) | (1L << (FOR - 9)) | (1L << (WHILE - 9)) | (1L << (BREAK - 9)) | (1L << (CONTINUE - 9)) | (1L << (RETURN - 9)) | (1L << (NEW - 9)) | (1L << (THIS - 9)) | (1L << (VariableType - 9)) | (1L << (Constant - 9)) | (1L << (Identifier - 9)))) != 0)) {
				{
				{
				setState(115);
				statement();
				}
				}
				setState(120);
				_errHandler.sync(this);
				_la = _input.LA(1);
			}
			setState(121);
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
			setState(125);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case LBRACE:
				enterOuterAlt(_localctx, 1);
				{
				setState(123);
				block();
				}
				break;
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
			case VariableType:
			case Constant:
			case Identifier:
				enterOuterAlt(_localctx, 2);
				{
				setState(124);
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
	public static class DeclarationStatementContext extends StatementContext {
		public TerminalNode SEMI() { return getToken(MxParser.SEMI, 0); }
		public TerminalNode VariableType() { return getToken(MxParser.VariableType, 0); }
		public List<TerminalNode> Identifier() { return getTokens(MxParser.Identifier); }
		public TerminalNode Identifier(int i) {
			return getToken(MxParser.Identifier, i);
		}
		public List<TerminalNode> ASSIGN() { return getTokens(MxParser.ASSIGN); }
		public TerminalNode ASSIGN(int i) {
			return getToken(MxParser.ASSIGN, i);
		}
		public List<ExpressionContext> expression() {
			return getRuleContexts(ExpressionContext.class);
		}
		public ExpressionContext expression(int i) {
			return getRuleContext(ExpressionContext.class,i);
		}
		public DeclarationStatementContext(StatementContext ctx) { copyFrom(ctx); }
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
			setState(175);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,15,_ctx) ) {
			case 1:
				_localctx = new DeclarationStatementContext(_localctx);
				enterOuterAlt(_localctx, 1);
				{
				setState(127);
				_la = _input.LA(1);
				if ( !(_la==VariableType || _la==Identifier) ) {
				_errHandler.recoverInline(this);
				}
				else {
					if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
					_errHandler.reportMatch(this);
					consume();
				}
				setState(133); 
				_errHandler.sync(this);
				_la = _input.LA(1);
				do {
					{
					{
					setState(128);
					match(Identifier);
					setState(131);
					_errHandler.sync(this);
					_la = _input.LA(1);
					if (_la==ASSIGN) {
						{
						setState(129);
						match(ASSIGN);
						setState(130);
						expression(0);
						}
					}

					}
					}
					setState(135); 
					_errHandler.sync(this);
					_la = _input.LA(1);
				} while ( _la==Identifier );
				setState(137);
				match(SEMI);
				}
				break;
			case 2:
				_localctx = new ExpressionStatementContext(_localctx);
				enterOuterAlt(_localctx, 2);
				{
				setState(138);
				expressionList();
				setState(139);
				match(SEMI);
				}
				break;
			case 3:
				_localctx = new IfStatementContext(_localctx);
				enterOuterAlt(_localctx, 3);
				{
				setState(141);
				match(IF);
				setState(142);
				match(LPAREN);
				setState(143);
				expression(0);
				setState(144);
				match(RPAREN);
				setState(145);
				blockOrStatement();
				setState(148);
				_errHandler.sync(this);
				switch ( getInterpreter().adaptivePredict(_input,14,_ctx) ) {
				case 1:
					{
					setState(146);
					match(ELSE);
					setState(147);
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
				setState(150);
				match(FOR);
				setState(151);
				match(LPAREN);
				setState(152);
				expression(0);
				setState(153);
				match(SEMI);
				setState(154);
				expression(0);
				setState(155);
				match(SEMI);
				setState(156);
				expression(0);
				setState(157);
				match(RPAREN);
				setState(158);
				blockOrStatement();
				}
				break;
			case 5:
				_localctx = new WhileStatementContext(_localctx);
				enterOuterAlt(_localctx, 5);
				{
				setState(160);
				match(WHILE);
				setState(161);
				match(LPAREN);
				setState(162);
				expression(0);
				setState(163);
				match(RPAREN);
				setState(164);
				blockOrStatement();
				}
				break;
			case 6:
				_localctx = new ReturnStatementContext(_localctx);
				enterOuterAlt(_localctx, 6);
				{
				setState(166);
				match(RETURN);
				setState(167);
				expression(0);
				setState(168);
				match(SEMI);
				}
				break;
			case 7:
				_localctx = new BreakStatementContext(_localctx);
				enterOuterAlt(_localctx, 7);
				{
				setState(170);
				match(BREAK);
				setState(171);
				match(SEMI);
				}
				break;
			case 8:
				_localctx = new ContinueStatementContext(_localctx);
				enterOuterAlt(_localctx, 8);
				{
				setState(172);
				match(CONTINUE);
				setState(173);
				match(SEMI);
				}
				break;
			case 9:
				_localctx = new EmptyStatementContext(_localctx);
				enterOuterAlt(_localctx, 9);
				{
				setState(174);
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
		public Token bop;
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
	public static class MemberAccessExpressionContext extends ExpressionContext {
		public Token bop;
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode DOT() { return getToken(MxParser.DOT, 0); }
		public TerminalNode Identifier() { return getToken(MxParser.Identifier, 0); }
		public TerminalNode THIS() { return getToken(MxParser.THIS, 0); }
		public MemberAccessExpressionContext(ExpressionContext ctx) { copyFrom(ctx); }
	}
	public static class MethodCallExpressionContext extends ExpressionContext {
		public ExpressionContext expression() {
			return getRuleContext(ExpressionContext.class,0);
		}
		public TerminalNode LPAREN() { return getToken(MxParser.LPAREN, 0); }
		public TerminalNode RPAREN() { return getToken(MxParser.RPAREN, 0); }
		public ActualParameterListContext actualParameterList() {
			return getRuleContext(ActualParameterListContext.class,0);
		}
		public MethodCallExpressionContext(ExpressionContext ctx) { copyFrom(ctx); }
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
			setState(189);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case Identifier:
				{
				_localctx = new IdentifierExpressionContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;

				setState(178);
				match(Identifier);
				}
				break;
			case Constant:
				{
				_localctx = new ConstantExpressionContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(179);
				match(Constant);
				}
				break;
			case THIS:
				{
				_localctx = new ThisExpressionContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(180);
				match(THIS);
				}
				break;
			case NEW:
				{
				_localctx = new NewExpressionContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(181);
				match(NEW);
				setState(182);
				creator();
				}
				break;
			case INC:
			case DEC:
				{
				_localctx = new UnaryExpressionContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(183);
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
				setState(184);
				expression(14);
				}
				break;
			case ADD:
			case SUB:
				{
				_localctx = new UnaryExpressionContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(185);
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
				setState(186);
				expression(13);
				}
				break;
			case LNOT:
			case NOT:
				{
				_localctx = new UnaryExpressionContext(_localctx);
				_ctx = _localctx;
				_prevctx = _localctx;
				setState(187);
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
				setState(188);
				expression(12);
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			_ctx.stop = _input.LT(-1);
			setState(237);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,19,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					setState(235);
					_errHandler.sync(this);
					switch ( getInterpreter().adaptivePredict(_input,18,_ctx) ) {
					case 1:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(191);
						if (!(precpred(_ctx, 11))) throw new FailedPredicateException(this, "precpred(_ctx, 11)");
						setState(192);
						((BinaryExpressionContext)_localctx).bop = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << MUL) | (1L << DIV) | (1L << MOD))) != 0)) ) {
							((BinaryExpressionContext)_localctx).bop = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(193);
						expression(12);
						}
						break;
					case 2:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(194);
						if (!(precpred(_ctx, 10))) throw new FailedPredicateException(this, "precpred(_ctx, 10)");
						setState(195);
						((BinaryExpressionContext)_localctx).bop = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==ADD || _la==SUB) ) {
							((BinaryExpressionContext)_localctx).bop = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(196);
						expression(11);
						}
						break;
					case 3:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(197);
						if (!(precpred(_ctx, 9))) throw new FailedPredicateException(this, "precpred(_ctx, 9)");
						setState(198);
						((BinaryExpressionContext)_localctx).bop = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==LSHIFT || _la==RSHIFT) ) {
							((BinaryExpressionContext)_localctx).bop = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(199);
						expression(10);
						}
						break;
					case 4:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(200);
						if (!(precpred(_ctx, 8))) throw new FailedPredicateException(this, "precpred(_ctx, 8)");
						setState(201);
						((BinaryExpressionContext)_localctx).bop = _input.LT(1);
						_la = _input.LA(1);
						if ( !((((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << LT) | (1L << GT) | (1L << LE) | (1L << GE))) != 0)) ) {
							((BinaryExpressionContext)_localctx).bop = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(202);
						expression(9);
						}
						break;
					case 5:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(203);
						if (!(precpred(_ctx, 7))) throw new FailedPredicateException(this, "precpred(_ctx, 7)");
						setState(204);
						((BinaryExpressionContext)_localctx).bop = _input.LT(1);
						_la = _input.LA(1);
						if ( !(_la==EQUAL || _la==NOTEQUAL) ) {
							((BinaryExpressionContext)_localctx).bop = (Token)_errHandler.recoverInline(this);
						}
						else {
							if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
							_errHandler.reportMatch(this);
							consume();
						}
						setState(205);
						expression(8);
						}
						break;
					case 6:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(206);
						if (!(precpred(_ctx, 6))) throw new FailedPredicateException(this, "precpred(_ctx, 6)");
						setState(207);
						((BinaryExpressionContext)_localctx).bop = match(AND);
						setState(208);
						expression(7);
						}
						break;
					case 7:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(209);
						if (!(precpred(_ctx, 5))) throw new FailedPredicateException(this, "precpred(_ctx, 5)");
						setState(210);
						((BinaryExpressionContext)_localctx).bop = match(XOR);
						setState(211);
						expression(6);
						}
						break;
					case 8:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(212);
						if (!(precpred(_ctx, 4))) throw new FailedPredicateException(this, "precpred(_ctx, 4)");
						setState(213);
						((BinaryExpressionContext)_localctx).bop = match(OR);
						setState(214);
						expression(5);
						}
						break;
					case 9:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(215);
						if (!(precpred(_ctx, 3))) throw new FailedPredicateException(this, "precpred(_ctx, 3)");
						setState(216);
						((BinaryExpressionContext)_localctx).bop = match(LAND);
						setState(217);
						expression(4);
						}
						break;
					case 10:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(218);
						if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
						setState(219);
						((BinaryExpressionContext)_localctx).bop = match(LOR);
						setState(220);
						expression(3);
						}
						break;
					case 11:
						{
						_localctx = new BinaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(221);
						if (!(precpred(_ctx, 1))) throw new FailedPredicateException(this, "precpred(_ctx, 1)");
						setState(222);
						((BinaryExpressionContext)_localctx).bop = match(ASSIGN);
						setState(223);
						expression(2);
						}
						break;
					case 12:
						{
						_localctx = new MemberAccessExpressionContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(224);
						if (!(precpred(_ctx, 18))) throw new FailedPredicateException(this, "precpred(_ctx, 18)");
						setState(225);
						((MemberAccessExpressionContext)_localctx).bop = match(DOT);
						setState(226);
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
						_localctx = new MethodCallExpressionContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(227);
						if (!(precpred(_ctx, 17))) throw new FailedPredicateException(this, "precpred(_ctx, 17)");
						setState(228);
						match(LPAREN);
						setState(230);
						_errHandler.sync(this);
						_la = _input.LA(1);
						if (((((_la - 15)) & ~0x3f) == 0 && ((1L << (_la - 15)) & ((1L << (INC - 15)) | (1L << (DEC - 15)) | (1L << (ADD - 15)) | (1L << (SUB - 15)) | (1L << (LNOT - 15)) | (1L << (NOT - 15)) | (1L << (NEW - 15)) | (1L << (THIS - 15)) | (1L << (Constant - 15)) | (1L << (Identifier - 15)))) != 0)) {
							{
							setState(229);
							actualParameterList();
							}
						}

						setState(232);
						match(RPAREN);
						}
						break;
					case 14:
						{
						_localctx = new UnaryExpressionContext(new ExpressionContext(_parentctx, _parentState));
						pushNewRecursionContext(_localctx, _startState, RULE_expression);
						setState(233);
						if (!(precpred(_ctx, 15))) throw new FailedPredicateException(this, "precpred(_ctx, 15)");
						setState(234);
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
				setState(239);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,19,_ctx);
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
		enterRule(_localctx, 32, RULE_expressionList);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(242);
			expression(0);
			setState(247);
			_errHandler.sync(this);
			_la = _input.LA(1);
			while (_la==COMMA) {
				{
				{
				setState(243);
				match(COMMA);
				setState(244);
				expression(0);
				}
				}
				setState(249);
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
			return precpred(_ctx, 18);
		case 12:
			return precpred(_ctx, 17);
		case 13:
			return precpred(_ctx, 15);
		}
		return true;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3J\u00fd\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\3\2\3\2\7\2\'\n\2\f\2\16\2*\13\2\3\3\3\3\3\3\3\3\3\3\3\3\3\4\7\4\63\n"+
		"\4\f\4\16\4\66\13\4\3\4\3\4\3\5\3\5\3\5\3\5\3\6\3\6\5\6@\n\6\3\7\3\7\3"+
		"\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\5\7L\n\7\3\b\3\b\3\b\3\b\5\bR\n\b\3\b\3"+
		"\b\3\b\3\b\3\b\3\t\3\t\3\t\7\t\\\n\t\f\t\16\t_\13\t\3\n\3\n\3\n\3\n\5"+
		"\ne\n\n\3\13\3\13\3\13\7\13j\n\13\f\13\16\13m\13\13\3\f\7\fp\n\f\f\f\16"+
		"\fs\13\f\3\r\3\r\7\rw\n\r\f\r\16\rz\13\r\3\r\3\r\3\16\3\16\5\16\u0080"+
		"\n\16\3\17\3\17\3\17\3\17\5\17\u0086\n\17\6\17\u0088\n\17\r\17\16\17\u0089"+
		"\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\5\17\u0097\n\17"+
		"\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17"+
		"\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\5\17\u00b2\n\17"+
		"\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\5\20\u00c0"+
		"\n\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20"+
		"\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20"+
		"\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\5\20\u00e9"+
		"\n\20\3\20\3\20\3\20\7\20\u00ee\n\20\f\20\16\20\u00f1\13\20\3\21\3\21"+
		"\3\22\3\22\3\22\7\22\u00f8\n\22\f\22\16\22\u00fb\13\22\3\22\2\3\36\23"+
		"\2\4\6\b\n\f\16\20\22\24\26\30\32\34\36 \"\2\13\4\2::DD\3\2\21\22\3\2"+
		"\24\25\4\2\34\34  \3\2\26\30\3\2\36\37\4\2%&()\4\2\'\'**\4\299DD\2\u0118"+
		"\2(\3\2\2\2\4+\3\2\2\2\6\64\3\2\2\2\b9\3\2\2\2\n?\3\2\2\2\fK\3\2\2\2\16"+
		"M\3\2\2\2\20X\3\2\2\2\22`\3\2\2\2\24f\3\2\2\2\26q\3\2\2\2\30t\3\2\2\2"+
		"\32\177\3\2\2\2\34\u00b1\3\2\2\2\36\u00bf\3\2\2\2 \u00f2\3\2\2\2\"\u00f4"+
		"\3\2\2\2$\'\5\4\3\2%\'\5\16\b\2&$\3\2\2\2&%\3\2\2\2\'*\3\2\2\2(&\3\2\2"+
		"\2()\3\2\2\2)\3\3\2\2\2*(\3\2\2\2+,\7\67\2\2,-\7D\2\2-.\7\7\2\2./\5\6"+
		"\4\2/\60\7\b\2\2\60\5\3\2\2\2\61\63\5\b\5\2\62\61\3\2\2\2\63\66\3\2\2"+
		"\2\64\62\3\2\2\2\64\65\3\2\2\2\65\67\3\2\2\2\66\64\3\2\2\2\678\5\n\6\2"+
		"8\7\3\2\2\29:\t\2\2\2:;\7D\2\2;<\7\13\2\2<\t\3\2\2\2=@\5\16\b\2>@\5\f"+
		"\7\2?=\3\2\2\2?>\3\2\2\2@\13\3\2\2\2AB\7D\2\2BC\7\5\2\2CD\7\6\2\2DL\5"+
		"\30\r\2EF\7D\2\2FG\7\5\2\2GH\5\22\n\2HI\7\6\2\2IJ\5\30\r\2JL\3\2\2\2K"+
		"A\3\2\2\2KE\3\2\2\2L\r\3\2\2\2MN\7:\2\2NO\7D\2\2OQ\7\5\2\2PR\5\20\t\2"+
		"QP\3\2\2\2QR\3\2\2\2RS\3\2\2\2ST\7\6\2\2TU\7\7\2\2UV\5\26\f\2VW\7\b\2"+
		"\2W\17\3\2\2\2X]\5\22\n\2YZ\7\f\2\2Z\\\5\22\n\2[Y\3\2\2\2\\_\3\2\2\2]"+
		"[\3\2\2\2]^\3\2\2\2^\21\3\2\2\2_]\3\2\2\2`a\7:\2\2ad\7D\2\2bc\7\17\2\2"+
		"ce\5\36\20\2db\3\2\2\2de\3\2\2\2e\23\3\2\2\2fk\5\36\20\2gh\7\f\2\2hj\5"+
		"\36\20\2ig\3\2\2\2jm\3\2\2\2ki\3\2\2\2kl\3\2\2\2l\25\3\2\2\2mk\3\2\2\2"+
		"np\5\34\17\2on\3\2\2\2ps\3\2\2\2qo\3\2\2\2qr\3\2\2\2r\27\3\2\2\2sq\3\2"+
		"\2\2tx\7\7\2\2uw\5\34\17\2vu\3\2\2\2wz\3\2\2\2xv\3\2\2\2xy\3\2\2\2y{\3"+
		"\2\2\2zx\3\2\2\2{|\7\b\2\2|\31\3\2\2\2}\u0080\5\30\r\2~\u0080\5\34\17"+
		"\2\177}\3\2\2\2\177~\3\2\2\2\u0080\33\3\2\2\2\u0081\u0087\t\2\2\2\u0082"+
		"\u0085\7D\2\2\u0083\u0084\7\17\2\2\u0084\u0086\5\36\20\2\u0085\u0083\3"+
		"\2\2\2\u0085\u0086\3\2\2\2\u0086\u0088\3\2\2\2\u0087\u0082\3\2\2\2\u0088"+
		"\u0089\3\2\2\2\u0089\u0087\3\2\2\2\u0089\u008a\3\2\2\2\u008a\u008b\3\2"+
		"\2\2\u008b\u00b2\7\13\2\2\u008c\u008d\5\"\22\2\u008d\u008e\7\13\2\2\u008e"+
		"\u00b2\3\2\2\2\u008f\u0090\7-\2\2\u0090\u0091\7\5\2\2\u0091\u0092\5\36"+
		"\20\2\u0092\u0093\7\6\2\2\u0093\u0096\5\32\16\2\u0094\u0095\7.\2\2\u0095"+
		"\u0097\5\32\16\2\u0096\u0094\3\2\2\2\u0096\u0097\3\2\2\2\u0097\u00b2\3"+
		"\2\2\2\u0098\u0099\7\60\2\2\u0099\u009a\7\5\2\2\u009a\u009b\5\36\20\2"+
		"\u009b\u009c\7\13\2\2\u009c\u009d\5\36\20\2\u009d\u009e\7\13\2\2\u009e"+
		"\u009f\5\36\20\2\u009f\u00a0\7\6\2\2\u00a0\u00a1\5\32\16\2\u00a1\u00b2"+
		"\3\2\2\2\u00a2\u00a3\7\61\2\2\u00a3\u00a4\7\5\2\2\u00a4\u00a5\5\36\20"+
		"\2\u00a5\u00a6\7\6\2\2\u00a6\u00a7\5\32\16\2\u00a7\u00b2\3\2\2\2\u00a8"+
		"\u00a9\7\65\2\2\u00a9\u00aa\5\36\20\2\u00aa\u00ab\7\13\2\2\u00ab\u00b2"+
		"\3\2\2\2\u00ac\u00ad\7\63\2\2\u00ad\u00b2\7\13\2\2\u00ae\u00af\7\64\2"+
		"\2\u00af\u00b2\7\13\2\2\u00b0\u00b2\7\13\2\2\u00b1\u0081\3\2\2\2\u00b1"+
		"\u008c\3\2\2\2\u00b1\u008f\3\2\2\2\u00b1\u0098\3\2\2\2\u00b1\u00a2\3\2"+
		"\2\2\u00b1\u00a8\3\2\2\2\u00b1\u00ac\3\2\2\2\u00b1\u00ae\3\2\2\2\u00b1"+
		"\u00b0\3\2\2\2\u00b2\35\3\2\2\2\u00b3\u00b4\b\20\1\2\u00b4\u00c0\7D\2"+
		"\2\u00b5\u00c0\7?\2\2\u00b6\u00c0\79\2\2\u00b7\u00b8\78\2\2\u00b8\u00c0"+
		"\5 \21\2\u00b9\u00ba\t\3\2\2\u00ba\u00c0\5\36\20\20\u00bb\u00bc\t\4\2"+
		"\2\u00bc\u00c0\5\36\20\17\u00bd\u00be\t\5\2\2\u00be\u00c0\5\36\20\16\u00bf"+
		"\u00b3\3\2\2\2\u00bf\u00b5\3\2\2\2\u00bf\u00b6\3\2\2\2\u00bf\u00b7\3\2"+
		"\2\2\u00bf\u00b9\3\2\2\2\u00bf\u00bb\3\2\2\2\u00bf\u00bd\3\2\2\2\u00c0"+
		"\u00ef\3\2\2\2\u00c1\u00c2\f\r\2\2\u00c2\u00c3\t\6\2\2\u00c3\u00ee\5\36"+
		"\20\16\u00c4\u00c5\f\f\2\2\u00c5\u00c6\t\4\2\2\u00c6\u00ee\5\36\20\r\u00c7"+
		"\u00c8\f\13\2\2\u00c8\u00c9\t\7\2\2\u00c9\u00ee\5\36\20\f\u00ca\u00cb"+
		"\f\n\2\2\u00cb\u00cc\t\b\2\2\u00cc\u00ee\5\36\20\13\u00cd\u00ce\f\t\2"+
		"\2\u00ce\u00cf\t\t\2\2\u00cf\u00ee\5\36\20\n\u00d0\u00d1\f\b\2\2\u00d1"+
		"\u00d2\7\"\2\2\u00d2\u00ee\5\36\20\t\u00d3\u00d4\f\7\2\2\u00d4\u00d5\7"+
		"#\2\2\u00d5\u00ee\5\36\20\b\u00d6\u00d7\f\6\2\2\u00d7\u00d8\7!\2\2\u00d8"+
		"\u00ee\5\36\20\7\u00d9\u00da\f\5\2\2\u00da\u00db\7\32\2\2\u00db\u00ee"+
		"\5\36\20\6\u00dc\u00dd\f\4\2\2\u00dd\u00de\7\33\2\2\u00de\u00ee\5\36\20"+
		"\5\u00df\u00e0\f\3\2\2\u00e0\u00e1\7\17\2\2\u00e1\u00ee\5\36\20\4\u00e2"+
		"\u00e3\f\24\2\2\u00e3\u00e4\7\r\2\2\u00e4\u00ee\t\n\2\2\u00e5\u00e6\f"+
		"\23\2\2\u00e6\u00e8\7\5\2\2\u00e7\u00e9\5\24\13\2\u00e8\u00e7\3\2\2\2"+
		"\u00e8\u00e9\3\2\2\2\u00e9\u00ea\3\2\2\2\u00ea\u00ee\7\6\2\2\u00eb\u00ec"+
		"\f\21\2\2\u00ec\u00ee\t\3\2\2\u00ed\u00c1\3\2\2\2\u00ed\u00c4\3\2\2\2"+
		"\u00ed\u00c7\3\2\2\2\u00ed\u00ca\3\2\2\2\u00ed\u00cd\3\2\2\2\u00ed\u00d0"+
		"\3\2\2\2\u00ed\u00d3\3\2\2\2\u00ed\u00d6\3\2\2\2\u00ed\u00d9\3\2\2\2\u00ed"+
		"\u00dc\3\2\2\2\u00ed\u00df\3\2\2\2\u00ed\u00e2\3\2\2\2\u00ed\u00e5\3\2"+
		"\2\2\u00ed\u00eb\3\2\2\2\u00ee\u00f1\3\2\2\2\u00ef\u00ed\3\2\2\2\u00ef"+
		"\u00f0\3\2\2\2\u00f0\37\3\2\2\2\u00f1\u00ef\3\2\2\2\u00f2\u00f3\3\2\2"+
		"\2\u00f3!\3\2\2\2\u00f4\u00f9\5\36\20\2\u00f5\u00f6\7\f\2\2\u00f6\u00f8"+
		"\5\36\20\2\u00f7\u00f5\3\2\2\2\u00f8\u00fb\3\2\2\2\u00f9\u00f7\3\2\2\2"+
		"\u00f9\u00fa\3\2\2\2\u00fa#\3\2\2\2\u00fb\u00f9\3\2\2\2\27&(\64?KQ]dk"+
		"qx\177\u0085\u0089\u0096\u00b1\u00bf\u00e8\u00ed\u00ef\u00f9";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}