import 'package:flutter/cupertino.dart';
import 'package:vnu_app/src/bloc/FormPageBloc/FormPageBloc.dart';
import 'package:vnu_app/src/repository/api/model/FormModel/FormModel.dart';
import 'package:vnu_app/src/utils/BaseProvider.dart';

class FormProvider extends BaseProvider {
  fetchListForm({
    @required BuildContext context,
    @required FormPageBloc formPageBloc,
  }) async {
    formPageBloc.setListForm([
      FormModel(
        name: 'Biểu mẩu hồ sơ nhập học',
        child: [
          'Phiếu đăng ký nhập học - thạc sỹ',
          'Phiếu đăng ký nhập học - Tiến sỹ',
          'Sơ yếu lý lịch',
          'Phiếu kê khai thông tin',
        ],
      ),
      FormModel(
        name: 'Biểu mẩu hồ sơ nhập học',
        child: [
          'Phiếu đăng ký nhập học - thạc sỹ',
          'Phiếu đăng ký nhập học - Tiến sỹ',
          'Sơ yếu lý lịch',
          'Phiếu kê khai thông tin',
        ],
      ),
      FormModel(
        name: 'Biểu mẩu hồ sơ nhập học',
        child: [
          'Phiếu đăng ký nhập học - thạc sỹ',
          'Phiếu đăng ký nhập học - Tiến sỹ',
          'Sơ yếu lý lịch',
          'Phiếu kê khai thông tin',
        ],
      ),
    ]);
  }
}
