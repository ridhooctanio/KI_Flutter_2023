extension StringExtension on String {
  bool isURLValid() {
    final regex = RegExp(
      r'^(http(s)?:\/\/)?(www\.)?[a-zA-Z0-9-_\.]+(\.[a-zA-Z]{2,})(:\d{1,5})?(\/\S*)?$',
      caseSensitive: false,
      multiLine: false,
    );

    return regex.hasMatch(this);
  }
}
