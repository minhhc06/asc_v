// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Tên đăng nhập ENG`
  String get username {
    return Intl.message(
      'Tên đăng nhập ENG',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu ENG`
  String get password {
    return Intl.message(
      'Mật khẩu ENG',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập ENG`
  String get login {
    return Intl.message(
      'Đăng nhập ENG',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Quên mật khẩu? ENG`
  String get forgetPassword {
    return Intl.message(
      'Quên mật khẩu? ENG',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Trở về ENG`
  String get back {
    return Intl.message(
      'Trở về ENG',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Đăng nhập ENG`
  String get titlePage {
    return Intl.message(
      'Đăng nhập ENG',
      name: 'titlePage',
      desc: '',
      args: [],
    );
  }

  /// `ĐĂNG NHẬP SSO ENG`
  String get btnLoginSSO {
    return Intl.message(
      'ĐĂNG NHẬP SSO ENG',
      name: 'btnLoginSSO',
      desc: '',
      args: [],
    );
  }

  /// `ĐĂNG NHẬP HRM ENG`
  String get btnLoginHRM {
    return Intl.message(
      'ĐĂNG NHẬP HRM ENG',
      name: 'btnLoginHRM',
      desc: '',
      args: [],
    );
  }

  /// `Hoặc ENG`
  String get titleOr {
    return Intl.message(
      'Hoặc ENG',
      name: 'titleOr',
      desc: '',
      args: [],
    );
  }

  /// `Chào mừng bạn đến với hệ thống quản lý\nnguồn nhân lực của ĐHQGHN ENG`
  String get selectLoginWellcom {
    return Intl.message(
      'Chào mừng bạn đến với hệ thống quản lý\nnguồn nhân lực của ĐHQGHN ENG',
      name: 'selectLoginWellcom',
      desc: '',
      args: [],
    );
  }

  /// `Thay đổi mật khẩu ENG`
  String get titlePageReset {
    return Intl.message(
      'Thay đổi mật khẩu ENG',
      name: 'titlePageReset',
      desc: '',
      args: [],
    );
  }

  /// `LƯU MẬT KHẨU ENG`
  String get btnSaveResetPassPage {
    return Intl.message(
      'LƯU MẬT KHẨU ENG',
      name: 'btnSaveResetPassPage',
      desc: '',
      args: [],
    );
  }

  /// `Nhập mật khẩu mới ENG`
  String get titleNewPass {
    return Intl.message(
      'Nhập mật khẩu mới ENG',
      name: 'titleNewPass',
      desc: '',
      args: [],
    );
  }

  /// `Nhập lại mật khẩu mới ENG`
  String get titleReNewPass {
    return Intl.message(
      'Nhập lại mật khẩu mới ENG',
      name: 'titleReNewPass',
      desc: '',
      args: [],
    );
  }

  /// `Thông báo ENG`
  String get titleNotificationPage {
    return Intl.message(
      'Thông báo ENG',
      name: 'titleNotificationPage',
      desc: '',
      args: [],
    );
  }

  /// `Trang chủ ENG`
  String get home {
    return Intl.message(
      'Trang chủ ENG',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Thông báo ENG`
  String get notification {
    return Intl.message(
      'Thông báo ENG',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Tin tức ENG`
  String get news {
    return Intl.message(
      'Tin tức ENG',
      name: 'news',
      desc: '',
      args: [],
    );
  }

  /// `Tài khoản ENG`
  String get account {
    return Intl.message(
      'Tài khoản ENG',
      name: 'account',
      desc: '',
      args: [],
    );
  }

  /// `Việc ban hành Quy chế cán bộ Đoàn TNCS Hồ Chí Minh (gọi tắt là Quy chế) có vai trò quan trọng trong chuẩn hóa đội ngũ cán bộ Đoàn các cấp, góp phần nâng cao chất lượng công tác thanh, thiếu nhi cả nước. Tuy nhiên, qua 10 năm triển khai Quy chế, đã xuất hiện không ít bất cập. ENG`
  String get newsContent {
    return Intl.message(
      'Việc ban hành Quy chế cán bộ Đoàn TNCS Hồ Chí Minh (gọi tắt là Quy chế) có vai trò quan trọng trong chuẩn hóa đội ngũ cán bộ Đoàn các cấp, góp phần nâng cao chất lượng công tác thanh, thiếu nhi cả nước. Tuy nhiên, qua 10 năm triển khai Quy chế, đã xuất hiện không ít bất cập. ENG',
      name: 'newsContent',
      desc: '',
      args: [],
    );
  }

  /// `Thông tin cá nhân ENG`
  String get information {
    return Intl.message(
      'Thông tin cá nhân ENG',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu hiện tại ENG`
  String get passwordOld {
    return Intl.message(
      'Mật khẩu hiện tại ENG',
      name: 'passwordOld',
      desc: '',
      args: [],
    );
  }

  /// `Đổi mật khẩu ENG`
  String get resetPassword {
    return Intl.message(
      'Đổi mật khẩu ENG',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Mật khẩu mới ENG`
  String get newPassword {
    return Intl.message(
      'Mật khẩu mới ENG',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận mật khẩu ENG`
  String get reNewPassword {
    return Intl.message(
      'Xác nhận mật khẩu ENG',
      name: 'reNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Xem biểu mẫu ENG`
  String get viewForm {
    return Intl.message(
      'Xem biểu mẫu ENG',
      name: 'viewForm',
      desc: '',
      args: [],
    );
  }

  /// `Đăng xuất ENG`
  String get logout {
    return Intl.message(
      'Đăng xuất ENG',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Lưu ENG`
  String get save {
    return Intl.message(
      'Lưu ENG',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Họ và tên ENG`
  String get fullName {
    return Intl.message(
      'Họ và tên ENG',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Giới tính ENG`
  String get gender {
    return Intl.message(
      'Giới tính ENG',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Chọn ngày sinh ENG`
  String get selectBirthDay {
    return Intl.message(
      'Chọn ngày sinh ENG',
      name: 'selectBirthDay',
      desc: '',
      args: [],
    );
  }

  /// `Ngày sinh ENG`
  String get birthDay {
    return Intl.message(
      'Ngày sinh ENG',
      name: 'birthDay',
      desc: '',
      args: [],
    );
  }

  /// `Đơn vị công tác ENG`
  String get workUnit {
    return Intl.message(
      'Đơn vị công tác ENG',
      name: 'workUnit',
      desc: '',
      args: [],
    );
  }

  /// `Chọn đơn vị công tác ENG`
  String get selectWorkUnit {
    return Intl.message(
      'Chọn đơn vị công tác ENG',
      name: 'selectWorkUnit',
      desc: '',
      args: [],
    );
  }

  /// `Chức vụ chức danh nghề nghiệp ENG`
  String get position {
    return Intl.message(
      'Chức vụ chức danh nghề nghiệp ENG',
      name: 'position',
      desc: '',
      args: [],
    );
  }

  /// `Chọn chức vụ chức danh nghề nghiệp ENG`
  String get selectPosition {
    return Intl.message(
      'Chọn chức vụ chức danh nghề nghiệp ENG',
      name: 'selectPosition',
      desc: '',
      args: [],
    );
  }

  /// `Số điện thoại ENG`
  String get phone {
    return Intl.message(
      'Số điện thoại ENG',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Email ENG`
  String get email {
    return Intl.message(
      'Email ENG',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Lưu thay đổi ENG`
  String get saveChange {
    return Intl.message(
      'Lưu thay đổi ENG',
      name: 'saveChange',
      desc: '',
      args: [],
    );
  }

  /// `Chế độ chính sách ENG`
  String get policy {
    return Intl.message(
      'Chế độ chính sách ENG',
      name: 'policy',
      desc: '',
      args: [],
    );
  }

  /// `Đơn xin nghỉ hưu ENG`
  String get retirementApplication {
    return Intl.message(
      'Đơn xin nghỉ hưu ENG',
      name: 'retirementApplication',
      desc: '',
      args: [],
    );
  }

  /// `Đơn xin nghỉ việc ENG`
  String get resignationApplication {
    return Intl.message(
      'Đơn xin nghỉ việc ENG',
      name: 'resignationApplication',
      desc: '',
      args: [],
    );
  }

  /// `Đơn xin nghỉ phép ENG`
  String get leaveOfAbsenceForm {
    return Intl.message(
      'Đơn xin nghỉ phép ENG',
      name: 'leaveOfAbsenceForm',
      desc: '',
      args: [],
    );
  }

  /// `Đơn đã nhận ENG`
  String get receivedApplication {
    return Intl.message(
      'Đơn đã nhận ENG',
      name: 'receivedApplication',
      desc: '',
      args: [],
    );
  }

  /// `Đơn đã gửi ENG`
  String get sendApplication {
    return Intl.message(
      'Đơn đã gửi ENG',
      name: 'sendApplication',
      desc: '',
      args: [],
    );
  }

  /// `Tất cả đơn ENG`
  String get allApplication {
    return Intl.message(
      'Tất cả đơn ENG',
      name: 'allApplication',
      desc: '',
      args: [],
    );
  }

  /// `Tạo đơn xin nghỉ phép ENG`
  String get createRequestLeave {
    return Intl.message(
      'Tạo đơn xin nghỉ phép ENG',
      name: 'createRequestLeave',
      desc: '',
      args: [],
    );
  }

  /// `Lọc trạng thái ENG`
  String get sortStatus {
    return Intl.message(
      'Lọc trạng thái ENG',
      name: 'sortStatus',
      desc: '',
      args: [],
    );
  }

  /// `Đóng ENG`
  String get close {
    return Intl.message(
      'Đóng ENG',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Gửi ENG`
  String get send {
    return Intl.message(
      'Gửi ENG',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Nhập tên người gửi ENG`
  String get enterReveiver {
    return Intl.message(
      'Nhập tên người gửi ENG',
      name: 'enterReveiver',
      desc: '',
      args: [],
    );
  }

  /// `Kính gửi ENG`
  String get dear {
    return Intl.message(
      'Kính gửi ENG',
      name: 'dear',
      desc: '',
      args: [],
    );
  }

  /// `Tiêu dề ENG`
  String get title {
    return Intl.message(
      'Tiêu dề ENG',
      name: 'title',
      desc: '',
      args: [],
    );
  }

  /// `Nhập tiêu dề ENG`
  String get enterTitle {
    return Intl.message(
      'Nhập tiêu dề ENG',
      name: 'enterTitle',
      desc: '',
      args: [],
    );
  }

  /// `Lý do nghỉ ENG`
  String get reason {
    return Intl.message(
      'Lý do nghỉ ENG',
      name: 'reason',
      desc: '',
      args: [],
    );
  }

  /// `Chọn ENG`
  String get select {
    return Intl.message(
      'Chọn ENG',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Thời gian ENG`
  String get time {
    return Intl.message(
      'Thời gian ENG',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Chọn ngày ENG`
  String get selectDate {
    return Intl.message(
      'Chọn ngày ENG',
      name: 'selectDate',
      desc: '',
      args: [],
    );
  }

  /// `Chọn buổi ENG`
  String get selectSession {
    return Intl.message(
      'Chọn buổi ENG',
      name: 'selectSession',
      desc: '',
      args: [],
    );
  }

  /// `Bàn giao công việc cho ENG`
  String get handover {
    return Intl.message(
      'Bàn giao công việc cho ENG',
      name: 'handover',
      desc: '',
      args: [],
    );
  }

  /// `Tin tức chung ENG`
  String get generalNews {
    return Intl.message(
      'Tin tức chung ENG',
      name: 'generalNews',
      desc: '',
      args: [],
    );
  }

  /// `Tuyển sinh ENG`
  String get admissions {
    return Intl.message(
      'Tuyển sinh ENG',
      name: 'admissions',
      desc: '',
      args: [],
    );
  }

  /// `Đào tạo ENG`
  String get training {
    return Intl.message(
      'Đào tạo ENG',
      name: 'training',
      desc: '',
      args: [],
    );
  }

  /// `Hợp tác ENG`
  String get coOperate {
    return Intl.message(
      'Hợp tác ENG',
      name: 'coOperate',
      desc: '',
      args: [],
    );
  }

  /// `Ghi chú ENG`
  String get note {
    return Intl.message(
      'Ghi chú ENG',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Nhập nội dung ghi chú ENG`
  String get enterNote {
    return Intl.message(
      'Nhập nội dung ghi chú ENG',
      name: 'enterNote',
      desc: '',
      args: [],
    );
  }

  /// `Bàn giao công việc trước ngày ENG`
  String get receivedDate {
    return Intl.message(
      'Bàn giao công việc trước ngày ENG',
      name: 'receivedDate',
      desc: '',
      args: [],
    );
  }

  /// `Đính kèm(Giấy khám, biên bản bàn giao) ENG`
  String get attach {
    return Intl.message(
      'Đính kèm(Giấy khám, biên bản bàn giao) ENG',
      name: 'attach',
      desc: '',
      args: [],
    );
  }

  /// `Tất cả ENG`
  String get all {
    return Intl.message(
      'Tất cả ENG',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Đánh giá ENG`
  String get evaluate {
    return Intl.message(
      'Đánh giá ENG',
      name: 'evaluate',
      desc: '',
      args: [],
    );
  }

  /// `Nghỉ phép ENG`
  String get leaveOfAbsence {
    return Intl.message(
      'Nghỉ phép ENG',
      name: 'leaveOfAbsence',
      desc: '',
      args: [],
    );
  }

  /// `Nghỉ việc ENG`
  String get resignation {
    return Intl.message(
      'Nghỉ việc ENG',
      name: 'resignation',
      desc: '',
      args: [],
    );
  }

  /// `Thoát ENG`
  String get cancel {
    return Intl.message(
      'Thoát ENG',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Cắt ảnh ENG`
  String get cropImage {
    return Intl.message(
      'Cắt ảnh ENG',
      name: 'cropImage',
      desc: '',
      args: [],
    );
  }

  /// `Cả ngày ENG`
  String get allDay {
    return Intl.message(
      'Cả ngày ENG',
      name: 'allDay',
      desc: '',
      args: [],
    );
  }

  /// `Buổi sáng ENG`
  String get morning {
    return Intl.message(
      'Buổi sáng ENG',
      name: 'morning',
      desc: '',
      args: [],
    );
  }

  /// `Buổi chiều ENG`
  String get afternoon {
    return Intl.message(
      'Buổi chiều ENG',
      name: 'afternoon',
      desc: '',
      args: [],
    );
  }

  /// `Phép năm ENG`
  String get annualLeave {
    return Intl.message(
      'Phép năm ENG',
      name: 'annualLeave',
      desc: '',
      args: [],
    );
  }

  /// `Nghỉ việc riêng không lương ENG`
  String get privateLeave {
    return Intl.message(
      'Nghỉ việc riêng không lương ENG',
      name: 'privateLeave',
      desc: '',
      args: [],
    );
  }

  /// `Nghỉ ốm ENG`
  String get sickLeave {
    return Intl.message(
      'Nghỉ ốm ENG',
      name: 'sickLeave',
      desc: '',
      args: [],
    );
  }

  /// `Nghỉ lý do khác ENG`
  String get otherReasonLeave {
    return Intl.message(
      'Nghỉ lý do khác ENG',
      name: 'otherReasonLeave',
      desc: '',
      args: [],
    );
  }

  /// `Duyệt/ không duyệt`
  String get acceptOrReject {
    return Intl.message(
      'Duyệt/ không duyệt',
      name: 'acceptOrReject',
      desc: '',
      args: [],
    );
  }

  /// `Stop contract`
  String get requestStopContract {
    return Intl.message(
      'Stop contract',
      name: 'requestStopContract',
      desc: '',
      args: [],
    );
  }

  /// `Handover To`
  String get handoverTo {
    return Intl.message(
      'Handover To',
      name: 'handoverTo',
      desc: '',
      args: [],
    );
  }

  /// `Retirement from day`
  String get retirementFromDay {
    return Intl.message(
      'Retirement from day',
      name: 'retirementFromDay',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get titleForm {
    return Intl.message(
      'Title',
      name: 'titleForm',
      desc: '',
      args: [],
    );
  }

  /// `none`
  String get none {
    return Intl.message(
      'none',
      name: 'none',
      desc: '',
      args: [],
    );
  }

  /// `ChuaXacDinh`
  String get undefineText {
    return Intl.message(
      'ChuaXacDinh',
      name: 'undefineText',
      desc: '',
      args: [],
    );
  }

  /// `Đã duyệt`
  String get daduyet {
    return Intl.message(
      'Đã duyệt',
      name: 'daduyet',
      desc: '',
      args: [],
    );
  }

  /// `Không duyệt`
  String get khongDuyet {
    return Intl.message(
      'Không duyệt',
      name: 'khongDuyet',
      desc: '',
      args: [],
    );
  }

  /// `Đã có quyết định`
  String get daCoQuyetDinh {
    return Intl.message(
      'Đã có quyết định',
      name: 'daCoQuyetDinh',
      desc: '',
      args: [],
    );
  }

  /// `Đã ban hành quyết định`
  String get daBanHanhQuyetDinh {
    return Intl.message(
      'Đã ban hành quyết định',
      name: 'daBanHanhQuyetDinh',
      desc: '',
      args: [],
    );
  }

  /// `Đã ban hành thông báo`
  String get daBanHanhThongBao {
    return Intl.message(
      'Đã ban hành thông báo',
      name: 'daBanHanhThongBao',
      desc: '',
      args: [],
    );
  }

  /// `Cái Quần què gì không biết`
  String get banTCCBDuyet {
    return Intl.message(
      'Cái Quần què gì không biết',
      name: 'banTCCBDuyet',
      desc: '',
      args: [],
    );
  }

  /// `Cái quần đùi gì nè`
  String get banTCCBKhongDuyet {
    return Intl.message(
      'Cái quần đùi gì nè',
      name: 'banTCCBKhongDuyet',
      desc: '',
      args: [],
    );
  }

  /// `Tạo mới`
  String get create {
    return Intl.message(
      'Tạo mới',
      name: 'create',
      desc: '',
      args: [],
    );
  }

  /// `Xin chấm dứt hợp đồng từ ngày`
  String get donXinChanDut {
    return Intl.message(
      'Xin chấm dứt hợp đồng từ ngày',
      name: 'donXinChanDut',
      desc: '',
      args: [],
    );
  }

  /// `Chọn ngày`
  String get donXinNghiPhep {
    return Intl.message(
      'Chọn ngày',
      name: 'donXinNghiPhep',
      desc: '',
      args: [],
    );
  }

  /// `Nghỉ hưu kể từ ngày`
  String get donXinNghiHuu {
    return Intl.message(
      'Nghỉ hưu kể từ ngày',
      name: 'donXinNghiHuu',
      desc: '',
      args: [],
    );
  }

  /// `Bàn giao công việc cho`
  String get banGiaoViecCho {
    return Intl.message(
      'Bàn giao công việc cho',
      name: 'banGiaoViecCho',
      desc: '',
      args: [],
    );
  }

  /// `Người duyệt thông báo`
  String get nguoiDuyetThongBao {
    return Intl.message(
      'Người duyệt thông báo',
      name: 'nguoiDuyetThongBao',
      desc: '',
      args: [],
    );
  }

  /// `Lý do xin chấm dứt HĐ`
  String get lyDoChamDutHopDong {
    return Intl.message(
      'Lý do xin chấm dứt HĐ',
      name: 'lyDoChamDutHopDong',
      desc: '',
      args: [],
    );
  }

  /// `nhập lý do xin chấm dứt HĐ`
  String get nhapLyDoChamDutHopDong {
    return Intl.message(
      'nhập lý do xin chấm dứt HĐ',
      name: 'nhapLyDoChamDutHopDong',
      desc: '',
      args: [],
    );
  }

  /// `Nơi Lưu`
  String get noiLuu {
    return Intl.message(
      'Nơi Lưu',
      name: 'noiLuu',
      desc: '',
      args: [],
    );
  }

  /// `nhập nơi Lưu`
  String get nhapNoiLuu {
    return Intl.message(
      'nhập nơi Lưu',
      name: 'nhapNoiLuu',
      desc: '',
      args: [],
    );
  }

  /// `Tạo đơn xin nghỉ việc`
  String get createLeave {
    return Intl.message(
      'Tạo đơn xin nghỉ việc',
      name: 'createLeave',
      desc: '',
      args: [],
    );
  }

  /// `Tạo đơn xin nghỉ phép`
  String get createResignation {
    return Intl.message(
      'Tạo đơn xin nghỉ phép',
      name: 'createResignation',
      desc: '',
      args: [],
    );
  }

  /// `Tạo đơn xin nghỉ hưu`
  String get createRetirement {
    return Intl.message(
      'Tạo đơn xin nghỉ hưu',
      name: 'createRetirement',
      desc: '',
      args: [],
    );
  }

  /// `Chỉnh sửa`
  String get editForm {
    return Intl.message(
      'Chỉnh sửa',
      name: 'editForm',
      desc: '',
      args: [],
    );
  }

  /// `cc`
  String get cc {
    return Intl.message(
      'cc',
      name: 'cc',
      desc: '',
      args: [],
    );
  }

  /// `Tuổi nghỉ hưu theo thông báo`
  String get nghiHuuTB {
    return Intl.message(
      'Tuổi nghỉ hưu theo thông báo',
      name: 'nghiHuuTB',
      desc: '',
      args: [],
    );
  }

  /// `Tuổi nghỉ hưu theo quy định`
  String get nghiHuuQD {
    return Intl.message(
      'Tuổi nghỉ hưu theo quy định',
      name: 'nghiHuuQD',
      desc: '',
      args: [],
    );
  }

  /// `Chức vụ`
  String get positionText {
    return Intl.message(
      'Chức vụ',
      name: 'positionText',
      desc: '',
      args: [],
    );
  }

  /// `Thành công`
  String get success {
    return Intl.message(
      'Thành công',
      name: 'success',
      desc: '',
      args: [],
    );
  }

  /// `************`
  String get hindPass {
    return Intl.message(
      '************',
      name: 'hindPass',
      desc: '',
      args: [],
    );
  }

  /// `Không có kết nối internet. Xin kiểm tra lại!`
  String get errInternet {
    return Intl.message(
      'Không có kết nối internet. Xin kiểm tra lại!',
      name: 'errInternet',
      desc: '',
      args: [],
    );
  }

  /// `Chụp ảnh`
  String get takePhoto {
    return Intl.message(
      'Chụp ảnh',
      name: 'takePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Chọn ảnh từ thư viện`
  String get selectPhotoGallery {
    return Intl.message(
      'Chọn ảnh từ thư viện',
      name: 'selectPhotoGallery',
      desc: '',
      args: [],
    );
  }

  /// `Người duyệt`
  String get nguoiDuyet {
    return Intl.message(
      'Người duyệt',
      name: 'nguoiDuyet',
      desc: '',
      args: [],
    );
  }

  /// `Người tạo`
  String get creator {
    return Intl.message(
      'Người tạo',
      name: 'creator',
      desc: '',
      args: [],
    );
  }

  /// `Cơ quan/Đơn vị`
  String get workUtil {
    return Intl.message(
      'Cơ quan/Đơn vị',
      name: 'workUtil',
      desc: '',
      args: [],
    );
  }

  /// `Chức vụ hiện tại`
  String get positionNow {
    return Intl.message(
      'Chức vụ hiện tại',
      name: 'positionNow',
      desc: '',
      args: [],
    );
  }

  /// `Chức danh nghề nghiệp`
  String get positionWorkUtil {
    return Intl.message(
      'Chức danh nghề nghiệp',
      name: 'positionWorkUtil',
      desc: '',
      args: [],
    );
  }

  /// `Thời hạn`
  String get duration {
    return Intl.message(
      'Thời hạn',
      name: 'duration',
      desc: '',
      args: [],
    );
  }

  /// `Căn cứ theo HĐ`
  String get based {
    return Intl.message(
      'Căn cứ theo HĐ',
      name: 'based',
      desc: '',
      args: [],
    );
  }

  /// `Thời gian HĐ từ ngày`
  String get timeStart {
    return Intl.message(
      'Thời gian HĐ từ ngày',
      name: 'timeStart',
      desc: '',
      args: [],
    );
  }

  /// `Số HĐ`
  String get contractCode {
    return Intl.message(
      'Số HĐ',
      name: 'contractCode',
      desc: '',
      args: [],
    );
  }

  /// `Đến ngày`
  String get timeEnd {
    return Intl.message(
      'Đến ngày',
      name: 'timeEnd',
      desc: '',
      args: [],
    );
  }

  /// `Ngày kí`
  String get signDay {
    return Intl.message(
      'Ngày kí',
      name: 'signDay',
      desc: '',
      args: [],
    );
  }

  /// `Nội dung`
  String get content {
    return Intl.message(
      'Nội dung',
      name: 'content',
      desc: '',
      args: [],
    );
  }

  /// `	- Căn cứ Luật bảo hiểm xã hội;\n`
  String get contentLine1 {
    return Intl.message(
      '	- Căn cứ Luật bảo hiểm xã hội;\n',
      name: 'contentLine1',
      desc: '',
      args: [],
    );
  }

  /// `	- Căn cứ Luật viên chức;\n`
  String get contentLine2 {
    return Intl.message(
      '	- Căn cứ Luật viên chức;\n',
      name: 'contentLine2',
      desc: '',
      args: [],
    );
  }

  /// `	- Căn cứ nghị định số 29/2012/NĐ-CP ngày 12 tháng 4 năm 2012 của Chính phủ về tuyển dụng, sử dụng và quản lý viên chức;\n`
  String get contentLine3 {
    return Intl.message(
      '	- Căn cứ nghị định số 29/2012/NĐ-CP ngày 12 tháng 4 năm 2012 của Chính phủ về tuyển dụng, sử dụng và quản lý viên chức;\n',
      name: 'contentLine3',
      desc: '',
      args: [],
    );
  }

  /// `	- Căn cứ nghị định số 186/2013/NĐ-CP ngày 17 tháng 11 năm 2013 của Chính phủ về Đại học Quốc gia;\n`
  String get contentLine4 {
    return Intl.message(
      '	- Căn cứ nghị định số 186/2013/NĐ-CP ngày 17 tháng 11 năm 2013 của Chính phủ về Đại học Quốc gia;\n',
      name: 'contentLine4',
      desc: '',
      args: [],
    );
  }

  /// `	- Căn cứ quyết định số 26/2014/QĐ-TTg ngày 26 tháng 3 năm 2014 của Thủ tướng Chính phủ về việc ban hành Quy chế tổ chức và hoạt động của Đại học Quốc gia và các cơ sở giáo dục Đại học thành viên;\n`
  String get contentLine5 {
    return Intl.message(
      '	- Căn cứ quyết định số 26/2014/QĐ-TTg ngày 26 tháng 3 năm 2014 của Thủ tướng Chính phủ về việc ban hành Quy chế tổ chức và hoạt động của Đại học Quốc gia và các cơ sở giáo dục Đại học thành viên;\n',
      name: 'contentLine5',
      desc: '',
      args: [],
    );
  }

  /// `	- Kể từ ngày`
  String get contentLine6_1 {
    return Intl.message(
      '	- Kể từ ngày',
      name: 'contentLine6_1',
      desc: '',
      args: [],
    );
  }

  /// `sẽ được nghỉ hưu để hưởng chế độ bảo hiểm xã hội theo quy định.\n`
  String get contentLine6_2 {
    return Intl.message(
      'sẽ được nghỉ hưu để hưởng chế độ bảo hiểm xã hội theo quy định.\n',
      name: 'contentLine6_2',
      desc: '',
      args: [],
    );
  }

  /// `- Tuổi nghỉ hưu theo thông báo:`
  String get contentLine7 {
    return Intl.message(
      '- Tuổi nghỉ hưu theo thông báo:',
      name: 'contentLine7',
      desc: '',
      args: [],
    );
  }

  /// `- Tuổi nghỉ hưu theo quy định:`
  String get contentLine8 {
    return Intl.message(
      '- Tuổi nghỉ hưu theo quy định:',
      name: 'contentLine8',
      desc: '',
      args: [],
    );
  }

  /// `- Tuổi nghỉ hưu theo quy định:`
  String get opinionReviewer {
    return Intl.message(
      '- Tuổi nghỉ hưu theo quy định:',
      name: 'opinionReviewer',
      desc: '',
      args: [],
    );
  }

  /// `- Lý do chấm dứt HĐ: `
  String get lyDoChamDutHopDongV2 {
    return Intl.message(
      '- Lý do chấm dứt HĐ: ',
      name: 'lyDoChamDutHopDongV2',
      desc: '',
      args: [],
    );
  }

  /// `- Lý do: `
  String get reasonLeave {
    return Intl.message(
      '- Lý do: ',
      name: 'reasonLeave',
      desc: '',
      args: [],
    );
  }

  /// `Xuất biểu mẫu`
  String get exportForm {
    return Intl.message(
      'Xuất biểu mẫu',
      name: 'exportForm',
      desc: '',
      args: [],
    );
  }

  /// `Nam`
  String get nam {
    return Intl.message(
      'Nam',
      name: 'nam',
      desc: '',
      args: [],
    );
  }

  /// `Nữ`
  String get nu {
    return Intl.message(
      'Nữ',
      name: 'nu',
      desc: '',
      args: [],
    );
  }

  /// `Khác`
  String get khac {
    return Intl.message(
      'Khác',
      name: 'khac',
      desc: '',
      args: [],
    );
  }

  /// `Nhân sự bàn giao`
  String get handOver {
    return Intl.message(
      'Nhân sự bàn giao',
      name: 'handOver',
      desc: '',
      args: [],
    );
  }

  /// `- Xin chấm dứt HĐ từ ngày: `
  String get endContractDate {
    return Intl.message(
      '- Xin chấm dứt HĐ từ ngày: ',
      name: 'endContractDate',
      desc: '',
      args: [],
    );
  }

  /// `\n- Hoàn tất công việc trước ngày: `
  String get endFinishContractDate {
    return Intl.message(
      '\n- Hoàn tất công việc trước ngày: ',
      name: 'endFinishContractDate',
      desc: '',
      args: [],
    );
  }

  /// `Đính kèm`
  String get attachSignle {
    return Intl.message(
      'Đính kèm',
      name: 'attachSignle',
      desc: '',
      args: [],
    );
  }

  /// `Loadding...`
  String get loadding {
    return Intl.message(
      'Loadding...',
      name: 'loadding',
      desc: '',
      args: [],
    );
  }

  /// `thất bại`
  String get fail {
    return Intl.message(
      'thất bại',
      name: 'fail',
      desc: '',
      args: [],
    );
  }

  /// `Ngày nghỉ`
  String get leaveDay {
    return Intl.message(
      'Ngày nghỉ',
      name: 'leaveDay',
      desc: '',
      args: [],
    );
  }

  /// `Ca nghỉ`
  String get leaveSession {
    return Intl.message(
      'Ca nghỉ',
      name: 'leaveSession',
      desc: '',
      args: [],
    );
  }

  /// `Duyệt`
  String get approve {
    return Intl.message(
      'Duyệt',
      name: 'approve',
      desc: '',
      args: [],
    );
  }

  /// `Nội dung duyệt/ không duyệt`
  String get contentApprove {
    return Intl.message(
      'Nội dung duyệt/ không duyệt',
      name: 'contentApprove',
      desc: '',
      args: [],
    );
  }

  /// `Xuất`
  String get export {
    return Intl.message(
      'Xuất',
      name: 'export',
      desc: '',
      args: [],
    );
  }

  /// `Login to SSO`
  String get loginSSO {
    return Intl.message(
      'Login to SSO',
      name: 'loginSSO',
      desc: '',
      args: [],
    );
  }

  /// `Wanning`
  String get wanning {
    return Intl.message(
      'Wanning',
      name: 'wanning',
      desc: '',
      args: [],
    );
  }

  /// `Date time invalid`
  String get datetimeErr {
    return Intl.message(
      'Date time invalid',
      name: 'datetimeErr',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng nhập nội dung`
  String get inputContent {
    return Intl.message(
      'Vui lòng nhập nội dung',
      name: 'inputContent',
      desc: '',
      args: [],
    );
  }

  /// `Gửi quyết định`
  String get sendDecision {
    return Intl.message(
      'Gửi quyết định',
      name: 'sendDecision',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng chọn lý do nghỉ phép`
  String get selectLeaveReasion {
    return Intl.message(
      'Vui lòng chọn lý do nghỉ phép',
      name: 'selectLeaveReasion',
      desc: '',
      args: [],
    );
  }

  /// `Xác nhận`
  String get confirm {
    return Intl.message(
      'Xác nhận',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}