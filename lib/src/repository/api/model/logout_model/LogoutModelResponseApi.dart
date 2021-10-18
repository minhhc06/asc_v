class LogoutModelResponseApi {
  String result;
  List<String> wanningMessages;
  List<String> errorMessages;
  String isOk;

  LogoutModelResponseApi(
      this.result, this.wanningMessages, this.errorMessages, this.isOk);

  LogoutModelResponseApi.fromJson(Map<dynamic, dynamic> json) {
    try {
      result = json['result'];
      wanningMessages = json['wanningMessages'];
      errorMessages = json['errorMessages'];
      isOk = json['isOk'];
    } catch (ex) {
      print(ex);
    }
  }
}
