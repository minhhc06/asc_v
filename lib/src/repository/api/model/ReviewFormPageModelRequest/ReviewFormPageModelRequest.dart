class ReviewFormPageModelRequest{
  int id;
  int loaiDon;
  String lyDoDuyet;
  int trangThai;
  String thoiGian;

  ReviewFormPageModelRequest({this.id, this.lyDoDuyet, this.trangThai, this.thoiGian});

  Map<String, dynamic> toJson() => {
      "id": id,
      "lyDoDuyet": lyDoDuyet,
      "trangThai": trangThai,
      if(thoiGian != null) "thoiGian": thoiGian

  };

}