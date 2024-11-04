abstract class Prompts {
  static const String analyze = '';
  static const String correct = '';

  static String analyzePoem({
    required String text,
    required String basedOn,
  }) {
    return "حلل لي النص الشعري $text بمعايير التحليل $basedOn";
  }

  static String correctPoem({
    required String text,
    required String basedOn,
  }) {
    // return "اعد صياغة النص الشعري التالي : $text , ليكون صحيحا بحسب معايير $basedOn";
    // return "اعد صياغة النص الشعري $text , ليكون شعرا صحيحا $basedOn";
    return "اعد صياغة النص الشعري $text بمعايير التصحيح $basedOn";
  }

  static String createPoem({
    required String poet,
    required String occasion,
    required String feelings,
    required int length,
  }) {
    return "أكتب لي قصيدة من $length أبيات $poet فيها مشاعر $feelings عن $occasion";
    // return "اكتب لي قصيدة $poet تتكون من $length أبيات بمناسبة $occasion فيها مشاعر $feelings.";
    // return "اكتب لي شعر $poet بمناسبة $occasion فيه مشاعر $feelings ويتكون من أبيات عددها $length .";
  }
}
