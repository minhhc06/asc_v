class LogoutModelRequestApi {
  bool isCurrentUserLogout;
  List<String> listOfSessionCode;

  LogoutModelRequestApi({this.isCurrentUserLogout, this.listOfSessionCode});
  Map<String, dynamic> toJson() => {
        'isCurrentUserLogout': isCurrentUserLogout,
        'listOfSessionCode': listOfSessionCode
      };
}
