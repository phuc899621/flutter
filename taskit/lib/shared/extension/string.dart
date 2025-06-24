extension StringUpper on String {
  String toUpperFirstLetter() {
    if (isEmpty) return '';
    final firstLetter = this[0].toUpperCase();
    final rest = substring(1);
    return '$firstLetter$rest';
  }
}
