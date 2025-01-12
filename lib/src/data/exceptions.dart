class MessageException implements Exception {
  const MessageException(this.message);

  final String message;

  @override
  String toString() => message;
}
