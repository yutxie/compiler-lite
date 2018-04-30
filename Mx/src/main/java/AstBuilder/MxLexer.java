// Generated from D:/Users/DELL/Desktop/compiler-lite/src/main/java/AstBuilder\Mx.g4 by ANTLR 4.7
package AstBuilder;
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
	static { RuntimeMetaData.checkVersion("4.7", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		LPAREN=1, RPAREN=2, LBRACE=3, RBRACE=4, LBRACK=5, RBRACK=6, SEMI=7, COMMA=8, 
		DOT=9, ASSIGN=10, INC=11, DEC=12, ADD=13, SUB=14, MUL=15, DIV=16, MOD=17, 
		LAND=18, LOR=19, LNOT=20, LSHIFT=21, RSHIFT=22, NOT=23, OR=24, AND=25, 
		XOR=26, LT=27, GT=28, EQUAL=29, LE=30, GE=31, NOTEQUAL=32, IF=33, ELSE=34, 
		FOR=35, WHILE=36, BREAK=37, CONTINUE=38, RETURN=39, CLASS=40, NEW=41, 
		THIS=42, BOOL=43, INT=44, VOID=45, LogicConstant=46, IntegerConstant=47, 
		StringConstant=48, NullConstant=49, Identifier=50, WhiteSpace=51, NewLine=52, 
		LineComment=53, BlockComment=54;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	public static final String[] ruleNames = {
		"LPAREN", "RPAREN", "LBRACE", "RBRACE", "LBRACK", "RBRACK", "SEMI", "COMMA", 
		"DOT", "ASSIGN", "INC", "DEC", "ADD", "SUB", "MUL", "DIV", "MOD", "LAND", 
		"LOR", "LNOT", "LSHIFT", "RSHIFT", "NOT", "OR", "AND", "XOR", "LT", "GT", 
		"EQUAL", "LE", "GE", "NOTEQUAL", "IF", "ELSE", "FOR", "WHILE", "BREAK", 
		"CONTINUE", "RETURN", "CLASS", "NEW", "THIS", "BOOL", "INT", "VOID", "LogicConstant", 
		"IntegerConstant", "DecimalConstant", "StringConstant", "EscapeSequence", 
		"NullConstant", "Identifier", "WhiteSpace", "NewLine", "LineComment", 
		"BlockComment"
	};

	private static final String[] _LITERAL_NAMES = {
		null, "'('", "')'", "'{'", "'}'", "'['", "']'", "';'", "','", "'.'", "'='", 
		"'++'", "'--'", "'+'", "'-'", "'*'", "'/'", "'%'", "'&&'", "'||'", "'!'", 
		"'<<'", "'>>'", "'~'", "'|'", "'&'", "'^'", "'<'", "'>'", "'=='", "'<='", 
		"'>='", "'!='", "'if'", "'else'", "'for'", "'while'", "'break'", "'continue'", 
		"'return'", "'class'", "'new'", "'this'", "'bool'", "'int'", "'void'", 
		null, null, null, "'null'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, "LPAREN", "RPAREN", "LBRACE", "RBRACE", "LBRACK", "RBRACK", "SEMI", 
		"COMMA", "DOT", "ASSIGN", "INC", "DEC", "ADD", "SUB", "MUL", "DIV", "MOD", 
		"LAND", "LOR", "LNOT", "LSHIFT", "RSHIFT", "NOT", "OR", "AND", "XOR", 
		"LT", "GT", "EQUAL", "LE", "GE", "NOTEQUAL", "IF", "ELSE", "FOR", "WHILE", 
		"BREAK", "CONTINUE", "RETURN", "CLASS", "NEW", "THIS", "BOOL", "INT", 
		"VOID", "LogicConstant", "IntegerConstant", "StringConstant", "NullConstant", 
		"Identifier", "WhiteSpace", "NewLine", "LineComment", "BlockComment"
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
	public String getGrammarFileName() { return "Mx.g4"; }

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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\28\u0159\b\1\4\2\t"+
		"\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13"+
		"\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t \4!"+
		"\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t+\4"+
		",\t,\4-\t-\4.\t.\4/\t/\4\60\t\60\4\61\t\61\4\62\t\62\4\63\t\63\4\64\t"+
		"\64\4\65\t\65\4\66\t\66\4\67\t\67\48\t8\49\t9\3\2\3\2\3\3\3\3\3\4\3\4"+
		"\3\5\3\5\3\6\3\6\3\7\3\7\3\b\3\b\3\t\3\t\3\n\3\n\3\13\3\13\3\f\3\f\3\f"+
		"\3\r\3\r\3\r\3\16\3\16\3\17\3\17\3\20\3\20\3\21\3\21\3\22\3\22\3\23\3"+
		"\23\3\23\3\24\3\24\3\24\3\25\3\25\3\26\3\26\3\26\3\27\3\27\3\27\3\30\3"+
		"\30\3\31\3\31\3\32\3\32\3\33\3\33\3\34\3\34\3\35\3\35\3\36\3\36\3\36\3"+
		"\37\3\37\3\37\3 \3 \3 \3!\3!\3!\3\"\3\"\3\"\3#\3#\3#\3#\3#\3$\3$\3$\3"+
		"$\3%\3%\3%\3%\3%\3%\3&\3&\3&\3&\3&\3&\3\'\3\'\3\'\3\'\3\'\3\'\3\'\3\'"+
		"\3\'\3(\3(\3(\3(\3(\3(\3(\3)\3)\3)\3)\3)\3)\3*\3*\3*\3*\3+\3+\3+\3+\3"+
		"+\3,\3,\3,\3,\3,\3-\3-\3-\3-\3.\3.\3.\3.\3.\3/\3/\3/\3/\3/\3/\3/\3/\3"+
		"/\5/\u010c\n/\3\60\3\60\3\61\3\61\7\61\u0112\n\61\f\61\16\61\u0115\13"+
		"\61\3\61\5\61\u0118\n\61\3\62\3\62\3\62\7\62\u011d\n\62\f\62\16\62\u0120"+
		"\13\62\3\62\3\62\3\63\3\63\3\63\3\64\3\64\3\64\3\64\3\64\3\65\3\65\7\65"+
		"\u012e\n\65\f\65\16\65\u0131\13\65\3\66\6\66\u0134\n\66\r\66\16\66\u0135"+
		"\3\66\3\66\3\67\6\67\u013b\n\67\r\67\16\67\u013c\3\67\3\67\38\38\38\3"+
		"8\78\u0145\n8\f8\168\u0148\138\38\38\39\39\39\39\79\u0150\n9\f9\169\u0153"+
		"\139\39\39\39\39\39\3\u0151\2:\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13"+
		"\25\f\27\r\31\16\33\17\35\20\37\21!\22#\23%\24\'\25)\26+\27-\30/\31\61"+
		"\32\63\33\65\34\67\359\36;\37= ?!A\"C#E$G%I&K\'M(O)Q*S+U,W-Y.[/]\60_\61"+
		"a\2c\62e\2g\63i\64k\65m\66o\67q8\3\2\n\3\2\63;\3\2\62;\6\2\f\f\17\17$"+
		"$^^\n\2$$))^^ddhhppttvv\4\2C\\c|\6\2\62;C\\aac|\4\2\13\13\"\"\4\2\f\f"+
		"\17\17\2\u0160\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3"+
		"\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2\25\3\2\2\2"+
		"\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37\3\2\2\2\2!\3"+
		"\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2\2\2\2)\3\2\2\2\2+\3\2\2\2\2-\3\2"+
		"\2\2\2/\3\2\2\2\2\61\3\2\2\2\2\63\3\2\2\2\2\65\3\2\2\2\2\67\3\2\2\2\2"+
		"9\3\2\2\2\2;\3\2\2\2\2=\3\2\2\2\2?\3\2\2\2\2A\3\2\2\2\2C\3\2\2\2\2E\3"+
		"\2\2\2\2G\3\2\2\2\2I\3\2\2\2\2K\3\2\2\2\2M\3\2\2\2\2O\3\2\2\2\2Q\3\2\2"+
		"\2\2S\3\2\2\2\2U\3\2\2\2\2W\3\2\2\2\2Y\3\2\2\2\2[\3\2\2\2\2]\3\2\2\2\2"+
		"_\3\2\2\2\2c\3\2\2\2\2g\3\2\2\2\2i\3\2\2\2\2k\3\2\2\2\2m\3\2\2\2\2o\3"+
		"\2\2\2\2q\3\2\2\2\3s\3\2\2\2\5u\3\2\2\2\7w\3\2\2\2\ty\3\2\2\2\13{\3\2"+
		"\2\2\r}\3\2\2\2\17\177\3\2\2\2\21\u0081\3\2\2\2\23\u0083\3\2\2\2\25\u0085"+
		"\3\2\2\2\27\u0087\3\2\2\2\31\u008a\3\2\2\2\33\u008d\3\2\2\2\35\u008f\3"+
		"\2\2\2\37\u0091\3\2\2\2!\u0093\3\2\2\2#\u0095\3\2\2\2%\u0097\3\2\2\2\'"+
		"\u009a\3\2\2\2)\u009d\3\2\2\2+\u009f\3\2\2\2-\u00a2\3\2\2\2/\u00a5\3\2"+
		"\2\2\61\u00a7\3\2\2\2\63\u00a9\3\2\2\2\65\u00ab\3\2\2\2\67\u00ad\3\2\2"+
		"\29\u00af\3\2\2\2;\u00b1\3\2\2\2=\u00b4\3\2\2\2?\u00b7\3\2\2\2A\u00ba"+
		"\3\2\2\2C\u00bd\3\2\2\2E\u00c0\3\2\2\2G\u00c5\3\2\2\2I\u00c9\3\2\2\2K"+
		"\u00cf\3\2\2\2M\u00d5\3\2\2\2O\u00de\3\2\2\2Q\u00e5\3\2\2\2S\u00eb\3\2"+
		"\2\2U\u00ef\3\2\2\2W\u00f4\3\2\2\2Y\u00f9\3\2\2\2[\u00fd\3\2\2\2]\u010b"+
		"\3\2\2\2_\u010d\3\2\2\2a\u0117\3\2\2\2c\u0119\3\2\2\2e\u0123\3\2\2\2g"+
		"\u0126\3\2\2\2i\u012b\3\2\2\2k\u0133\3\2\2\2m\u013a\3\2\2\2o\u0140\3\2"+
		"\2\2q\u014b\3\2\2\2st\7*\2\2t\4\3\2\2\2uv\7+\2\2v\6\3\2\2\2wx\7}\2\2x"+
		"\b\3\2\2\2yz\7\177\2\2z\n\3\2\2\2{|\7]\2\2|\f\3\2\2\2}~\7_\2\2~\16\3\2"+
		"\2\2\177\u0080\7=\2\2\u0080\20\3\2\2\2\u0081\u0082\7.\2\2\u0082\22\3\2"+
		"\2\2\u0083\u0084\7\60\2\2\u0084\24\3\2\2\2\u0085\u0086\7?\2\2\u0086\26"+
		"\3\2\2\2\u0087\u0088\7-\2\2\u0088\u0089\7-\2\2\u0089\30\3\2\2\2\u008a"+
		"\u008b\7/\2\2\u008b\u008c\7/\2\2\u008c\32\3\2\2\2\u008d\u008e\7-\2\2\u008e"+
		"\34\3\2\2\2\u008f\u0090\7/\2\2\u0090\36\3\2\2\2\u0091\u0092\7,\2\2\u0092"+
		" \3\2\2\2\u0093\u0094\7\61\2\2\u0094\"\3\2\2\2\u0095\u0096\7\'\2\2\u0096"+
		"$\3\2\2\2\u0097\u0098\7(\2\2\u0098\u0099\7(\2\2\u0099&\3\2\2\2\u009a\u009b"+
		"\7~\2\2\u009b\u009c\7~\2\2\u009c(\3\2\2\2\u009d\u009e\7#\2\2\u009e*\3"+
		"\2\2\2\u009f\u00a0\7>\2\2\u00a0\u00a1\7>\2\2\u00a1,\3\2\2\2\u00a2\u00a3"+
		"\7@\2\2\u00a3\u00a4\7@\2\2\u00a4.\3\2\2\2\u00a5\u00a6\7\u0080\2\2\u00a6"+
		"\60\3\2\2\2\u00a7\u00a8\7~\2\2\u00a8\62\3\2\2\2\u00a9\u00aa\7(\2\2\u00aa"+
		"\64\3\2\2\2\u00ab\u00ac\7`\2\2\u00ac\66\3\2\2\2\u00ad\u00ae\7>\2\2\u00ae"+
		"8\3\2\2\2\u00af\u00b0\7@\2\2\u00b0:\3\2\2\2\u00b1\u00b2\7?\2\2\u00b2\u00b3"+
		"\7?\2\2\u00b3<\3\2\2\2\u00b4\u00b5\7>\2\2\u00b5\u00b6\7?\2\2\u00b6>\3"+
		"\2\2\2\u00b7\u00b8\7@\2\2\u00b8\u00b9\7?\2\2\u00b9@\3\2\2\2\u00ba\u00bb"+
		"\7#\2\2\u00bb\u00bc\7?\2\2\u00bcB\3\2\2\2\u00bd\u00be\7k\2\2\u00be\u00bf"+
		"\7h\2\2\u00bfD\3\2\2\2\u00c0\u00c1\7g\2\2\u00c1\u00c2\7n\2\2\u00c2\u00c3"+
		"\7u\2\2\u00c3\u00c4\7g\2\2\u00c4F\3\2\2\2\u00c5\u00c6\7h\2\2\u00c6\u00c7"+
		"\7q\2\2\u00c7\u00c8\7t\2\2\u00c8H\3\2\2\2\u00c9\u00ca\7y\2\2\u00ca\u00cb"+
		"\7j\2\2\u00cb\u00cc\7k\2\2\u00cc\u00cd\7n\2\2\u00cd\u00ce\7g\2\2\u00ce"+
		"J\3\2\2\2\u00cf\u00d0\7d\2\2\u00d0\u00d1\7t\2\2\u00d1\u00d2\7g\2\2\u00d2"+
		"\u00d3\7c\2\2\u00d3\u00d4\7m\2\2\u00d4L\3\2\2\2\u00d5\u00d6\7e\2\2\u00d6"+
		"\u00d7\7q\2\2\u00d7\u00d8\7p\2\2\u00d8\u00d9\7v\2\2\u00d9\u00da\7k\2\2"+
		"\u00da\u00db\7p\2\2\u00db\u00dc\7w\2\2\u00dc\u00dd\7g\2\2\u00ddN\3\2\2"+
		"\2\u00de\u00df\7t\2\2\u00df\u00e0\7g\2\2\u00e0\u00e1\7v\2\2\u00e1\u00e2"+
		"\7w\2\2\u00e2\u00e3\7t\2\2\u00e3\u00e4\7p\2\2\u00e4P\3\2\2\2\u00e5\u00e6"+
		"\7e\2\2\u00e6\u00e7\7n\2\2\u00e7\u00e8\7c\2\2\u00e8\u00e9\7u\2\2\u00e9"+
		"\u00ea\7u\2\2\u00eaR\3\2\2\2\u00eb\u00ec\7p\2\2\u00ec\u00ed\7g\2\2\u00ed"+
		"\u00ee\7y\2\2\u00eeT\3\2\2\2\u00ef\u00f0\7v\2\2\u00f0\u00f1\7j\2\2\u00f1"+
		"\u00f2\7k\2\2\u00f2\u00f3\7u\2\2\u00f3V\3\2\2\2\u00f4\u00f5\7d\2\2\u00f5"+
		"\u00f6\7q\2\2\u00f6\u00f7\7q\2\2\u00f7\u00f8\7n\2\2\u00f8X\3\2\2\2\u00f9"+
		"\u00fa\7k\2\2\u00fa\u00fb\7p\2\2\u00fb\u00fc\7v\2\2\u00fcZ\3\2\2\2\u00fd"+
		"\u00fe\7x\2\2\u00fe\u00ff\7q\2\2\u00ff\u0100\7k\2\2\u0100\u0101\7f\2\2"+
		"\u0101\\\3\2\2\2\u0102\u0103\7v\2\2\u0103\u0104\7t\2\2\u0104\u0105\7w"+
		"\2\2\u0105\u010c\7g\2\2\u0106\u0107\7h\2\2\u0107\u0108\7c\2\2\u0108\u0109"+
		"\7n\2\2\u0109\u010a\7u\2\2\u010a\u010c\7g\2\2\u010b\u0102\3\2\2\2\u010b"+
		"\u0106\3\2\2\2\u010c^\3\2\2\2\u010d\u010e\5a\61\2\u010e`\3\2\2\2\u010f"+
		"\u0113\t\2\2\2\u0110\u0112\t\3\2\2\u0111\u0110\3\2\2\2\u0112\u0115\3\2"+
		"\2\2\u0113\u0111\3\2\2\2\u0113\u0114\3\2\2\2\u0114\u0118\3\2\2\2\u0115"+
		"\u0113\3\2\2\2\u0116\u0118\7\62\2\2\u0117\u010f\3\2\2\2\u0117\u0116\3"+
		"\2\2\2\u0118b\3\2\2\2\u0119\u011e\7$\2\2\u011a\u011d\n\4\2\2\u011b\u011d"+
		"\5e\63\2\u011c\u011a\3\2\2\2\u011c\u011b\3\2\2\2\u011d\u0120\3\2\2\2\u011e"+
		"\u011c\3\2\2\2\u011e\u011f\3\2\2\2\u011f\u0121\3\2\2\2\u0120\u011e\3\2"+
		"\2\2\u0121\u0122\7$\2\2\u0122d\3\2\2\2\u0123\u0124\7^\2\2\u0124\u0125"+
		"\t\5\2\2\u0125f\3\2\2\2\u0126\u0127\7p\2\2\u0127\u0128\7w\2\2\u0128\u0129"+
		"\7n\2\2\u0129\u012a\7n\2\2\u012ah\3\2\2\2\u012b\u012f\t\6\2\2\u012c\u012e"+
		"\t\7\2\2\u012d\u012c\3\2\2\2\u012e\u0131\3\2\2\2\u012f\u012d\3\2\2\2\u012f"+
		"\u0130\3\2\2\2\u0130j\3\2\2\2\u0131\u012f\3\2\2\2\u0132\u0134\t\b\2\2"+
		"\u0133\u0132\3\2\2\2\u0134\u0135\3\2\2\2\u0135\u0133\3\2\2\2\u0135\u0136"+
		"\3\2\2\2\u0136\u0137\3\2\2\2\u0137\u0138\b\66\2\2\u0138l\3\2\2\2\u0139"+
		"\u013b\t\t\2\2\u013a\u0139\3\2\2\2\u013b\u013c\3\2\2\2\u013c\u013a\3\2"+
		"\2\2\u013c\u013d\3\2\2\2\u013d\u013e\3\2\2\2\u013e\u013f\b\67\2\2\u013f"+
		"n\3\2\2\2\u0140\u0141\7\61\2\2\u0141\u0142\7\61\2\2\u0142\u0146\3\2\2"+
		"\2\u0143\u0145\n\t\2\2\u0144\u0143\3\2\2\2\u0145\u0148\3\2\2\2\u0146\u0144"+
		"\3\2\2\2\u0146\u0147\3\2\2\2\u0147\u0149\3\2\2\2\u0148\u0146\3\2\2\2\u0149"+
		"\u014a\b8\2\2\u014ap\3\2\2\2\u014b\u014c\7\61\2\2\u014c\u014d\7,\2\2\u014d"+
		"\u0151\3\2\2\2\u014e\u0150\13\2\2\2\u014f\u014e\3\2\2\2\u0150\u0153\3"+
		"\2\2\2\u0151\u0152\3\2\2\2\u0151\u014f\3\2\2\2\u0152\u0154\3\2\2\2\u0153"+
		"\u0151\3\2\2\2\u0154\u0155\7,\2\2\u0155\u0156\7\61\2\2\u0156\u0157\3\2"+
		"\2\2\u0157\u0158\b9\2\2\u0158r\3\2\2\2\r\2\u010b\u0113\u0117\u011c\u011e"+
		"\u012f\u0135\u013c\u0146\u0151\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}