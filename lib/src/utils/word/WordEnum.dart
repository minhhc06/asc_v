import 'package:vnu_app/src/utils/word/AssetUnit.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

enum LoginType {
  sso,
  hrm,
}
enum InternetStatus {
  connected,
  notconnected,
}

enum TrangThai {
  _,
  TaoMoi,
  __,
  ___,
  Duyet,
  KhongDuyet,
  TaoQuyetDinh,
  BanHanhQuyetDinh,
  BanHanhThongBao,
  BanTCCBDuyet,
  BanTCCBKhongDuyet,
  ____,
  _____,
  ______,
  _________,
}

extension TrangThaiValue on TrangThai {
  String get name {
    switch (this) {
      case TrangThai._:
        return WordUtil.none;
      case TrangThai.TaoMoi:
        return WordUtil.create;
      case TrangThai.__:
        return WordUtil.undefineText;
      case TrangThai.___:
        return WordUtil.none;
      case TrangThai.Duyet:
        return WordUtil.daduyet;
      case TrangThai.KhongDuyet:
        return WordUtil.khongDuyet;
      case TrangThai.TaoQuyetDinh:
        return WordUtil.daCoQuyetDinh;
      case TrangThai.BanHanhQuyetDinh:
        return WordUtil.daBanHanhQuyetDinh;
      case TrangThai.BanHanhThongBao:
        return WordUtil.daBanHanhThongBao;
      case TrangThai.BanTCCBDuyet:
        return WordUtil.banTCCBDuyet;
      case TrangThai.BanTCCBKhongDuyet:
        return WordUtil.banTCCBKhongDuyet;
      case TrangThai.____:
        return WordUtil.banTCCBKhongDuyet;
      case TrangThai._____:
        return WordUtil.banTCCBKhongDuyet;
      case TrangThai.______:
        return WordUtil.banTCCBKhongDuyet;
      default:
        return '';
        break;
    }
  }

  String get color {
    switch (this) {
      case TrangThai._:
        return ColorUtil.white;
      case TrangThai.TaoMoi:
        return ColorUtil.colorLv8;
      case TrangThai.__:
        return ColorUtil.white;
      case TrangThai.___:
        return ColorUtil.white;
      case TrangThai.Duyet:
        return ColorUtil.colorLv9;
      case TrangThai.KhongDuyet:
        return ColorUtil.colorLv10;
      case TrangThai.TaoQuyetDinh:
        return ColorUtil.colorLv11;
      case TrangThai.BanHanhQuyetDinh:
        return ColorUtil.colorLv12;
      case TrangThai.BanHanhThongBao:
        return ColorUtil.colorLv12;
      case TrangThai.BanTCCBDuyet:
        return ColorUtil.white;
      case TrangThai.BanTCCBKhongDuyet:
        return ColorUtil.white;
      default:
        return ColorUtil.white;
    }
  }

  String get colorText {
    switch (this) {
      case TrangThai._:
        return ColorUtil.white;
      case TrangThai.TaoMoi:
        return '0a0900';
      case TrangThai.__:
        return ColorUtil.white;
      case TrangThai.___:
        return ColorUtil.white;
      case TrangThai.Duyet:
        return '000000';
      case TrangThai.KhongDuyet:
        return ColorUtil.white;
      case TrangThai.TaoQuyetDinh:
        return ColorUtil.white;
      case TrangThai.BanHanhQuyetDinh:
        return ColorUtil.white;
      case TrangThai.BanHanhThongBao:
        return ColorUtil.white;
      case TrangThai.BanTCCBDuyet:
        return ColorUtil.white;
      case TrangThai.BanTCCBKhongDuyet:
        return ColorUtil.white;
      default:
        return ColorUtil.white;
    }
  }

  String get icon {
    switch (this) {
      case TrangThai._:
        return AssetUnit.assetsResignationApplication;
      case TrangThai.TaoMoi:
        return AssetUnit.assetsResignationApplication;
      case TrangThai.__:
        return AssetUnit.assetsResignationApplication;
      case TrangThai.___:
        return AssetUnit.assetsResignationApplication;
      case TrangThai.Duyet:
        return AssetUnit.assetsLeaveOfAbsenceForm;
      case TrangThai.KhongDuyet:
        return AssetUnit.assetsResignationApplication;
      case TrangThai.TaoQuyetDinh:
        return AssetUnit.assetsResignationApplication;
      case TrangThai.BanHanhQuyetDinh:
        return AssetUnit.assetsResignationApplication;
      case TrangThai.BanHanhThongBao:
        return AssetUnit.assestRetirementApplication;
      case TrangThai.BanTCCBDuyet:
        return AssetUnit.assetsResignationApplication;
      case TrangThai.BanTCCBKhongDuyet:
        return AssetUnit.assetsResignationApplication;
      default:
        return AssetUnit.assetsResignationApplication;
        break;
    }
  }
}

enum LoaiDon {
  _,
  Nghiviec,
  NghiPhep,
  NghiHuu,
  TuyenDung,

  /// Nâng bậc lương
  NangBacLuong,

  /// chuyển chức danh nghề nghiệp
  ChuyenNgach,
}

enum HostApi {
  qlns,
  hrm,
  acl,
}

enum HostType {
  cmd,
  read,
}

