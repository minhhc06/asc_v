class LoginModelResponseApi{
  String accessToken;
  String errorCode;
  String errorMessage;
  String refreshToken;

  LoginModelResponseApi({this.accessToken, this.refreshToken, this.errorCode, this.errorMessage});

  LoginModelResponseApi.fromJson(Map<dynamic, dynamic> json) {
    try{
      accessToken = json['accessToken'];
      refreshToken = json['refreshToken'];
      errorCode = json['errorCode'];
      errorMessage = json['errorMessage'];
    }catch(ex){
      print(ex);
    }


  }

}