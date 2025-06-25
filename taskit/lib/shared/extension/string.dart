extension StringUpper on String {
  String toUpperFirstLetter() {
    if (isEmpty) return '';
    final firstLetter = this[0].toUpperCase();
    final rest = substring(1);
    return '$firstLetter$rest';
  }

  bool containIgnoreCase(String text) {
    if (isEmpty && text.isEmpty) return true;
    final textLower = text.toLowerCase();
    final thisLower = toLowerCase();
    return thisLower.contains(textLower);
  }
}
