class PayloadJwtLoginPageModel{
  dynamic jti;
  String sub;
  String userId;
  String email;
  dynamic phoneNumber;
  dynamic mobileNumber;
  String firstName;
  String lastName;
  dynamic loaiDoiTuong;
  String doiTuongId;
  String avatar;
  String sessionCode;
  int exp;
  String iss;
  String aud;

  PayloadJwtLoginPageModel({
      this.jti,
      this.sub,
      this.userId,
      this.email,
      this.phoneNumber,
      this.mobileNumber,
      this.firstName,
      this.lastName,
      this.loaiDoiTuong,
      this.doiTuongId,
      this.avatar,
      this.sessionCode,
      this.exp,
      this.iss,
      this.aud});

  PayloadJwtLoginPageModel.fromJson(Map<dynamic, dynamic> json) {
    try{
       jti = json['jti'];
       sub = json['sub'];
       userId = json['userId'];
       email = json['email'];
       phoneNumber = json['phoneNumber'];
       mobileNumber = json['mobileNumber'];
       firstName = json['firstName'];
       lastName = json['lastName'];
       doiTuongId = json['doiTuongId'];
       loaiDoiTuong = json['loaiDoiTuong'];
       avatar = json['avatar'];
       sessionCode = json['sessionCode'];
       exp = json['exp'];
       iss = json['iss'];
       aud = json['aud'];
    }catch(ex){
      print(ex);
    }


  }

}