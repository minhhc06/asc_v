import 'package:vnu_app/src/repository/api/model/FormRequestApiModel/ThoiGianNghiPhepsModel.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/ReasonOfLeave.dart';

class RequestApiUpdateModel{
  int id;
  int loaiDon;
  String tieuDe;
  String noiDung;
  String thoiGian;
  int idNhanSuNhanBanGiao;
  String ngayNhanBanGiao;
  int idNhanSuNhan;
  List<int> idsFileDinhKem = [];
  List<int> idsNhanSuNhan = [];
  List<ReasonOfLeave> lyDoNghiPheps;
  List<int> idsNhanSuCC;
  List<ThoiGianNghiPhepsModel> thoiGianNghiPheps;

  RequestApiUpdateModel({
      this.id,
      this.loaiDon,
      this.tieuDe,
      this.noiDung,
      this.thoiGian,
      this.idNhanSuNhanBanGiao,
      this.ngayNhanBanGiao,
      this.idNhanSuNhan,
      this.lyDoNghiPheps,
      this.idsNhanSuCC,
      this.idsFileDinhKem});

  Map<String, dynamic> toJson() => {
    if(id != null)"id": id,
    if(tieuDe != null)"tieuDe": tieuDe,
    if(noiDung != null)"noiDung": noiDung,
    if(idNhanSuNhanBanGiao != null)"idNhanSuNhanBanGiao": idNhanSuNhanBanGiao,
    if(ngayNhanBanGiao != null)"ngayNhanBanGiao": ngayNhanBanGiao,
    if(idNhanSuNhanBanGiao != null)"idNhanSuNhan": idNhanSuNhan,
    if(idsFileDinhKem != null)"idsFileDinhKem": idsFileDinhKem,
    if(idsNhanSuNhan != null)"idsNhanSuNhan": idsNhanSuNhan,
    if(thoiGian != null) "thoiGian": thoiGian,
    if(lyDoNghiPheps != null) "lyDoNghiPheps": lyDoNghiPheps,
    if(idsNhanSuCC != null) "idsNhanSuCC": idsNhanSuCC,
    if(thoiGianNghiPheps != null) "thoiGianNghiPheps" : thoiGianNghiPheps
  };

}