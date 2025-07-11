class ServerException implements Exception {
  final String message;
  final String errorCode;
  final String error;
   ServerException(this.message, [this.errorCode = "", this.error=""] );

  @override
  String toString() {
    return message;
  }
}


