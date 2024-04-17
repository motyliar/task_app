extension Cut on String {
  String cut(int index) {
    if (length > index) {
      return substring(0, index);
    } else {
      return this;
    }
  }
}
