import 'package:vnu_app/src/utils/word/WordEnum.dart';

class ConfigUnit {
  ///link production
  // static String host = 'https://gatewayhrm.vnu.edu.vn/';
  ///link developer
  static String host = 'http://dev.apivnu-gateway.epmt.com.vn:2051/';

  String getHost({
    HostType hostType,
    HostApi hostApi = HostApi.acl,
  }) {
    return '${host}api${hostType != null ? "/" : ""}${hostType.values}/$versionApi/${hostApi.values}';
  }

  static String linkMedia = 'http://devmedia.vnu.epmt.com.vn:2051/';
  static String linDonTuNghiHuusById =
      'http://dev.apivnu-qlns-cmd.epmt.com.vn:2051/api/cmd/v1/DonTuNghiHuus/ById';

  ///link publish
  // static String hostApi =

  //     'https://gatewayhrm.vnu.edu.vn/api/$command/$versionApi/$featureApi/';

  static String command = 'cmd';
  static String versionApi = 'v1';
  static String featureApi = 'ACL/Accounts';
  static String methodPost = 'POST';
  static String accessToken = 'accessToken';
  static const int statusCodeSuccess = 200;
  static const int statusCodeFail400 = 400;
  static const int statusCodeFail401 = 401;
  static const int statusCodeFail500 = 500;

  static String linkLogoVnu = 'https://www.vnu.edu.vn/home/images/logo.png';

  /// main app
  static const String appTitleName = 'VNU';

  static String loginApi = 'Accounts/Login';
  static String logoutApi = 'Accounts/Logout';
  static String refreshTokenApi = 'Accounts/Refresh-Token';

  /// DonTuNghiViec/ById
  static String donTuNghiViecById = 'DonTuNghiViec/ById';

  /// DonTuNghiPhep/ById
  static String donTuNghiPhepById = 'DonTuNghiPhep/ById';

  /// DonTuNghiHuus/ById
  static String donTuNghiHuusById = 'DonTuNghiHuus/ById';

  /// DonTuNghiPhep/Duyet
  static String duyetDonTuNghiPhep = 'DonTuNghiPhep/Duyet';

  /// DonTuNghiHuus/Duyet
  static String duyetDonTuNghiHuus = 'DonTuNghiHuus/Duyet';
  static String duyetDonTuNghiViec = 'DonTuNghiViec/Duyet';

  static String uploadMediaApi = 'Medias/UploadFile';
  static String requestLeave = 'DonTuNghiPhep';

  /// Resignation: url: DonTuNghiViec
  static String requestResignation = 'DonTuNghiViec';

  /// url = DonTu/ListDonNhan
  /// host qlns
  static String receivedListPolicy = 'DonTu/ListDonNhan';

  ///  url = NhanSus/ByCoQuanV2
  ///  host hrm
  static String receiverList = 'NhanSus/ByCoQuanKeyControl';

  ///  url = DonTuNghiHuus/ByIdNhanSu
  ///  host qlns
  static String getInfoUserRetirement = 'DonTuNghiHuus/ByIdNhanSu';

  /// url = NhanSus/ById
  /// host hrm
  static String getUserDetailById = 'NhanSus/ById';

  ///url: DonTuNghiHuus/ByIdNhanSu
  ///host qlns
  static String getUserRetirementAnnouncementById = 'DonTuNghiHuus/ByIdNhanSu';

  /// url = DonTu/ListDonNhan
  /// host qlns
  static String sentListPolicy = 'DonTu/ListDonGui';

  /// url = DonTuLyDoNghiPhep/List
  /// host qlns
  static String reasonList = 'DonTuLyDoNghiPhep/List';

  /// url = DonTu/ListDonDaDuyet
  /// host qlns
  static String approvedListPolicy = 'DonTu/ListDonDaDuyet';
  static String usernameApiLogin = 'userName';
  static String passwordApiLogin = 'password';
  static String sessionApiLogin = 'sessionCode';
  static String refreshToken = 'refreshToken';
  static String doiTuongIdSharePreference = 'doiTuongIdSharePreference';
  static String avatar = 'avatar';
  static String ok = 'ok';
  static String result = 'result';
  static String files = 'files';
  static String pagingItems = 'pagingItems';
  static String errorMessages = 'errorMessages';
  static String items = 'items';

  static const String donTuNghiViec = 'DonTuNghiViec';
  static const String donTuNghiPhep = 'DonTuNghiPhep';
  static const String donTuNghiHuus = 'DonTuNghiHuus';

  static const String acl = 'acl';
  static const String hrm = 'hrm';
  static const String qlns = 'qlns';

  static const String cmd = 'cmd';
  static const String read = 'read';

  static const String DON_XIN_CHAM_DUT = 'DT_DonXinChamDut';
  static const String DON_XIN_NGHI_PHEP = 'DT_DonXinChamDutNghiPhep';
  static const String THONG_BAO_NGHI_HUU = 'DT_ThongBaoNghiHuu';

  //fonts
  static String roboto = 'Roboto';
  static String bold = 'RobotoBold';
  static String italic = 'RobotoItalic';
}
