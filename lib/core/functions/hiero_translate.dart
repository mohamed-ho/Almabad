import 'package:translator/translator.dart';

Future<String> translateToHieroglyph(String input) async {
  Map<String, String> hieroglyphMap = {
    "a": "𓄿",
    "b": "𓃀",
    "c": "𓃂",
    "d": "𓂓",
    "e": "𓇋",
    "f": "𓆑",
    "g": "𓎼",
    "h": "𓉔",
    "i": "𓇋",
    "j": "𓏲",
    "k": "𓎡",
    "l": "𓃭",
    "m": "𓈖",
    "n": "𓏤",
    "o": "𓍯",
    "p": "𓊪",
    "q": "𓏘",
    "r": "𓂋",
    "s": "𓋴",
    "t": "𓏏",
    "u": "𓅱",
    "v": "𓆑",
    "w": "𓅱",
    "x": "𓐍",
    "y": "𓇋",
    "z": "𓊃"
  };

  GoogleTranslator translator = GoogleTranslator();
  final result = await translator.translate(input, to: 'en');

  String translated =
      result.text.substring(0, 2).toLowerCase().split('').map((char) {
    return hieroglyphMap[char] ?? char;
  }).join('');

  return translated;
}
