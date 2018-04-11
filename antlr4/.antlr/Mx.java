// Generated from d:\Users\DELL\Desktop\compiler-lite\antlr4\Mx.g4 by ANTLR 4.7.1
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class Mx extends Lexer {
	static { RuntimeMetaData.checkVersion("4.7.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		Token=1, Keyword=2, Constant=3, LogicConstant=4, IntegerConstant=5, StringConstant=6, 
		CharacterConstant=7, NullConstant=8, Identifier=9, WhiteSpace=10, SpecialToken=11, 
		LineComment=12, BlockComment=13;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	public static final String[] ruleNames = {
		"Token", "Keyword", "Constant", "LogicConstant", "IntegerConstant", "StringConstant", 
		"CharacterConstant", "NullConstant", "Identifier", "WhiteSpace", "SpecialToken", 
		"LineComment", "BlockComment"
	};

	private static final String[] _LITERAL_NAMES = {
		null, null, null, null, null, null, null, null, "'null'"
	};
	private static final String[] _SYMBOLIC_NAMES = {
		null, "Token", "Keyword", "Constant", "LogicConstant", "IntegerConstant", 
		"StringConstant", "CharacterConstant", "NullConstant", "Identifier", "WhiteSpace", 
		"SpecialToken", "LineComment", "BlockComment"
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


	public Mx(CharStream input) {
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\17\u00d2\b\1\4\2"+
		"\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4"+
		"\13\t\13\4\f\t\f\4\r\t\r\4\16\t\16\3\2\3\2\3\2\5\2!\n\2\3\3\3\3\3\3\3"+
		"\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3"+
		"\5\38\n\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\5\3C\n\3\3\3\3\3\3\3\3\3"+
		"\3\3\3\3\3\3\3\3\3\3\3\3\5\3O\n\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3"+
		"\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\5\3d\n\3\3\3\3\3\3\3\3\3\3\3"+
		"\3\3\3\3\3\3\3\3\3\3\3\3\3\3\5\3r\n\3\5\3t\n\3\3\4\3\4\3\4\3\4\5\4z\n"+
		"\4\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\5\5\u0085\n\5\3\6\3\6\7\6\u0089"+
		"\n\6\f\6\16\6\u008c\13\6\3\7\3\7\7\7\u0090\n\7\f\7\16\7\u0093\13\7\3\7"+
		"\3\7\3\b\3\b\3\b\3\b\5\b\u009b\n\b\3\b\3\b\3\b\3\b\5\b\u00a1\n\b\3\t\3"+
		"\t\3\t\3\t\3\t\3\n\3\n\7\n\u00aa\n\n\f\n\16\n\u00ad\13\n\3\13\6\13\u00b0"+
		"\n\13\r\13\16\13\u00b1\3\13\3\13\3\f\3\f\5\f\u00b8\n\f\3\r\3\r\3\r\3\r"+
		"\7\r\u00be\n\r\f\r\16\r\u00c1\13\r\3\r\3\r\3\16\3\16\3\16\3\16\7\16\u00c9"+
		"\n\16\f\16\16\16\u00cc\13\16\3\16\3\16\3\16\3\16\3\16\3\u00ca\2\17\3\3"+
		"\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23\13\25\f\27\r\31\16\33\17\3\2\b\5\2"+
		"ppttvv\3\2^^\4\2C\\c|\6\2\62;C\\aac|\5\2\13\f\17\17\"\"\4\2\f\f\17\17"+
		"\2\u00ef\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2"+
		"\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2\25\3\2\2\2\2\27"+
		"\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\3 \3\2\2\2\5s\3\2\2\2\7y\3\2\2\2\t"+
		"\u0084\3\2\2\2\13\u0086\3\2\2\2\r\u008d\3\2\2\2\17\u00a0\3\2\2\2\21\u00a2"+
		"\3\2\2\2\23\u00a7\3\2\2\2\25\u00af\3\2\2\2\27\u00b7\3\2\2\2\31\u00b9\3"+
		"\2\2\2\33\u00c4\3\2\2\2\35!\5\5\3\2\36!\5\7\4\2\37!\5\23\n\2 \35\3\2\2"+
		"\2 \36\3\2\2\2 \37\3\2\2\2!\4\3\2\2\2\"#\7d\2\2#$\7q\2\2$%\7q\2\2%8\7"+
		"n\2\2&\'\7k\2\2\'(\7p\2\2(8\7v\2\2)*\7u\2\2*+\7v\2\2+,\7t\2\2,-\7k\2\2"+
		"-.\7p\2\2.8\7i\2\2/\60\7p\2\2\60\61\7w\2\2\61\62\7n\2\2\628\7n\2\2\63"+
		"\64\7x\2\2\64\65\7q\2\2\65\66\7k\2\2\668\7f\2\2\67\"\3\2\2\2\67&\3\2\2"+
		"\2\67)\3\2\2\2\67/\3\2\2\2\67\63\3\2\2\28t\3\2\2\29:\7v\2\2:;\7t\2\2;"+
		"<\7w\2\2<C\7g\2\2=>\7h\2\2>?\7c\2\2?@\7n\2\2@A\7u\2\2AC\7g\2\2B9\3\2\2"+
		"\2B=\3\2\2\2Ct\3\2\2\2DE\7k\2\2EO\7h\2\2FG\7h\2\2GH\7q\2\2HO\7t\2\2IJ"+
		"\7y\2\2JK\7j\2\2KL\7k\2\2LM\7n\2\2MO\7g\2\2ND\3\2\2\2NF\3\2\2\2NI\3\2"+
		"\2\2Ot\3\2\2\2PQ\7d\2\2QR\7t\2\2RS\7g\2\2ST\7c\2\2Td\7m\2\2UV\7e\2\2V"+
		"W\7q\2\2WX\7p\2\2XY\7v\2\2YZ\7k\2\2Z[\7p\2\2[\\\7w\2\2\\d\7g\2\2]^\7t"+
		"\2\2^_\7g\2\2_`\7v\2\2`a\7w\2\2ab\7t\2\2bd\7p\2\2cP\3\2\2\2cU\3\2\2\2"+
		"c]\3\2\2\2dt\3\2\2\2ef\7p\2\2fg\7g\2\2gr\7y\2\2hi\7e\2\2ij\7n\2\2jk\7"+
		"c\2\2kl\7u\2\2lr\7u\2\2mn\7v\2\2no\7j\2\2op\7k\2\2pr\7u\2\2qe\3\2\2\2"+
		"qh\3\2\2\2qm\3\2\2\2rt\3\2\2\2s\67\3\2\2\2sB\3\2\2\2sN\3\2\2\2sc\3\2\2"+
		"\2sq\3\2\2\2t\6\3\2\2\2uz\5\t\5\2vz\5\13\6\2wz\5\r\7\2xz\5\21\t\2yu\3"+
		"\2\2\2yv\3\2\2\2yw\3\2\2\2yx\3\2\2\2z\b\3\2\2\2{|\7v\2\2|}\7t\2\2}~\7"+
		"w\2\2~\u0085\7g\2\2\177\u0080\7h\2\2\u0080\u0081\7c\2\2\u0081\u0082\7"+
		"n\2\2\u0082\u0083\7u\2\2\u0083\u0085\7g\2\2\u0084{\3\2\2\2\u0084\177\3"+
		"\2\2\2\u0085\n\3\2\2\2\u0086\u008a\4\63;\2\u0087\u0089\4\62;\2\u0088\u0087"+
		"\3\2\2\2\u0089\u008c\3\2\2\2\u008a\u0088\3\2\2\2\u008a\u008b\3\2\2\2\u008b"+
		"\f\3\2\2\2\u008c\u008a\3\2\2\2\u008d\u0091\7$\2\2\u008e\u0090\5\17\b\2"+
		"\u008f\u008e\3\2\2\2\u0090\u0093\3\2\2\2\u0091\u008f\3\2\2\2\u0091\u0092"+
		"\3\2\2\2\u0092\u0094\3\2\2\2\u0093\u0091\3\2\2\2\u0094\u0095\7$\2\2\u0095"+
		"\16\3\2\2\2\u0096\u009a\7)\2\2\u0097\u009b\7\"\2\2\u0098\u0099\7)\2\2"+
		"\u0099\u009b\t\2\2\2\u009a\u0097\3\2\2\2\u009a\u0098\3\2\2\2\u009b\u009c"+
		"\3\2\2\2\u009c\u00a1\7)\2\2\u009d\u009e\7)\2\2\u009e\u009f\n\3\2\2\u009f"+
		"\u00a1\7)\2\2\u00a0\u0096\3\2\2\2\u00a0\u009d\3\2\2\2\u00a1\20\3\2\2\2"+
		"\u00a2\u00a3\7p\2\2\u00a3\u00a4\7w\2\2\u00a4\u00a5\7n\2\2\u00a5\u00a6"+
		"\7n\2\2\u00a6\22\3\2\2\2\u00a7\u00ab\t\4\2\2\u00a8\u00aa\t\5\2\2\u00a9"+
		"\u00a8\3\2\2\2\u00aa\u00ad\3\2\2\2\u00ab\u00a9\3\2\2\2\u00ab\u00ac\3\2"+
		"\2\2\u00ac\24\3\2\2\2\u00ad\u00ab\3\2\2\2\u00ae\u00b0\t\6\2\2\u00af\u00ae"+
		"\3\2\2\2\u00b0\u00b1\3\2\2\2\u00b1\u00af\3\2\2\2\u00b1\u00b2\3\2\2\2\u00b2"+
		"\u00b3\3\2\2\2\u00b3\u00b4\b\13\2\2\u00b4\26\3\2\2\2\u00b5\u00b8\5\31"+
		"\r\2\u00b6\u00b8\5\33\16\2\u00b7\u00b5\3\2\2\2\u00b7\u00b6\3\2\2\2\u00b8"+
		"\30\3\2\2\2\u00b9\u00ba\7\61\2\2\u00ba\u00bb\7\61\2\2\u00bb\u00bf\3\2"+
		"\2\2\u00bc\u00be\n\7\2\2\u00bd\u00bc\3\2\2\2\u00be\u00c1\3\2\2\2\u00bf"+
		"\u00bd\3\2\2\2\u00bf\u00c0\3\2\2\2\u00c0\u00c2\3\2\2\2\u00c1\u00bf\3\2"+
		"\2\2\u00c2\u00c3\b\r\2\2\u00c3\32\3\2\2\2\u00c4\u00c5\7\61\2\2\u00c5\u00c6"+
		"\7,\2\2\u00c6\u00ca\3\2\2\2\u00c7\u00c9\13\2\2\2\u00c8\u00c7\3\2\2\2\u00c9"+
		"\u00cc\3\2\2\2\u00ca\u00cb\3\2\2\2\u00ca\u00c8\3\2\2\2\u00cb\u00cd\3\2"+
		"\2\2\u00cc\u00ca\3\2\2\2\u00cd\u00ce\7,\2\2\u00ce\u00cf\7\61\2\2\u00cf"+
		"\u00d0\3\2\2\2\u00d0\u00d1\b\16\2\2\u00d1\34\3\2\2\2\25\2 \67BNcqsy\u0084"+
		"\u008a\u0091\u009a\u00a0\u00ab\u00b1\u00b7\u00bf\u00ca\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}