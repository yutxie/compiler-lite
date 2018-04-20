// Generated from D:/Users/DELL/Desktop/compiler-lite/Mx/src/main/java\Mx.g4 by ANTLR 4.7
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
		THIS=42, BOOL=43, INT=44, STRING=45, VOID=46, LogicConstant=47, IntegerConstant=48, 
		StringConstant=49, NullConstant=50, Identifier=51, WhiteSpace=52, NewLine=53, 
		LineComment=54, BlockComment=55;
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
		"CONTINUE", "RETURN", "CLASS", "NEW", "THIS", "BOOL", "INT", "STRING", 
		"VOID", "LogicConstant", "IntegerConstant", "DecimalConstant", "StringConstant", 
		"EscapeSequence", "NullConstant", "Identifier", "WhiteSpace", "NewLine", 
		"LineComment", "BlockComment"
	};

	private static final String[] _LITERAL_NAMES = {
		null, "'('", "')'", "'{'", "'}'", "'['", "']'", "';'", "','", "'.'", "'='", 
		"'++'", "'--'", "'+'", "'-'", "'*'", "'/'", "'%'", "'&&'", "'||'", "'!'", 
		"'<<'", "'>>'", "'~'", "'|'", "'&'", "'^'", "'<'", "'>'", "'=='", "'<='", 
		"'>='", "'!='", "'if'", "'else'", "'for'", "'while'", "'break'", "'continue'", 
		"'return'", "'class'", "'new'", "'this'", "'bool'", "'int'", "'string'", 
		"'void'", null, null, null, "'null'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, "LPAREN", "RPAREN", "LBRACE", "RBRACE", "LBRACK", "RBRACK", "SEMI", 
		"COMMA", "DOT", "ASSIGN", "INC", "DEC", "ADD", "SUB", "MUL", "DIV", "MOD", 
		"LAND", "LOR", "LNOT", "LSHIFT", "RSHIFT", "NOT", "OR", "AND", "XOR", 
		"LT", "GT", "EQUAL", "LE", "GE", "NOTEQUAL", "IF", "ELSE", "FOR", "WHILE", 
		"BREAK", "CONTINUE", "RETURN", "CLASS", "NEW", "THIS", "BOOL", "INT", 
		"STRING", "VOID", "LogicConstant", "IntegerConstant", "StringConstant", 
		"NullConstant", "Identifier", "WhiteSpace", "NewLine", "LineComment", 
		"BlockComment"
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\29\u0162\b\1\4\2\t"+
		"\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13"+
		"\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22\t\22"+
		"\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31\t\31"+
		"\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\4 \t \4!"+
		"\t!\4\"\t\"\4#\t#\4$\t$\4%\t%\4&\t&\4\'\t\'\4(\t(\4)\t)\4*\t*\4+\t+\4"+
		",\t,\4-\t-\4.\t.\4/\t/\4\60\t\60\4\61\t\61\4\62\t\62\4\63\t\63\4\64\t"+
		"\64\4\65\t\65\4\66\t\66\4\67\t\67\48\t8\49\t9\4:\t:\3\2\3\2\3\3\3\3\3"+
		"\4\3\4\3\5\3\5\3\6\3\6\3\7\3\7\3\b\3\b\3\t\3\t\3\n\3\n\3\13\3\13\3\f\3"+
		"\f\3\f\3\r\3\r\3\r\3\16\3\16\3\17\3\17\3\20\3\20\3\21\3\21\3\22\3\22\3"+
		"\23\3\23\3\23\3\24\3\24\3\24\3\25\3\25\3\26\3\26\3\26\3\27\3\27\3\27\3"+
		"\30\3\30\3\31\3\31\3\32\3\32\3\33\3\33\3\34\3\34\3\35\3\35\3\36\3\36\3"+
		"\36\3\37\3\37\3\37\3 \3 \3 \3!\3!\3!\3\"\3\"\3\"\3#\3#\3#\3#\3#\3$\3$"+
		"\3$\3$\3%\3%\3%\3%\3%\3%\3&\3&\3&\3&\3&\3&\3\'\3\'\3\'\3\'\3\'\3\'\3\'"+
		"\3\'\3\'\3(\3(\3(\3(\3(\3(\3(\3)\3)\3)\3)\3)\3)\3*\3*\3*\3*\3+\3+\3+\3"+
		"+\3+\3,\3,\3,\3,\3,\3-\3-\3-\3-\3.\3.\3.\3.\3.\3.\3.\3/\3/\3/\3/\3/\3"+
		"\60\3\60\3\60\3\60\3\60\3\60\3\60\3\60\3\60\5\60\u0115\n\60\3\61\3\61"+
		"\3\62\3\62\7\62\u011b\n\62\f\62\16\62\u011e\13\62\3\62\5\62\u0121\n\62"+
		"\3\63\3\63\3\63\7\63\u0126\n\63\f\63\16\63\u0129\13\63\3\63\3\63\3\64"+
		"\3\64\3\64\3\65\3\65\3\65\3\65\3\65\3\66\3\66\7\66\u0137\n\66\f\66\16"+
		"\66\u013a\13\66\3\67\6\67\u013d\n\67\r\67\16\67\u013e\3\67\3\67\38\68"+
		"\u0144\n8\r8\168\u0145\38\38\39\39\39\39\79\u014e\n9\f9\169\u0151\139"+
		"\39\39\3:\3:\3:\3:\7:\u0159\n:\f:\16:\u015c\13:\3:\3:\3:\3:\3:\3\u015a"+
		"\2;\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13\25\f\27\r\31\16\33\17\35"+
		"\20\37\21!\22#\23%\24\'\25)\26+\27-\30/\31\61\32\63\33\65\34\67\359\36"+
		";\37= ?!A\"C#E$G%I&K\'M(O)Q*S+U,W-Y.[/]\60_\61a\62c\2e\63g\2i\64k\65m"+
		"\66o\67q8s9\3\2\n\3\2\63;\3\2\62;\6\2\f\f\17\17$$^^\n\2$$))^^ddhhpptt"+
		"vv\4\2C\\c|\6\2\62;C\\aac|\4\2\13\13\"\"\4\2\f\f\17\17\2\u0169\2\3\3\2"+
		"\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17"+
		"\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2"+
		"\2\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2\2\2\2%\3"+
		"\2\2\2\2\'\3\2\2\2\2)\3\2\2\2\2+\3\2\2\2\2-\3\2\2\2\2/\3\2\2\2\2\61\3"+
		"\2\2\2\2\63\3\2\2\2\2\65\3\2\2\2\2\67\3\2\2\2\29\3\2\2\2\2;\3\2\2\2\2"+
		"=\3\2\2\2\2?\3\2\2\2\2A\3\2\2\2\2C\3\2\2\2\2E\3\2\2\2\2G\3\2\2\2\2I\3"+
		"\2\2\2\2K\3\2\2\2\2M\3\2\2\2\2O\3\2\2\2\2Q\3\2\2\2\2S\3\2\2\2\2U\3\2\2"+
		"\2\2W\3\2\2\2\2Y\3\2\2\2\2[\3\2\2\2\2]\3\2\2\2\2_\3\2\2\2\2a\3\2\2\2\2"+
		"e\3\2\2\2\2i\3\2\2\2\2k\3\2\2\2\2m\3\2\2\2\2o\3\2\2\2\2q\3\2\2\2\2s\3"+
		"\2\2\2\3u\3\2\2\2\5w\3\2\2\2\7y\3\2\2\2\t{\3\2\2\2\13}\3\2\2\2\r\177\3"+
		"\2\2\2\17\u0081\3\2\2\2\21\u0083\3\2\2\2\23\u0085\3\2\2\2\25\u0087\3\2"+
		"\2\2\27\u0089\3\2\2\2\31\u008c\3\2\2\2\33\u008f\3\2\2\2\35\u0091\3\2\2"+
		"\2\37\u0093\3\2\2\2!\u0095\3\2\2\2#\u0097\3\2\2\2%\u0099\3\2\2\2\'\u009c"+
		"\3\2\2\2)\u009f\3\2\2\2+\u00a1\3\2\2\2-\u00a4\3\2\2\2/\u00a7\3\2\2\2\61"+
		"\u00a9\3\2\2\2\63\u00ab\3\2\2\2\65\u00ad\3\2\2\2\67\u00af\3\2\2\29\u00b1"+
		"\3\2\2\2;\u00b3\3\2\2\2=\u00b6\3\2\2\2?\u00b9\3\2\2\2A\u00bc\3\2\2\2C"+
		"\u00bf\3\2\2\2E\u00c2\3\2\2\2G\u00c7\3\2\2\2I\u00cb\3\2\2\2K\u00d1\3\2"+
		"\2\2M\u00d7\3\2\2\2O\u00e0\3\2\2\2Q\u00e7\3\2\2\2S\u00ed\3\2\2\2U\u00f1"+
		"\3\2\2\2W\u00f6\3\2\2\2Y\u00fb\3\2\2\2[\u00ff\3\2\2\2]\u0106\3\2\2\2_"+
		"\u0114\3\2\2\2a\u0116\3\2\2\2c\u0120\3\2\2\2e\u0122\3\2\2\2g\u012c\3\2"+
		"\2\2i\u012f\3\2\2\2k\u0134\3\2\2\2m\u013c\3\2\2\2o\u0143\3\2\2\2q\u0149"+
		"\3\2\2\2s\u0154\3\2\2\2uv\7*\2\2v\4\3\2\2\2wx\7+\2\2x\6\3\2\2\2yz\7}\2"+
		"\2z\b\3\2\2\2{|\7\177\2\2|\n\3\2\2\2}~\7]\2\2~\f\3\2\2\2\177\u0080\7_"+
		"\2\2\u0080\16\3\2\2\2\u0081\u0082\7=\2\2\u0082\20\3\2\2\2\u0083\u0084"+
		"\7.\2\2\u0084\22\3\2\2\2\u0085\u0086\7\60\2\2\u0086\24\3\2\2\2\u0087\u0088"+
		"\7?\2\2\u0088\26\3\2\2\2\u0089\u008a\7-\2\2\u008a\u008b\7-\2\2\u008b\30"+
		"\3\2\2\2\u008c\u008d\7/\2\2\u008d\u008e\7/\2\2\u008e\32\3\2\2\2\u008f"+
		"\u0090\7-\2\2\u0090\34\3\2\2\2\u0091\u0092\7/\2\2\u0092\36\3\2\2\2\u0093"+
		"\u0094\7,\2\2\u0094 \3\2\2\2\u0095\u0096\7\61\2\2\u0096\"\3\2\2\2\u0097"+
		"\u0098\7\'\2\2\u0098$\3\2\2\2\u0099\u009a\7(\2\2\u009a\u009b\7(\2\2\u009b"+
		"&\3\2\2\2\u009c\u009d\7~\2\2\u009d\u009e\7~\2\2\u009e(\3\2\2\2\u009f\u00a0"+
		"\7#\2\2\u00a0*\3\2\2\2\u00a1\u00a2\7>\2\2\u00a2\u00a3\7>\2\2\u00a3,\3"+
		"\2\2\2\u00a4\u00a5\7@\2\2\u00a5\u00a6\7@\2\2\u00a6.\3\2\2\2\u00a7\u00a8"+
		"\7\u0080\2\2\u00a8\60\3\2\2\2\u00a9\u00aa\7~\2\2\u00aa\62\3\2\2\2\u00ab"+
		"\u00ac\7(\2\2\u00ac\64\3\2\2\2\u00ad\u00ae\7`\2\2\u00ae\66\3\2\2\2\u00af"+
		"\u00b0\7>\2\2\u00b08\3\2\2\2\u00b1\u00b2\7@\2\2\u00b2:\3\2\2\2\u00b3\u00b4"+
		"\7?\2\2\u00b4\u00b5\7?\2\2\u00b5<\3\2\2\2\u00b6\u00b7\7>\2\2\u00b7\u00b8"+
		"\7?\2\2\u00b8>\3\2\2\2\u00b9\u00ba\7@\2\2\u00ba\u00bb\7?\2\2\u00bb@\3"+
		"\2\2\2\u00bc\u00bd\7#\2\2\u00bd\u00be\7?\2\2\u00beB\3\2\2\2\u00bf\u00c0"+
		"\7k\2\2\u00c0\u00c1\7h\2\2\u00c1D\3\2\2\2\u00c2\u00c3\7g\2\2\u00c3\u00c4"+
		"\7n\2\2\u00c4\u00c5\7u\2\2\u00c5\u00c6\7g\2\2\u00c6F\3\2\2\2\u00c7\u00c8"+
		"\7h\2\2\u00c8\u00c9\7q\2\2\u00c9\u00ca\7t\2\2\u00caH\3\2\2\2\u00cb\u00cc"+
		"\7y\2\2\u00cc\u00cd\7j\2\2\u00cd\u00ce\7k\2\2\u00ce\u00cf\7n\2\2\u00cf"+
		"\u00d0\7g\2\2\u00d0J\3\2\2\2\u00d1\u00d2\7d\2\2\u00d2\u00d3\7t\2\2\u00d3"+
		"\u00d4\7g\2\2\u00d4\u00d5\7c\2\2\u00d5\u00d6\7m\2\2\u00d6L\3\2\2\2\u00d7"+
		"\u00d8\7e\2\2\u00d8\u00d9\7q\2\2\u00d9\u00da\7p\2\2\u00da\u00db\7v\2\2"+
		"\u00db\u00dc\7k\2\2\u00dc\u00dd\7p\2\2\u00dd\u00de\7w\2\2\u00de\u00df"+
		"\7g\2\2\u00dfN\3\2\2\2\u00e0\u00e1\7t\2\2\u00e1\u00e2\7g\2\2\u00e2\u00e3"+
		"\7v\2\2\u00e3\u00e4\7w\2\2\u00e4\u00e5\7t\2\2\u00e5\u00e6\7p\2\2\u00e6"+
		"P\3\2\2\2\u00e7\u00e8\7e\2\2\u00e8\u00e9\7n\2\2\u00e9\u00ea\7c\2\2\u00ea"+
		"\u00eb\7u\2\2\u00eb\u00ec\7u\2\2\u00ecR\3\2\2\2\u00ed\u00ee\7p\2\2\u00ee"+
		"\u00ef\7g\2\2\u00ef\u00f0\7y\2\2\u00f0T\3\2\2\2\u00f1\u00f2\7v\2\2\u00f2"+
		"\u00f3\7j\2\2\u00f3\u00f4\7k\2\2\u00f4\u00f5\7u\2\2\u00f5V\3\2\2\2\u00f6"+
		"\u00f7\7d\2\2\u00f7\u00f8\7q\2\2\u00f8\u00f9\7q\2\2\u00f9\u00fa\7n\2\2"+
		"\u00faX\3\2\2\2\u00fb\u00fc\7k\2\2\u00fc\u00fd\7p\2\2\u00fd\u00fe\7v\2"+
		"\2\u00feZ\3\2\2\2\u00ff\u0100\7u\2\2\u0100\u0101\7v\2\2\u0101\u0102\7"+
		"t\2\2\u0102\u0103\7k\2\2\u0103\u0104\7p\2\2\u0104\u0105\7i\2\2\u0105\\"+
		"\3\2\2\2\u0106\u0107\7x\2\2\u0107\u0108\7q\2\2\u0108\u0109\7k\2\2\u0109"+
		"\u010a\7f\2\2\u010a^\3\2\2\2\u010b\u010c\7v\2\2\u010c\u010d\7t\2\2\u010d"+
		"\u010e\7w\2\2\u010e\u0115\7g\2\2\u010f\u0110\7h\2\2\u0110\u0111\7c\2\2"+
		"\u0111\u0112\7n\2\2\u0112\u0113\7u\2\2\u0113\u0115\7g\2\2\u0114\u010b"+
		"\3\2\2\2\u0114\u010f\3\2\2\2\u0115`\3\2\2\2\u0116\u0117\5c\62\2\u0117"+
		"b\3\2\2\2\u0118\u011c\t\2\2\2\u0119\u011b\t\3\2\2\u011a\u0119\3\2\2\2"+
		"\u011b\u011e\3\2\2\2\u011c\u011a\3\2\2\2\u011c\u011d\3\2\2\2\u011d\u0121"+
		"\3\2\2\2\u011e\u011c\3\2\2\2\u011f\u0121\7\62\2\2\u0120\u0118\3\2\2\2"+
		"\u0120\u011f\3\2\2\2\u0121d\3\2\2\2\u0122\u0127\7$\2\2\u0123\u0126\n\4"+
		"\2\2\u0124\u0126\5g\64\2\u0125\u0123\3\2\2\2\u0125\u0124\3\2\2\2\u0126"+
		"\u0129\3\2\2\2\u0127\u0125\3\2\2\2\u0127\u0128\3\2\2\2\u0128\u012a\3\2"+
		"\2\2\u0129\u0127\3\2\2\2\u012a\u012b\7$\2\2\u012bf\3\2\2\2\u012c\u012d"+
		"\7^\2\2\u012d\u012e\t\5\2\2\u012eh\3\2\2\2\u012f\u0130\7p\2\2\u0130\u0131"+
		"\7w\2\2\u0131\u0132\7n\2\2\u0132\u0133\7n\2\2\u0133j\3\2\2\2\u0134\u0138"+
		"\t\6\2\2\u0135\u0137\t\7\2\2\u0136\u0135\3\2\2\2\u0137\u013a\3\2\2\2\u0138"+
		"\u0136\3\2\2\2\u0138\u0139\3\2\2\2\u0139l\3\2\2\2\u013a\u0138\3\2\2\2"+
		"\u013b\u013d\t\b\2\2\u013c\u013b\3\2\2\2\u013d\u013e\3\2\2\2\u013e\u013c"+
		"\3\2\2\2\u013e\u013f\3\2\2\2\u013f\u0140\3\2\2\2\u0140\u0141\b\67\2\2"+
		"\u0141n\3\2\2\2\u0142\u0144\t\t\2\2\u0143\u0142\3\2\2\2\u0144\u0145\3"+
		"\2\2\2\u0145\u0143\3\2\2\2\u0145\u0146\3\2\2\2\u0146\u0147\3\2\2\2\u0147"+
		"\u0148\b8\2\2\u0148p\3\2\2\2\u0149\u014a\7\61\2\2\u014a\u014b\7\61\2\2"+
		"\u014b\u014f\3\2\2\2\u014c\u014e\n\t\2\2\u014d\u014c\3\2\2\2\u014e\u0151"+
		"\3\2\2\2\u014f\u014d\3\2\2\2\u014f\u0150\3\2\2\2\u0150\u0152\3\2\2\2\u0151"+
		"\u014f\3\2\2\2\u0152\u0153\b9\2\2\u0153r\3\2\2\2\u0154\u0155\7\61\2\2"+
		"\u0155\u0156\7,\2\2\u0156\u015a\3\2\2\2\u0157\u0159\13\2\2\2\u0158\u0157"+
		"\3\2\2\2\u0159\u015c\3\2\2\2\u015a\u015b\3\2\2\2\u015a\u0158\3\2\2\2\u015b"+
		"\u015d\3\2\2\2\u015c\u015a\3\2\2\2\u015d\u015e\7,\2\2\u015e\u015f\7\61"+
		"\2\2\u015f\u0160\3\2\2\2\u0160\u0161\b:\2\2\u0161t\3\2\2\2\r\2\u0114\u011c"+
		"\u0120\u0125\u0127\u0138\u013e\u0145\u014f\u015a\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}