extension PathHost on HostApi {
  String get values {
    switch (this) {
      case HostApi.acl:
        return ConfigUnit.acl;
        break;
      case HostApi.hrm:
        return ConfigUnit.hrm;
        break;
      case HostApi.qlns:
        return ConfigUnit.qlns;
        break;
    }
    return '';
  }
}

extension PathHostType on HostType {
  String get values {
    switch (this) {
      case HostType.cmd:
        return ConfigUnit.cmd;
        break;
      case HostType.read:
        return ConfigUnit.read;
        break;
    }
    return '';
  }
}

enum Session {
  FullTime,
  Morning,
  Afternoon,
}

extension SessionValue on Session {
  String get values {
    switch (this) {
      case Session.FullTime:
        return WordUtil.allDay;
        break;
      case Session.Morning:
        return WordUtil.morning;
        break;
      case Session.Afternoon:
        return WordUtil.afternoon;
        break;
    }
    return '';
  }
}

enum TypeFormName {
  DON_XIN_CHAM_DUT,
  DON_XIN_NGHI_PHEP,
  THONG_BAO_NGHI_HUU,
}

extension TypeForm on TypeFormName {
  String get values {
    switch (this) {
      case TypeFormName.DON_XIN_CHAM_DUT:
        return '${ConfigUnit.donTuNghiViec}';
        break;
      case TypeFormName.DON_XIN_NGHI_PHEP:
        return '${ConfigUnit.donTuNghiPhep}';
        break;
      case TypeFormName.THONG_BAO_NGHI_HUU:
        return '${ConfigUnit.donTuNghiHuus}';
        break;
    }
    return '';
  }
}

enum FolderServerMedia {
  DON_XIN_CHAM_DUT,
  DON_XIN_NGHI_PHEP,
  THONG_BAO_NGHI_HUU,
}

extension FolderMedia on FolderServerMedia {
  String get values {
    switch (this) {
      case FolderServerMedia.DON_XIN_CHAM_DUT:
        return ConfigUnit.DON_XIN_CHAM_DUT;
        break;
      case FolderServerMedia.DON_XIN_NGHI_PHEP:
        return ConfigUnit.DON_XIN_NGHI_PHEP;
        break;
      case FolderServerMedia.THONG_BAO_NGHI_HUU:
        return ConfigUnit.THONG_BAO_NGHI_HUU;
        break;
    }
    return '';
  }

  String get dateName {
    switch (this) {
      case FolderServerMedia.DON_XIN_CHAM_DUT:
        return '${WordUtil.requestStopContract}';
        break;
      case FolderServerMedia.DON_XIN_NGHI_PHEP:
        return '${WordUtil.handoverTo}';
        break;
      case FolderServerMedia.THONG_BAO_NGHI_HUU:
        return '${WordUtil.retirementFromDay}';
        break;
    }
    return '';
  }

  String get receivedJod {
    switch (this) {
      case FolderServerMedia.DON_XIN_CHAM_DUT:
        return WordUtil.banGiaoViecCho;
        break;
      case FolderServerMedia.DON_XIN_NGHI_PHEP:
        return WordUtil.banGiaoViecCho;
        break;
      case FolderServerMedia.THONG_BAO_NGHI_HUU:
        return WordUtil.nguoiDuyetThongBao;
        break;
    }
    return '';
  }

  String get hintDateName {
    switch (this) {
      case FolderServerMedia.DON_XIN_CHAM_DUT:
        return WordUtil.select;
        break;
      case FolderServerMedia.DON_XIN_NGHI_PHEP:
        return WordUtil.selectDate;
        break;
      case FolderServerMedia.THONG_BAO_NGHI_HUU:
        return WordUtil.selectDate;
        break;
    }
    return '';
  }

  String get titleName {
    switch (this) {
      case FolderServerMedia.DON_XIN_CHAM_DUT:
        return WordUtil.lyDoChamDutHopDong;
        break;
      case FolderServerMedia.DON_XIN_NGHI_PHEP:
        return WordUtil.note;
        break;
      case FolderServerMedia.THONG_BAO_NGHI_HUU:
        return WordUtil.noiLuu;
        break;
    }
    return '';
  }

  String get hintTitleName {
    switch (this) {
      case FolderServerMedia.DON_XIN_CHAM_DUT:
        return WordUtil.nhapLyDoChamDutHopDong;
        break;
      case FolderServerMedia.DON_XIN_NGHI_PHEP:
        return WordUtil.enterNote;
        break;
      case FolderServerMedia.THONG_BAO_NGHI_HUU:
        return WordUtil.nhapNoiLuu;
        break;
    }
    return '';
  }

  String get name {
    switch (this) {
      case FolderServerMedia.DON_XIN_CHAM_DUT:
        return WordUtil.createResignation;
        break;
      case FolderServerMedia.DON_XIN_NGHI_PHEP:
        return WordUtil.createLeave;
        break;
      case FolderServerMedia.THONG_BAO_NGHI_HUU:
        return WordUtil.createRetirement;
        break;
    }
    return '';
  }

  String get url {
    switch (this) {
      case FolderServerMedia.DON_XIN_CHAM_DUT:
        return '${ConfigUnit.donTuNghiViec}';
        break;
      case FolderServerMedia.DON_XIN_NGHI_PHEP:
        return '${ConfigUnit.donTuNghiPhep}';
        break;
      case FolderServerMedia.THONG_BAO_NGHI_HUU:
        return '${ConfigUnit.donTuNghiHuus}';
        break;
    }
    return '';
  }
}
