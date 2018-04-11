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
		Keyword=1, VariableType=2, BOOL=3, INT=4, STRING=5, VOID=6, ControlStatementWord=7, 
		IF=8, FOR=9, WHILE=10, BREAK=11, CONTINUE=12, RETURN=13, ObjectiveWord=14, 
		CLASS=15, NEW=16, THIS=17, Constant=18, LogicConstant=19, IntegerConstant=20, 
		StringConstant=21, NullConstant=22, Identifier=23, SpecialToken=24, WhiteSpace=25, 
		NewLine=26, Comment=27, LineComment=28, BlockComment=29;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	public static final String[] ruleNames = {
		"Keyword", "VariableType", "BOOL", "INT", "STRING", "VOID", "ControlStatementWord", 
		"IF", "FOR", "WHILE", "BREAK", "CONTINUE", "RETURN", "ObjectiveWord", 
		"CLASS", "NEW", "THIS", "Constant", "LogicConstant", "IntegerConstant", 
		"DecimalConstant", "StringConstant", "NullConstant", "Identifier", "SpecialToken", 
		"WhiteSpace", "NewLine", "Comment", "LineComment", "BlockComment"
	};

	private static final String[] _LITERAL_NAMES = {
		null, null, null, "'bool'", "'int'", "'string'", "'void'", null, "'if'", 
		"'for'", "'while'", "'break'", "'continue'", "'return'", null, "'class'", 
		"'new'", "'this'", null, null, null, null, "'null'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, "Keyword", "VariableType", "BOOL", "INT", "STRING", "VOID", "ControlStatementWord", 
		"IF", "FOR", "WHILE", "BREAK", "CONTINUE", "RETURN", "ObjectiveWord", 
		"CLASS", "NEW", "THIS", "Constant", "LogicConstant", "IntegerConstant", 
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\37\u00f8\b\1\4\2"+
		"\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4"+
		"\13\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22"+
		"\t\22\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31"+
		"\t\31\4\32\t\32\4\33\t\33\4\34\t\34\4\35\t\35\4\36\t\36\4\37\t\37\3\2"+
		"\3\2\3\2\3\2\3\2\5\2E\n\2\3\3\3\3\3\3\3\3\5\3K\n\3\3\4\3\4\3\4\3\4\3\4"+
		"\3\5\3\5\3\5\3\5\3\6\3\6\3\6\3\6\3\6\3\6\3\6\3\7\3\7\3\7\3\7\3\7\3\b\3"+
		"\b\3\b\3\b\3\b\3\b\5\bh\n\b\3\t\3\t\3\t\3\n\3\n\3\n\3\n\3\13\3\13\3\13"+
		"\3\13\3\13\3\13\3\f\3\f\3\f\3\f\3\f\3\f\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3"+
		"\r\3\r\3\16\3\16\3\16\3\16\3\16\3\16\3\16\3\17\3\17\3\17\5\17\u0090\n"+
		"\17\3\20\3\20\3\20\3\20\3\20\3\20\3\21\3\21\3\21\3\21\3\22\3\22\3\22\3"+
		"\22\3\22\3\23\3\23\3\23\3\23\5\23\u00a5\n\23\3\24\3\24\3\24\3\24\3\24"+
		"\3\24\3\24\3\24\3\24\5\24\u00b0\n\24\3\25\3\25\3\26\3\26\7\26\u00b6\n"+
		"\26\f\26\16\26\u00b9\13\26\3\27\3\27\3\30\3\30\3\30\3\30\3\30\3\31\3\31"+
		"\7\31\u00c4\n\31\f\31\16\31\u00c7\13\31\3\32\3\32\3\32\5\32\u00cc\n\32"+
		"\3\33\6\33\u00cf\n\33\r\33\16\33\u00d0\3\33\3\33\3\34\6\34\u00d6\n\34"+
		"\r\34\16\34\u00d7\3\34\3\34\3\35\3\35\5\35\u00de\n\35\3\36\3\36\3\36\3"+
		"\36\7\36\u00e4\n\36\f\36\16\36\u00e7\13\36\3\36\3\36\3\37\3\37\3\37\3"+
		"\37\7\37\u00ef\n\37\f\37\16\37\u00f2\13\37\3\37\3\37\3\37\3\37\3\37\3"+
		"\u00f0\2 \3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13\25\f\27\r\31\16\33"+
		"\17\35\20\37\21!\22#\23%\24\'\25)\26+\2-\27/\30\61\31\63\32\65\33\67\34"+
		"9\35;\36=\37\3\2\b\3\2\63;\3\2\62;\4\2C\\c|\6\2\62;C\\aac|\4\2\13\13\""+
		"\"\4\2\f\f\17\17\2\u0111\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2"+
		"\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2\25"+
		"\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37\3\2"+
		"\2\2\2!\3\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2\2\2\2)\3\2\2\2\2-\3\2\2"+
		"\2\2/\3\2\2\2\2\61\3\2\2\2\2\63\3\2\2\2\2\65\3\2\2\2\2\67\3\2\2\2\29\3"+
		"\2\2\2\2;\3\2\2\2\2=\3\2\2\2\3D\3\2\2\2\5J\3\2\2\2\7L\3\2\2\2\tQ\3\2\2"+
		"\2\13U\3\2\2\2\r\\\3\2\2\2\17g\3\2\2\2\21i\3\2\2\2\23l\3\2\2\2\25p\3\2"+
		"\2\2\27v\3\2\2\2\31|\3\2\2\2\33\u0085\3\2\2\2\35\u008f\3\2\2\2\37\u0091"+
		"\3\2\2\2!\u0097\3\2\2\2#\u009b\3\2\2\2%\u00a4\3\2\2\2\'\u00af\3\2\2\2"+
		")\u00b1\3\2\2\2+\u00b3\3\2\2\2-\u00ba\3\2\2\2/\u00bc\3\2\2\2\61\u00c1"+
		"\3\2\2\2\63\u00cb\3\2\2\2\65\u00ce\3\2\2\2\67\u00d5\3\2\2\29\u00dd\3\2"+
		"\2\2;\u00df\3\2\2\2=\u00ea\3\2\2\2?E\5\5\3\2@E\5/\30\2AE\5\'\24\2BE\5"+
		"\17\b\2CE\5\35\17\2D?\3\2\2\2D@\3\2\2\2DA\3\2\2\2DB\3\2\2\2DC\3\2\2\2"+
		"E\4\3\2\2\2FK\5\7\4\2GK\5\t\5\2HK\5\13\6\2IK\5\r\7\2JF\3\2\2\2JG\3\2\2"+
		"\2JH\3\2\2\2JI\3\2\2\2K\6\3\2\2\2LM\7d\2\2MN\7q\2\2NO\7q\2\2OP\7n\2\2"+
		"P\b\3\2\2\2QR\7k\2\2RS\7p\2\2ST\7v\2\2T\n\3\2\2\2UV\7u\2\2VW\7v\2\2WX"+
		"\7t\2\2XY\7k\2\2YZ\7p\2\2Z[\7i\2\2[\f\3\2\2\2\\]\7x\2\2]^\7q\2\2^_\7k"+
		"\2\2_`\7f\2\2`\16\3\2\2\2ah\5\21\t\2bh\5\23\n\2ch\5\25\13\2dh\5\27\f\2"+
		"eh\5\31\r\2fh\5\33\16\2ga\3\2\2\2gb\3\2\2\2gc\3\2\2\2gd\3\2\2\2ge\3\2"+
		"\2\2gf\3\2\2\2h\20\3\2\2\2ij\7k\2\2jk\7h\2\2k\22\3\2\2\2lm\7h\2\2mn\7"+
		"q\2\2no\7t\2\2o\24\3\2\2\2pq\7y\2\2qr\7j\2\2rs\7k\2\2st\7n\2\2tu\7g\2"+
		"\2u\26\3\2\2\2vw\7d\2\2wx\7t\2\2xy\7g\2\2yz\7c\2\2z{\7m\2\2{\30\3\2\2"+
		"\2|}\7e\2\2}~\7q\2\2~\177\7p\2\2\177\u0080\7v\2\2\u0080\u0081\7k\2\2\u0081"+
		"\u0082\7p\2\2\u0082\u0083\7w\2\2\u0083\u0084\7g\2\2\u0084\32\3\2\2\2\u0085"+
		"\u0086\7t\2\2\u0086\u0087\7g\2\2\u0087\u0088\7v\2\2\u0088\u0089\7w\2\2"+
		"\u0089\u008a\7t\2\2\u008a\u008b\7p\2\2\u008b\34\3\2\2\2\u008c\u0090\5"+
		"\37\20\2\u008d\u0090\5!\21\2\u008e\u0090\5#\22\2\u008f\u008c\3\2\2\2\u008f"+
		"\u008d\3\2\2\2\u008f\u008e\3\2\2\2\u0090\36\3\2\2\2\u0091\u0092\7e\2\2"+
		"\u0092\u0093\7n\2\2\u0093\u0094\7c\2\2\u0094\u0095\7u\2\2\u0095\u0096"+
		"\7u\2\2\u0096 \3\2\2\2\u0097\u0098\7p\2\2\u0098\u0099\7g\2\2\u0099\u009a"+
		"\7y\2\2\u009a\"\3\2\2\2\u009b\u009c\7v\2\2\u009c\u009d\7j\2\2\u009d\u009e"+
		"\7k\2\2\u009e\u009f\7u\2\2\u009f$\3\2\2\2\u00a0\u00a5\5\'\24\2\u00a1\u00a5"+
		"\5)\25\2\u00a2\u00a5\5-\27\2\u00a3\u00a5\5/\30\2\u00a4\u00a0\3\2\2\2\u00a4"+
		"\u00a1\3\2\2\2\u00a4\u00a2\3\2\2\2\u00a4\u00a3\3\2\2\2\u00a5&\3\2\2\2"+
		"\u00a6\u00a7\7v\2\2\u00a7\u00a8\7t\2\2\u00a8\u00a9\7w\2\2\u00a9\u00b0"+
		"\7g\2\2\u00aa\u00ab\7h\2\2\u00ab\u00ac\7c\2\2\u00ac\u00ad\7n\2\2\u00ad"+
		"\u00ae\7u\2\2\u00ae\u00b0\7g\2\2\u00af\u00a6\3\2\2\2\u00af\u00aa\3\2\2"+
		"\2\u00b0(\3\2\2\2\u00b1\u00b2\5+\26\2\u00b2*\3\2\2\2\u00b3\u00b7\t\2\2"+
		"\2\u00b4\u00b6\t\3\2\2\u00b5\u00b4\3\2\2\2\u00b6\u00b9\3\2\2\2\u00b7\u00b5"+
		"\3\2\2\2\u00b7\u00b8\3\2\2\2\u00b8,\3\2\2\2\u00b9\u00b7\3\2\2\2\u00ba"+
		"\u00bb\3\2\2\2\u00bb.\3\2\2\2\u00bc\u00bd\7p\2\2\u00bd\u00be\7w\2\2\u00be"+
		"\u00bf\7n\2\2\u00bf\u00c0\7n\2\2\u00c0\60\3\2\2\2\u00c1\u00c5\t\4\2\2"+
		"\u00c2\u00c4\t\5\2\2\u00c3\u00c2\3\2\2\2\u00c4\u00c7\3\2\2\2\u00c5\u00c3"+
		"\3\2\2\2\u00c5\u00c6\3\2\2\2\u00c6\62\3\2\2\2\u00c7\u00c5\3\2\2\2\u00c8"+
		"\u00cc\5\65\33\2\u00c9\u00cc\5\67\34\2\u00ca\u00cc\59\35\2\u00cb\u00c8"+
		"\3\2\2\2\u00cb\u00c9\3\2\2\2\u00cb\u00ca\3\2\2\2\u00cc\64\3\2\2\2\u00cd"+
		"\u00cf\t\6\2\2\u00ce\u00cd\3\2\2\2\u00cf\u00d0\3\2\2\2\u00d0\u00ce\3\2"+
		"\2\2\u00d0\u00d1\3\2\2\2\u00d1\u00d2\3\2\2\2\u00d2\u00d3\b\33\2\2\u00d3"+
		"\66\3\2\2\2\u00d4\u00d6\t\7\2\2\u00d5\u00d4\3\2\2\2\u00d6\u00d7\3\2\2"+
		"\2\u00d7\u00d5\3\2\2\2\u00d7\u00d8\3\2\2\2\u00d8\u00d9\3\2\2\2\u00d9\u00da"+
		"\b\34\2\2\u00da8\3\2\2\2\u00db\u00de\5;\36\2\u00dc\u00de\5=\37\2\u00dd"+
		"\u00db\3\2\2\2\u00dd\u00dc\3\2\2\2\u00de:\3\2\2\2\u00df\u00e0\7\61\2\2"+
		"\u00e0\u00e1\7\61\2\2\u00e1\u00e5\3\2\2\2\u00e2\u00e4\n\7\2\2\u00e3\u00e2"+
		"\3\2\2\2\u00e4\u00e7\3\2\2\2\u00e5\u00e3\3\2\2\2\u00e5\u00e6\3\2\2\2\u00e6"+
		"\u00e8\3\2\2\2\u00e7\u00e5\3\2\2\2\u00e8\u00e9\b\36\2\2\u00e9<\3\2\2\2"+
		"\u00ea\u00eb\7\61\2\2\u00eb\u00ec\7,\2\2\u00ec\u00f0\3\2\2\2\u00ed\u00ef"+
		"\13\2\2\2\u00ee\u00ed\3\2\2\2\u00ef\u00f2\3\2\2\2\u00f0\u00f1\3\2\2\2"+
		"\u00f0\u00ee\3\2\2\2\u00f1\u00f3\3\2\2\2\u00f2\u00f0\3\2\2\2\u00f3\u00f4"+
		"\7,\2\2\u00f4\u00f5\7\61\2\2\u00f5\u00f6\3\2\2\2\u00f6\u00f7\b\37\2\2"+
		"\u00f7>\3\2\2\2\21\2DJg\u008f\u00a4\u00af\u00b7\u00c5\u00cb\u00d0\u00d7"+
		"\u00dd\u00e5\u00f0\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}