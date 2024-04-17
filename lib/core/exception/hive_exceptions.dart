class HiveException implements Exception {
  final String message;

  HiveException(this.message);

  factory HiveException.add(String message) =>
      HiveException("Failed add task: $message");
  factory HiveException.get(String message) =>
      HiveException("Failed get tasks: $message");
  factory HiveException.delete(String message) =>
      HiveException("Failed delete tasks: $message");

  @override
  String toString() {
    return 'Hive Exception: $message';
  }
}
