import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vnu_app/src/bloc/AccountBloc/AccountBloc.dart';
import 'package:vnu_app/src/bloc/DisplayPicturePageBloc/DisplayPicturePageBloc.dart';
import 'package:vnu_app/src/pages/DisplayPicturePage/components/Crop/controller.dart';
import 'package:vnu_app/src/pages/DisplayPicturePage/components/Crop/crop.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/ConfigUnit.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class DisplayPicturePage extends StatefulWidget {
  final String imagePath;
  final AccountBloc accountBloc;

  const DisplayPicturePage(
      {Key key, @required this.imagePath, @required this.accountBloc})
      : super(key: key);
  @override
  _DisplayPicturePageState createState() => _DisplayPicturePageState();
}

class _DisplayPicturePageState extends State<DisplayPicturePage>
    with BaseComponent {
  final _cropController = CropController();
  DisplayPicturePageBloc displayPicturePageBloc;

  @override
  void initState() {
    super.initState();
    displayPicturePageBloc = new DisplayPicturePageBloc();
  }

  Future<Uint8List> _loadAllImages() async {
    return File(widget.imagePath).readAsBytesSync();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Uint8List>(
      future: _loadAllImages(),
      builder: (ctx, data) => Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: StreamBuilder<Uint8List>(
            stream: displayPicturePageBloc.subject,
            builder: (ctx, image) => StreamBuilder<bool>(
              stream: displayPicturePageBloc.getVisible,
              builder: (ctx, isVisibility) {
                if (isVisibility.data != null) {
                  return Visibility(
                    visible: !isVisibility.data,
                    child: Column(
                      children: [
                        Expanded(
                          child: Visibility(
                            visible: image.data == null,
                            child: Stack(
                              children: [
                                if (data.data != null)
                                  Crop(
                                    controller: _cropController,
                                    image: data.data,
                                    onCropped: (croppedData) {
                                      displayPicturePageBloc
                                          .setimageCrop(croppedData);
                                      displayPicturePageBloc.setVisible(false);
                                    },
                                    initialSize: 0.5,
                                    maskColor: null,
                                    cornerDotBuilder: (size, index) =>
                                        const DotControl(),
                                  ),
                              ],
                            ),
                            replacement: Center(
                              child: image.data == null
                                  ? SizedBox.shrink()
                                  : Column(
                                      children: [
                                        Expanded(
                                          child: Image.memory(image.data),
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.all(2),
                                                  child: buildTextButton(
                                                      text: '${ConfigUnit.ok}',
                                                      onPressed: () {
                                                        widget.accountBloc
                                                            .setImage(
                                                                MemoryImage(
                                                                    image
                                                                        .data));
                                                        Navigator.pop(context);
                                                      },
                                                      context: context),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsets.all(2),
                                                  child: buildTextButton(
                                                      text:
                                                          '${WordUtil.cancel}',
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      context: context),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                            ),
                          ),
                        ),
                        if (image.data == null)
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              MyHexColor(ColorUtil.green)),
                                    ),
                                    onPressed: () {
                                      displayPicturePageBloc.setVisible(true);
                                      _cropController.crop();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16),
                                      child: Text('${WordUtil.cropImage}'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    replacement: const CircularProgressIndicator(),
                  );
                } else
                  return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
