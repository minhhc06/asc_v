import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vnu_app/src/bloc/AccountBloc/AccountBloc.dart';
import 'package:vnu_app/src/pages/DisplayPicturePage/DisplayPicturePage.dart';
import 'package:vnu_app/src/repository/api/provider/logout_provider/LogoutProvider.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class AccountPageComponents extends BaseComponent {
  final picker = ImagePicker();
  Widget buildAvatar(BuildContext context, {AccountBloc accountBloc}) {
    return Stack(children: [
      Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.circular(DoubleUtil.borderRadiusAvatarHomePage)),
          border: Border.all(
            color: MyHexColor(ColorUtil.green),
            width: DoubleUtil.borderAvatarHomePage,
          ),
        ),
        child: StreamBuilder<String>(
            stream: accountBloc.getAvatar,
            builder: (context, snapshot) {
              if (snapshot.data != null) {
                return new Container(
                  width: DoubleUtil.heightImageHomePage,
                  height: DoubleUtil.widthImageHomePage,
                  decoration: new BoxDecoration(
                    color: Colors.grey,
                    image: new DecorationImage(
                      image: new NetworkImage(
                          '${ConfigUnit.linkMedia}${snapshot.data}'),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: new BorderRadius.all(new Radius.circular(
                        DoubleUtil.borderRadiusAvatarHomePage)),
                    border: new Border.all(
                      color: Colors.white,
                      width: DoubleUtil.borderAvatarHomePage,
                    ),
                  ),
                );
              }
              return new Container(
                width: DoubleUtil.heightImageHomePage,
                height: DoubleUtil.widthImageHomePage,
                decoration: new BoxDecoration(
                  color: Colors.grey,
                  borderRadius: new BorderRadius.all(new Radius.circular(
                      DoubleUtil.borderRadiusAvatarHomePage)),
                  border: new Border.all(
                    color: Colors.white,
                    width: DoubleUtil.borderAvatarHomePage,
                  ),
                ),
              );
            }),
      ),
      Positioned(
        bottom: 0,
        right: 8,
        child: InkWell(
          onTap: () => showBottomDialog(
            context,
            buildDialogUploadImageProfile(context, accountBloc),
            height: .5,
          ),
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            constraints: BoxConstraints(
              minWidth: 18,
              minHeight: 18,
            ),
            child: Icon(
              Icons.camera_alt_rounded,
              size: 12,
            ),
          ),
        ),
      )
    ]);
  }

  Widget buildDialogUploadImageProfile(
      BuildContext context, AccountBloc accountBloc) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(children: [
        _buildButton(
            icon: Icons.camera_alt_rounded,
            title: WordUtil.takePhoto,
            onClick: () async {
              Navigator.pop(context);
              final imagePath =
                  await picker.getImage(source: ImageSource.camera);
              if (imagePath == null) return;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DisplayPicturePage(
                      imagePath: imagePath.path, accountBloc: accountBloc),
                ),
              );
            }),
        _buildButton(
          icon: Icons.image_outlined,
          title: WordUtil.selectPhotoGallery,
          onClick: () async {
            Navigator.pop(context);
            final imagePath =
                await picker.getImage(source: ImageSource.gallery);
            if (imagePath == null) return;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DisplayPicturePage(
                    imagePath: imagePath.path, accountBloc: accountBloc),
              ),
            );
          },
        ),
      ]),
    );
  }

  Widget _buildButton(
      {@required IconData icon,
      @required String title,
      @required Function onClick}) {
    return InkWell(
      onTap: onClick,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  color: Colors.blueGrey[100],
                ),
                child: Icon(icon),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: ConfigUnit.roboto,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFeatureAccountPage(
      {@required String title,
      @required SvgPicture iconTitle,
      Function onTab}) {
    return InkWell(
      onTap: onTab,
      child: Padding(
        padding: const EdgeInsets.all(DoubleUtil.padding16),
        child: Row(
          children: [
            Expanded(flex: 1, child: iconTitle),
            Expanded(
              flex: 9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('$title'), Icon(Icons.arrow_forward_ios)],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLogout({
    @required BuildContext context,
    @required String title,
    @required SvgPicture iconTitle,
  }) {
    return InkWell(
      onTap: () async {
        dialogProcessing(context: context);
        await LogoutProvider().logoutRequestApiProvider(context: context);
      },
      child: Padding(
        padding: const EdgeInsets.all(DoubleUtil.padding16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: iconTitle),
            Expanded(
              flex: 9,
              child: Text('$title'),
            ),
          ],
        ),
      ),
    );
  }
}
