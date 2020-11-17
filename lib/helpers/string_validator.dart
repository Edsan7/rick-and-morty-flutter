class StringValidator {
  static String isEmptyString(String value) {
    return value.trim().isEmpty ? 'Fill the blank first to search!!!' : null;
  }
  static String removeSpaces(String value) {
    return value.replaceAll(new RegExp(r"\s+"), "").toLowerCase();
  }
}
