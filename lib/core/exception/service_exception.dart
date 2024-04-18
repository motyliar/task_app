class ServiceException implements Exception {
  ServiceException(this.message);
  String message;

  @override
  String toString() => "Exception :$message";
}
