class HiveException implements Exception {
  final String message;

  HiveException(this.message);

  factory HiveException.add(String message) =>
      HiveException("Failed add task: $message");

  @override
  String toString() {
    return 'Hive Exception: $message';
  }
}
