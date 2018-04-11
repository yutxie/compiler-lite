// Generated from d:\Users\DELL\Desktop\compiler-lite\antlr4\MxLexer.g4 by ANTLR 4.7.1
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class MxLexer extends Lexer {
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
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	public static final String[] ruleNames = {
		"Operator", "SeparatorOperator", "LPAREN", "RPAREN", "LBRACE", "RBRACE", 
		"LBRACK", "RBRACK", "SEMI", "COMMA", "DOT", "AssignmentOperator", "ASSIGN", 
		"InDecreaseOperator", "INC", "DEC", "ArithmeticOperator", "ADD", "SUB", 
		"MUL", "DIV", "MOD", "LogicOperator", "LAND", "LOR", "LNOT", "BitOperator", 
		"LSHIFT", "RSHIFT", "NOT", "OR", "AND", "XOR", "RelationshipOperator", 
		"LT", "GT", "EQUAL", "LE", "GE", "NOTEQUAL", "Keyword", "ConditionWord", 
		"IF", "ELSE", "LoopWord", "FOR", "WHILE", "JumpWord", "BREAK", "CONTINUE", 
		"RETURN", "ObjectiveWord", "CLASS", "NEW", "THIS", "VariableType", "BOOL", 
		"INT", "STRING", "VOID", "Constant", "LogicConstant", "IntegerConstant", 
		"DecimalConstant", "StringConstant", "EscapeSequence", "NullConstant", 
		"Identifier", "SpecialToken", "WhiteSpace", "NewLine", "Comment", "LineComment", 
		"BlockComment"
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


	public MxLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "MxLexer.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2J\u01e7\b\1\4\2\t"+
		"\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13"+
		"\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t \4!"+
		"\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t+\4"+
		",\t,\4-\t-\4.\t.\4/\t/\4\60\t\60\4\61\t\61\4\62\t\62\4\63\t\63\4\64\t"+
		"\64\4\65\t\65\4\66\t\66\4\67\t\67\48\t8\49\t9\4:\t:\4;\t;\4<\t<\4=\t="+
		"\4>\t>\4?\t?\4@\t@\4A\tA\4B\tB\4C\tC\4D\tD\4E\tE\4F\tF\4G\tG\4H\tH\4I"+
		"\tI\4J\tJ\4K\tK\3\2\3\2\3\2\3\2\3\2\3\2\3\2\5\2\u009f\n\2\3\3\3\3\3\3"+
		"\3\3\3\3\3\3\3\3\3\3\3\3\5\3\u00aa\n\3\3\4\3\4\3\5\3\5\3\6\3\6\3\7\3\7"+
		"\3\b\3\b\3\t\3\t\3\n\3\n\3\13\3\13\3\f\3\f\3\r\3\r\3\16\3\16\3\17\3\17"+
		"\5\17\u00c4\n\17\3\20\3\20\3\20\3\21\3\21\3\21\3\22\3\22\3\22\3\22\3\22"+
		"\5\22\u00d1\n\22\3\23\3\23\3\24\3\24\3\25\3\25\3\26\3\26\3\27\3\27\3\30"+
		"\3\30\3\30\5\30\u00e0\n\30\3\31\3\31\3\31\3\32\3\32\3\32\3\33\3\33\3\34"+
		"\3\34\3\34\3\34\3\34\3\34\5\34\u00f0\n\34\3\35\3\35\3\35\3\36\3\36\3\36"+
		"\3\37\3\37\3 \3 \3!\3!\3\"\3\"\3#\3#\3#\3#\3#\3#\5#\u0106\n#\3$\3$\3%"+
		"\3%\3&\3&\3&\3\'\3\'\3\'\3(\3(\3(\3)\3)\3)\3*\3*\3*\3*\3*\3*\3*\5*\u011f"+
		"\n*\3+\3+\5+\u0123\n+\3,\3,\3,\3-\3-\3-\3-\3-\3.\3.\5.\u012f\n.\3/\3/"+
		"\3/\3/\3\60\3\60\3\60\3\60\3\60\3\60\3\61\3\61\3\61\5\61\u013e\n\61\3"+
		"\62\3\62\3\62\3\62\3\62\3\62\3\63\3\63\3\63\3\63\3\63\3\63\3\63\3\63\3"+
		"\63\3\64\3\64\3\64\3\64\3\64\3\64\3\64\3\65\3\65\3\65\5\65\u0159\n\65"+
		"\3\66\3\66\3\66\3\66\3\66\3\66\3\67\3\67\3\67\3\67\38\38\38\38\38\39\3"+
		"9\39\39\59\u016e\n9\3:\3:\3:\3:\3:\3;\3;\3;\3;\3<\3<\3<\3<\3<\3<\3<\3"+
		"=\3=\3=\3=\3=\3>\3>\3>\3>\5>\u0189\n>\3?\3?\3?\3?\3?\3?\3?\3?\3?\5?\u0194"+
		"\n?\3@\3@\3A\3A\7A\u019a\nA\fA\16A\u019d\13A\3B\3B\3B\7B\u01a2\nB\fB\16"+
		"B\u01a5\13B\3B\3B\3C\3C\3C\3D\3D\3D\3D\3D\3E\3E\7E\u01b3\nE\fE\16E\u01b6"+
		"\13E\3F\3F\3F\5F\u01bb\nF\3G\6G\u01be\nG\rG\16G\u01bf\3G\3G\3H\6H\u01c5"+
		"\nH\rH\16H\u01c6\3H\3H\3I\3I\5I\u01cd\nI\3J\3J\3J\3J\7J\u01d3\nJ\fJ\16"+
		"J\u01d6\13J\3J\3J\3K\3K\3K\3K\7K\u01de\nK\fK\16K\u01e1\13K\3K\3K\3K\3"+
		"K\3K\3\u01df\2L\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13\25\f\27\r\31"+
		"\16\33\17\35\20\37\21!\22#\23%\24\'\25)\26+\27-\30/\31\61\32\63\33\65"+
		"\34\67\359\36;\37= ?!A\"C#E$G%I&K\'M(O)Q*S+U,W-Y.[/]\60_\61a\62c\63e\64"+
		"g\65i\66k\67m8o9q:s;u<w=y>{?}@\177A\u0081\2\u0083B\u0085\2\u0087C\u0089"+
		"D\u008bE\u008dF\u008fG\u0091H\u0093I\u0095J\3\2\n\3\2\63;\3\2\62;\6\2"+
		"\f\f\17\17$$^^\n\2$$))^^ddhhppttvv\4\2C\\c|\6\2\62;C\\aac|\4\2\13\13\""+
		"\"\4\2\f\f\17\17\2\u0221\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2"+
		"\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2\25"+
		"\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37\3\2"+
		"\2\2\2!\3\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2\2\2\2)\3\2\2\2\2+\3\2\2"+
		"\2\2-\3\2\2\2\2/\3\2\2\2\2\61\3\2\2\2\2\63\3\2\2\2\2\65\3\2\2\2\2\67\3"+
		"\2\2\2\29\3\2\2\2\2;\3\2\2\2\2=\3\2\2\2\2?\3\2\2\2\2A\3\2\2\2\2C\3\2\2"+
		"\2\2E\3\2\2\2\2G\3\2\2\2\2I\3\2\2\2\2K\3\2\2\2\2M\3\2\2\2\2O\3\2\2\2\2"+
		"Q\3\2\2\2\2S\3\2\2\2\2U\3\2\2\2\2W\3\2\2\2\2Y\3\2\2\2\2[\3\2\2\2\2]\3"+
		"\2\2\2\2_\3\2\2\2\2a\3\2\2\2\2c\3\2\2\2\2e\3\2\2\2\2g\3\2\2\2\2i\3\2\2"+
		"\2\2k\3\2\2\2\2m\3\2\2\2\2o\3\2\2\2\2q\3\2\2\2\2s\3\2\2\2\2u\3\2\2\2\2"+
		"w\3\2\2\2\2y\3\2\2\2\2{\3\2\2\2\2}\3\2\2\2\2\177\3\2\2\2\2\u0083\3\2\2"+
		"\2\2\u0087\3\2\2\2\2\u0089\3\2\2\2\2\u008b\3\2\2\2\2\u008d\3\2\2\2\2\u008f"+
		"\3\2\2\2\2\u0091\3\2\2\2\2\u0093\3\2\2\2\2\u0095\3\2\2\2\3\u009e\3\2\2"+
		"\2\5\u00a9\3\2\2\2\7\u00ab\3\2\2\2\t\u00ad\3\2\2\2\13\u00af\3\2\2\2\r"+
		"\u00b1\3\2\2\2\17\u00b3\3\2\2\2\21\u00b5\3\2\2\2\23\u00b7\3\2\2\2\25\u00b9"+
		"\3\2\2\2\27\u00bb\3\2\2\2\31\u00bd\3\2\2\2\33\u00bf\3\2\2\2\35\u00c3\3"+
		"\2\2\2\37\u00c5\3\2\2\2!\u00c8\3\2\2\2#\u00d0\3\2\2\2%\u00d2\3\2\2\2\'"+
		"\u00d4\3\2\2\2)\u00d6\3\2\2\2+\u00d8\3\2\2\2-\u00da\3\2\2\2/\u00df\3\2"+
		"\2\2\61\u00e1\3\2\2\2\63\u00e4\3\2\2\2\65\u00e7\3\2\2\2\67\u00ef\3\2\2"+
		"\29\u00f1\3\2\2\2;\u00f4\3\2\2\2=\u00f7\3\2\2\2?\u00f9\3\2\2\2A\u00fb"+
		"\3\2\2\2C\u00fd\3\2\2\2E\u0105\3\2\2\2G\u0107\3\2\2\2I\u0109\3\2\2\2K"+
		"\u010b\3\2\2\2M\u010e\3\2\2\2O\u0111\3\2\2\2Q\u0114\3\2\2\2S\u011e\3\2"+
		"\2\2U\u0122\3\2\2\2W\u0124\3\2\2\2Y\u0127\3\2\2\2[\u012e\3\2\2\2]\u0130"+
		"\3\2\2\2_\u0134\3\2\2\2a\u013d\3\2\2\2c\u013f\3\2\2\2e\u0145\3\2\2\2g"+
		"\u014e\3\2\2\2i\u0158\3\2\2\2k\u015a\3\2\2\2m\u0160\3\2\2\2o\u0164\3\2"+
		"\2\2q\u016d\3\2\2\2s\u016f\3\2\2\2u\u0174\3\2\2\2w\u0178\3\2\2\2y\u017f"+
		"\3\2\2\2{\u0188\3\2\2\2}\u0193\3\2\2\2\177\u0195\3\2\2\2\u0081\u0197\3"+
		"\2\2\2\u0083\u019e\3\2\2\2\u0085\u01a8\3\2\2\2\u0087\u01ab\3\2\2\2\u0089"+
		"\u01b0\3\2\2\2\u008b\u01ba\3\2\2\2\u008d\u01bd\3\2\2\2\u008f\u01c4\3\2"+
		"\2\2\u0091\u01cc\3\2\2\2\u0093\u01ce\3\2\2\2\u0095\u01d9\3\2\2\2\u0097"+
		"\u009f\5\5\3\2\u0098\u009f\5\31\r\2\u0099\u009f\5\35\17\2\u009a\u009f"+
		"\5#\22\2\u009b\u009f\5/\30\2\u009c\u009f\5\67\34\2\u009d\u009f\5E#\2\u009e"+
		"\u0097\3\2\2\2\u009e\u0098\3\2\2\2\u009e\u0099\3\2\2\2\u009e\u009a\3\2"+
		"\2\2\u009e\u009b\3\2\2\2\u009e\u009c\3\2\2\2\u009e\u009d\3\2\2\2\u009f"+
		"\4\3\2\2\2\u00a0\u00aa\5\7\4\2\u00a1\u00aa\5\t\5\2\u00a2\u00aa\5\13\6"+
		"\2\u00a3\u00aa\5\r\7\2\u00a4\u00aa\5\17\b\2\u00a5\u00aa\5\21\t\2\u00a6"+
		"\u00aa\5\23\n\2\u00a7\u00aa\5\25\13\2\u00a8\u00aa\5\27\f\2\u00a9\u00a0"+
		"\3\2\2\2\u00a9\u00a1\3\2\2\2\u00a9\u00a2\3\2\2\2\u00a9\u00a3\3\2\2\2\u00a9"+
		"\u00a4\3\2\2\2\u00a9\u00a5\3\2\2\2\u00a9\u00a6\3\2\2\2\u00a9\u00a7\3\2"+
		"\2\2\u00a9\u00a8\3\2\2\2\u00aa\6\3\2\2\2\u00ab\u00ac\7*\2\2\u00ac\b\3"+
		"\2\2\2\u00ad\u00ae\7+\2\2\u00ae\n\3\2\2\2\u00af\u00b0\7}\2\2\u00b0\f\3"+
		"\2\2\2\u00b1\u00b2\7\177\2\2\u00b2\16\3\2\2\2\u00b3\u00b4\7]\2\2\u00b4"+
		"\20\3\2\2\2\u00b5\u00b6\7_\2\2\u00b6\22\3\2\2\2\u00b7\u00b8\7=\2\2\u00b8"+
		"\24\3\2\2\2\u00b9\u00ba\7.\2\2\u00ba\26\3\2\2\2\u00bb\u00bc\7\60\2\2\u00bc"+
		"\30\3\2\2\2\u00bd\u00be\5\33\16\2\u00be\32\3\2\2\2\u00bf\u00c0\7?\2\2"+
		"\u00c0\34\3\2\2\2\u00c1\u00c4\5\37\20\2\u00c2\u00c4\5!\21\2\u00c3\u00c1"+
		"\3\2\2\2\u00c3\u00c2\3\2\2\2\u00c4\36\3\2\2\2\u00c5\u00c6\7-\2\2\u00c6"+
		"\u00c7\7-\2\2\u00c7 \3\2\2\2\u00c8\u00c9\7/\2\2\u00c9\u00ca\7/\2\2\u00ca"+
		"\"\3\2\2\2\u00cb\u00d1\5%\23\2\u00cc\u00d1\5\'\24\2\u00cd\u00d1\5)\25"+
		"\2\u00ce\u00d1\5+\26\2\u00cf\u00d1\5-\27\2\u00d0\u00cb\3\2\2\2\u00d0\u00cc"+
		"\3\2\2\2\u00d0\u00cd\3\2\2\2\u00d0\u00ce\3\2\2\2\u00d0\u00cf\3\2\2\2\u00d1"+
		"$\3\2\2\2\u00d2\u00d3\7-\2\2\u00d3&\3\2\2\2\u00d4\u00d5\7/\2\2\u00d5("+
		"\3\2\2\2\u00d6\u00d7\7,\2\2\u00d7*\3\2\2\2\u00d8\u00d9\7\61\2\2\u00d9"+
		",\3\2\2\2\u00da\u00db\7\'\2\2\u00db.\3\2\2\2\u00dc\u00e0\5\61\31\2\u00dd"+
		"\u00e0\5\63\32\2\u00de\u00e0\5\65\33\2\u00df\u00dc\3\2\2\2\u00df\u00dd"+
		"\3\2\2\2\u00df\u00de\3\2\2\2\u00e0\60\3\2\2\2\u00e1\u00e2\7(\2\2\u00e2"+
		"\u00e3\7(\2\2\u00e3\62\3\2\2\2\u00e4\u00e5\7~\2\2\u00e5\u00e6\7~\2\2\u00e6"+
		"\64\3\2\2\2\u00e7\u00e8\7#\2\2\u00e8\66\3\2\2\2\u00e9\u00f0\59\35\2\u00ea"+
		"\u00f0\5;\36\2\u00eb\u00f0\5=\37\2\u00ec\u00f0\5? \2\u00ed\u00f0\5A!\2"+
		"\u00ee\u00f0\5C\"\2\u00ef\u00e9\3\2\2\2\u00ef\u00ea\3\2\2\2\u00ef\u00eb"+
		"\3\2\2\2\u00ef\u00ec\3\2\2\2\u00ef\u00ed\3\2\2\2\u00ef\u00ee\3\2\2\2\u00f0"+
		"8\3\2\2\2\u00f1\u00f2\7>\2\2\u00f2\u00f3\7>\2\2\u00f3:\3\2\2\2\u00f4\u00f5"+
		"\7@\2\2\u00f5\u00f6\7@\2\2\u00f6<\3\2\2\2\u00f7\u00f8\7\u0080\2\2\u00f8"+
		">\3\2\2\2\u00f9\u00fa\7~\2\2\u00fa@\3\2\2\2\u00fb\u00fc\7(\2\2\u00fcB"+
		"\3\2\2\2\u00fd\u00fe\7`\2\2\u00feD\3\2\2\2\u00ff\u0106\5G$\2\u0100\u0106"+
		"\5I%\2\u0101\u0106\5K&\2\u0102\u0106\5M\'\2\u0103\u0106\5O(\2\u0104\u0106"+
		"\5Q)\2\u0105\u00ff\3\2\2\2\u0105\u0100\3\2\2\2\u0105\u0101\3\2\2\2\u0105"+
		"\u0102\3\2\2\2\u0105\u0103\3\2\2\2\u0105\u0104\3\2\2\2\u0106F\3\2\2\2"+
		"\u0107\u0108\7>\2\2\u0108H\3\2\2\2\u0109\u010a\7@\2\2\u010aJ\3\2\2\2\u010b"+
		"\u010c\7?\2\2\u010c\u010d\7?\2\2\u010dL\3\2\2\2\u010e\u010f\7>\2\2\u010f"+
		"\u0110\7?\2\2\u0110N\3\2\2\2\u0111\u0112\7@\2\2\u0112\u0113\7?\2\2\u0113"+
		"P\3\2\2\2\u0114\u0115\7#\2\2\u0115\u0116\7?\2\2\u0116R\3\2\2\2\u0117\u011f"+
		"\5q9\2\u0118\u011f\5\u0087D\2\u0119\u011f\5}?\2\u011a\u011f\5U+\2\u011b"+
		"\u011f\5[.\2\u011c\u011f\5a\61\2\u011d\u011f\5i\65\2\u011e\u0117\3\2\2"+
		"\2\u011e\u0118\3\2\2\2\u011e\u0119\3\2\2\2\u011e\u011a\3\2\2\2\u011e\u011b"+
		"\3\2\2\2\u011e\u011c\3\2\2\2\u011e\u011d\3\2\2\2\u011fT\3\2\2\2\u0120"+
		"\u0123\5W,\2\u0121\u0123\5Y-\2\u0122\u0120\3\2\2\2\u0122\u0121\3\2\2\2"+
		"\u0123V\3\2\2\2\u0124\u0125\7k\2\2\u0125\u0126\7h\2\2\u0126X\3\2\2\2\u0127"+
		"\u0128\7g\2\2\u0128\u0129\7n\2\2\u0129\u012a\7u\2\2\u012a\u012b\7g\2\2"+
		"\u012bZ\3\2\2\2\u012c\u012f\5]/\2\u012d\u012f\5_\60\2\u012e\u012c\3\2"+
		"\2\2\u012e\u012d\3\2\2\2\u012f\\\3\2\2\2\u0130\u0131\7h\2\2\u0131\u0132"+
		"\7q\2\2\u0132\u0133\7t\2\2\u0133^\3\2\2\2\u0134\u0135\7y\2\2\u0135\u0136"+
		"\7j\2\2\u0136\u0137\7k\2\2\u0137\u0138\7n\2\2\u0138\u0139\7g\2\2\u0139"+
		"`\3\2\2\2\u013a\u013e\5c\62\2\u013b\u013e\5e\63\2\u013c\u013e\5g\64\2"+
		"\u013d\u013a\3\2\2\2\u013d\u013b\3\2\2\2\u013d\u013c\3\2\2\2\u013eb\3"+
		"\2\2\2\u013f\u0140\7d\2\2\u0140\u0141\7t\2\2\u0141\u0142\7g\2\2\u0142"+
		"\u0143\7c\2\2\u0143\u0144\7m\2\2\u0144d\3\2\2\2\u0145\u0146\7e\2\2\u0146"+
		"\u0147\7q\2\2\u0147\u0148\7p\2\2\u0148\u0149\7v\2\2\u0149\u014a\7k\2\2"+
		"\u014a\u014b\7p\2\2\u014b\u014c\7w\2\2\u014c\u014d\7g\2\2\u014df\3\2\2"+
		"\2\u014e\u014f\7t\2\2\u014f\u0150\7g\2\2\u0150\u0151\7v\2\2\u0151\u0152"+
		"\7w\2\2\u0152\u0153\7t\2\2\u0153\u0154\7p\2\2\u0154h\3\2\2\2\u0155\u0159"+
		"\5k\66\2\u0156\u0159\5m\67\2\u0157\u0159\5o8\2\u0158\u0155\3\2\2\2\u0158"+
		"\u0156\3\2\2\2\u0158\u0157\3\2\2\2\u0159j\3\2\2\2\u015a\u015b\7e\2\2\u015b"+
		"\u015c\7n\2\2\u015c\u015d\7c\2\2\u015d\u015e\7u\2\2\u015e\u015f\7u\2\2"+
		"\u015fl\3\2\2\2\u0160\u0161\7p\2\2\u0161\u0162\7g\2\2\u0162\u0163\7y\2"+
		"\2\u0163n\3\2\2\2\u0164\u0165\7v\2\2\u0165\u0166\7j\2\2\u0166\u0167\7"+
		"k\2\2\u0167\u0168\7u\2\2\u0168p\3\2\2\2\u0169\u016e\5s:\2\u016a\u016e"+
		"\5u;\2\u016b\u016e\5w<\2\u016c\u016e\5y=\2\u016d\u0169\3\2\2\2\u016d\u016a"+
		"\3\2\2\2\u016d\u016b\3\2\2\2\u016d\u016c\3\2\2\2\u016er\3\2\2\2\u016f"+
		"\u0170\7d\2\2\u0170\u0171\7q\2\2\u0171\u0172\7q\2\2\u0172\u0173\7n\2\2"+
		"\u0173t\3\2\2\2\u0174\u0175\7k\2\2\u0175\u0176\7p\2\2\u0176\u0177\7v\2"+
		"\2\u0177v\3\2\2\2\u0178\u0179\7u\2\2\u0179\u017a\7v\2\2\u017a\u017b\7"+
		"t\2\2\u017b\u017c\7k\2\2\u017c\u017d\7p\2\2\u017d\u017e\7i\2\2\u017ex"+
		"\3\2\2\2\u017f\u0180\7x\2\2\u0180\u0181\7q\2\2\u0181\u0182\7k\2\2\u0182"+
		"\u0183\7f\2\2\u0183z\3\2\2\2\u0184\u0189\5}?\2\u0185\u0189\5\177@\2\u0186"+
		"\u0189\5\u0083B\2\u0187\u0189\5\u0087D\2\u0188\u0184\3\2\2\2\u0188\u0185"+
		"\3\2\2\2\u0188\u0186\3\2\2\2\u0188\u0187\3\2\2\2\u0189|\3\2\2\2\u018a"+
		"\u018b\7v\2\2\u018b\u018c\7t\2\2\u018c\u018d\7w\2\2\u018d\u0194\7g\2\2"+
		"\u018e\u018f\7h\2\2\u018f\u0190\7c\2\2\u0190\u0191\7n\2\2\u0191\u0192"+
		"\7u\2\2\u0192\u0194\7g\2\2\u0193\u018a\3\2\2\2\u0193\u018e\3\2\2\2\u0194"+
		"~\3\2\2\2\u0195\u0196\5\u0081A\2\u0196\u0080\3\2\2\2\u0197\u019b\t\2\2"+
		"\2\u0198\u019a\t\3\2\2\u0199\u0198\3\2\2\2\u019a\u019d\3\2\2\2\u019b\u0199"+
		"\3\2\2\2\u019b\u019c\3\2\2\2\u019c\u0082\3\2\2\2\u019d\u019b\3\2\2\2\u019e"+
		"\u01a3\7$\2\2\u019f\u01a2\n\4\2\2\u01a0\u01a2\5\u0085C\2\u01a1\u019f\3"+
		"\2\2\2\u01a1\u01a0\3\2\2\2\u01a2\u01a5\3\2\2\2\u01a3\u01a1\3\2\2\2\u01a3"+
		"\u01a4\3\2\2\2\u01a4\u01a6\3\2\2\2\u01a5\u01a3\3\2\2\2\u01a6\u01a7\7$"+
		"\2\2\u01a7\u0084\3\2\2\2\u01a8\u01a9\7^\2\2\u01a9\u01aa\t\5\2\2\u01aa"+
		"\u0086\3\2\2\2\u01ab\u01ac\7p\2\2\u01ac\u01ad\7w\2\2\u01ad\u01ae\7n\2"+
		"\2\u01ae\u01af\7n\2\2\u01af\u0088\3\2\2\2\u01b0\u01b4\t\6\2\2\u01b1\u01b3"+
		"\t\7\2\2\u01b2\u01b1\3\2\2\2\u01b3\u01b6\3\2\2\2\u01b4\u01b2\3\2\2\2\u01b4"+
		"\u01b5\3\2\2\2\u01b5\u008a\3\2\2\2\u01b6\u01b4\3\2\2\2\u01b7\u01bb\5\u008d"+
		"G\2\u01b8\u01bb\5\u008fH\2\u01b9\u01bb\5\u0091I\2\u01ba\u01b7\3\2\2\2"+
		"\u01ba\u01b8\3\2\2\2\u01ba\u01b9\3\2\2\2\u01bb\u008c\3\2\2\2\u01bc\u01be"+
		"\t\b\2\2\u01bd\u01bc\3\2\2\2\u01be\u01bf\3\2\2\2\u01bf\u01bd\3\2\2\2\u01bf"+
		"\u01c0\3\2\2\2\u01c0\u01c1\3\2\2\2\u01c1\u01c2\bG\2\2\u01c2\u008e\3\2"+
		"\2\2\u01c3\u01c5\t\t\2\2\u01c4\u01c3\3\2\2\2\u01c5\u01c6\3\2\2\2\u01c6"+
		"\u01c4\3\2\2\2\u01c6\u01c7\3\2\2\2\u01c7\u01c8\3\2\2\2\u01c8\u01c9\bH"+
		"\2\2\u01c9\u0090\3\2\2\2\u01ca\u01cd\5\u0093J\2\u01cb\u01cd\5\u0095K\2"+
		"\u01cc\u01ca\3\2\2\2\u01cc\u01cb\3\2\2\2\u01cd\u0092\3\2\2\2\u01ce\u01cf"+
		"\7\61\2\2\u01cf\u01d0\7\61\2\2\u01d0\u01d4\3\2\2\2\u01d1\u01d3\n\t\2\2"+
		"\u01d2\u01d1\3\2\2\2\u01d3\u01d6\3\2\2\2\u01d4\u01d2\3\2\2\2\u01d4\u01d5"+
		"\3\2\2\2\u01d5\u01d7\3\2\2\2\u01d6\u01d4\3\2\2\2\u01d7\u01d8\bJ\2\2\u01d8"+
		"\u0094\3\2\2\2\u01d9\u01da\7\61\2\2\u01da\u01db\7,\2\2\u01db\u01df\3\2"+
		"\2\2\u01dc\u01de\13\2\2\2\u01dd\u01dc\3\2\2\2\u01de\u01e1\3\2\2\2\u01df"+
		"\u01e0\3\2\2\2\u01df\u01dd\3\2\2\2\u01e0\u01e2\3\2\2\2\u01e1\u01df\3\2"+
		"\2\2\u01e2\u01e3\7,\2\2\u01e3\u01e4\7\61\2\2\u01e4\u01e5\3\2\2\2\u01e5"+
		"\u01e6\bK\2\2\u01e6\u0096\3\2\2\2\34\2\u009e\u00a9\u00c3\u00d0\u00df\u00ef"+
		"\u0105\u011e\u0122\u012e\u013d\u0158\u016d\u0188\u0193\u019b\u01a1\u01a3"+
		"\u01b4\u01ba\u01bf\u01c6\u01cc\u01d4\u01df\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}