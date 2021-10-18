import 'package:vnu_app/src/repository/api/model/request_leave_model/DateTimeOfLeave.dart';
import 'package:vnu_app/src/repository/api/model/request_leave_model/ReasonOfLeave.dart';

class RequestLeaveReaquestModel {
  String tieuDe;
  String noiDung;
  String thoiGian;
  String thoiGianDen;
  int idNhanSuNhanBanGiao;
  String ngayNhanBanGiao;
  List<DateTimeOfLeave> thoiGianNghiPheps;
  List<int> idsNhanSuNhan;
  List<int> idsFileDinhKem;
  List<ReasonOfLeave> lyDoNghiPheps;
  RequestLeaveReaquestModel({
    this.idNhanSuNhanBanGiao,
    this.idsFileDinhKem,
    this.idsNhanSuNhan,
    this.lyDoNghiPheps,
    this.ngayNhanBanGiao,
    this.noiDung,
    this.thoiGian,
    this.thoiGianDen,
    this.thoiGianNghiPheps,
    this.tieuDe,
  });
  Map<String, dynamic> toJson() => {
        'tieuDe': tieuDe,
        'noiDung': noiDung,
        'thoiGian': thoiGian,
        'thoiGianDen': thoiGianDen,
        'idNhanSuNhanBanGiao': idNhanSuNhanBanGiao,
        'ngayNhanBanGiao': ngayNhanBanGiao,
        'thoiGianNghiPheps': thoiGianNghiPheps,
        'idsNhanSuNhan': idsNhanSuNhan,
        'idsFileDinhKem': idsFileDinhKem,
        'lyDoNghiPheps': lyDoNghiPheps
      };
}
