class ErrorResponse {
  final List<String>? errors;
  final int statusCode;

  ErrorResponse(this.errors, this.statusCode);

  @override
  String toString() {
    String e = "Status Code: $statusCode";
    if (errors != null) {
      e += errors.toString();
    }
    return e;
  }
}
