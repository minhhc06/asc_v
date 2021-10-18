import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as image;
import 'package:vnu_app/src/pages/DisplayPicturePage/components/Crop/calculator.dart';
import 'package:vnu_app/src/pages/DisplayPicturePage/components/Crop/controller.dart';

const dotTotalSize = 32.0;

typedef CornerDotBuilder = Widget Function(double size, int cornerIndex);

class Crop extends StatelessWidget {
  final Uint8List image;
  final ValueChanged<Uint8List> onCropped;
  final double aspectRatio;
  final double initialSize;
  final Rect initialArea;
  final CropController controller;
  final ValueChanged<Rect> onMoved;
  final Color maskColor;
  final Color baseColor;
  final CornerDotBuilder cornerDotBuilder;
  const Crop({
    Key key,
    @required this.image,
    @required this.onCropped,
    this.aspectRatio,
    this.initialSize,
    this.initialArea,
    this.controller,
    this.onMoved,
    this.maskColor,
    this.baseColor = Colors.white,
    this.cornerDotBuilder,
  })  : assert((initialSize ?? 1.0) <= 1.0,
            'initialSize must be less than 1.0, or null meaning not specified.'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (c, constraints) {
        final newData = MediaQuery.of(c).copyWith(
          size: constraints.biggest,
        );
        return MediaQuery(
          data: newData,
          child: _CropEditor(
            image: image,
            onCropped: onCropped,
            aspectRatio: aspectRatio,
            initialSize: initialSize,
            initialArea: initialArea,
            controller: controller,
            onMoved: onMoved,
            maskColor: maskColor,
            baseColor: baseColor,
            cornerDotBuilder: cornerDotBuilder,
          ),
        );
      },
    );
  }
}

class _CropEditor extends StatefulWidget {
  final Uint8List image;
  final ValueChanged<Uint8List> onCropped;
  final double aspectRatio;
  final double initialSize;
  final Rect initialArea;
  final CropController controller;
  final ValueChanged<Rect> onMoved;
  final Color maskColor;
  final Color baseColor;
  final CornerDotBuilder cornerDotBuilder;

  const _CropEditor({
    Key key,
    @required this.image,
    @required this.onCropped,
    this.aspectRatio,
    this.initialSize,
    this.initialArea,
    this.controller,
    this.onMoved,
    this.maskColor,
    @required this.baseColor,
    this.cornerDotBuilder,
  }) : super(key: key);

  @override
  _CropEditorState createState() => _CropEditorState();
}

class _CropEditorState extends State<_CropEditor> {
  CropController _cropController;
  Rect _rect;
  image.Image _targetImage;
  Rect _imageRect;

  double _aspectRatio;
  bool _isFitVertically = false;

  Calculator get calculator => _isFitVertically
      ? const VerticalCalculator()
      : const HorizontalCalculator();

  set rect(Rect newRect) {
    setState(() {
      _rect = newRect;
    });
    widget.onMoved?.call(_rect);
  }

  @override
  void initState() {
    _cropController = widget.controller ?? CropController();
    _cropController.delegate = CropControllerDelegate()
      ..onCrop = (bool) {
        _crop();
      }
      ..onChangeAspectRatio = (aspectRatio) {
        _resizeWith(aspectRatio, null);
      }
      ..onImageChanged = _resetImage
      ..onChangeRect = (newRect) {
        rect = calculator.correct(newRect, _imageRect);
      }
      ..onChangeArea = (newArea) {
        _resizeWith(_aspectRatio, newArea);
      };

    super.initState();
  }

  @override
  void didChangeDependencies() {
    _targetImage = _fromByteData(widget.image);
    _resetCroppingArea();
    super.didChangeDependencies();
  }

  image.Image _fromByteData(Uint8List data) {
    final tempImage = image.decodeImage(data);
    assert(tempImage != null);

    switch (tempImage.exif.data[0x0112] ?? -1) {
      case 3:
        return image.copyRotate(tempImage, 180);
      case 6:
        return image.copyRotate(tempImage, 90);
      case 8:
        return image.copyRotate(tempImage, -90);
    }
    return tempImage;
  }

  void _resetImage(Uint8List targetImage) {
    setState(() {
      _targetImage = _fromByteData(targetImage);
    });
    _resetCroppingArea();
  }

  void _resetCroppingArea() {
    final screenSize = MediaQuery.of(context).size;

    final imageRatio = _targetImage.width / _targetImage.height;
    _isFitVertically = imageRatio < screenSize.aspectRatio;

    _imageRect = calculator.imageRect(screenSize, imageRatio);

    _resizeWith(widget.aspectRatio, widget.initialArea);
  }

  void _resizeWith(double aspectRatio, Rect initialArea) {
    _aspectRatio = aspectRatio;

    if (initialArea == null) {
      rect = calculator.initialCropRect(
        MediaQuery.of(context).size,
        _imageRect,
        _aspectRatio ?? 1,
        widget.initialSize ?? 1,
      );
    } else {
      final screenSizeRatio = calculator.screenSizeRatio(
        _targetImage,
        MediaQuery.of(context).size,
      );
      rect = Rect.fromLTWH(
        _imageRect.left + initialArea.left / screenSizeRatio,
        _imageRect.top + initialArea.top / screenSizeRatio,
        initialArea.width / screenSizeRatio,
        initialArea.height / screenSizeRatio,
      );
    }
  }

  Future<void> _crop() async {
    assert(_targetImage != null);

    final screenSizeRatio = calculator.screenSizeRatio(
      _targetImage,
      MediaQuery.of(context).size,
    );

    final cropResult = await compute(
      _doCrop,
      [
        _targetImage,
        Rect.fromLTWH(
          (_rect.left - _imageRect.left) * screenSizeRatio,
          (_rect.top - _imageRect.top) * screenSizeRatio,
          _rect.width * screenSizeRatio,
          _rect.height * screenSizeRatio,
        ),
      ],
    );
    widget.onCropped(cropResult);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: widget.baseColor,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.memory(
            widget.image,
            fit: _isFitVertically ? BoxFit.fitHeight : BoxFit.fitWidth,
          ),
        ),
        IgnorePointer(
          child: ClipPath(
            clipper: _CropAreaClipper(_rect),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: widget.maskColor ?? Colors.black.withAlpha(100),
            ),
          ),
        ),
        Positioned(
          left: _rect.left,
          top: _rect.top,
          child: GestureDetector(
            onPanUpdate: (details) {
              rect = calculator.moveRect(
                _rect,
                details.delta.dx,
                details.delta.dy,
                _imageRect,
              );
            },
            child: Container(
              width: _rect.width,
              height: _rect.height,
              color: Colors.transparent,
            ),
          ),
        ),
        Positioned(
          left: _rect.left - (dotTotalSize / 2),
          top: _rect.top - (dotTotalSize / 2),
          child: GestureDetector(
            onPanUpdate: (details) {
              rect = calculator.moveTopLeft(
                _rect,
                details.delta.dx,
                details.delta.dy,
                _imageRect,
                aspectRatio: _aspectRatio,
              );
            },
            child: widget.cornerDotBuilder?.call(dotTotalSize, 0) ??
                const DotControl(),
          ),
        ),
        Positioned(
          left: _rect.right - (dotTotalSize / 2),
          top: _rect.top - (dotTotalSize / 2),
          child: GestureDetector(
            onPanUpdate: (details) {
              rect = calculator.moveTopRight(
                _rect,
                details.delta.dx,
                details.delta.dy,
                _imageRect,
                aspectRatio: _aspectRatio,
              );
            },
            child: widget.cornerDotBuilder?.call(dotTotalSize, 1) ??
                const DotControl(),
          ),
        ),
        Positioned(
          left: _rect.left - (dotTotalSize / 2),
          top: _rect.bottom - (dotTotalSize / 2),
          child: GestureDetector(
            onPanUpdate: (details) {
              rect = calculator.moveBottomLeft(
                _rect,
                details.delta.dx,
                details.delta.dy,
                _imageRect,
                aspectRatio: _aspectRatio,
              );
            },
            child: widget.cornerDotBuilder?.call(dotTotalSize, 2) ??
                const DotControl(),
          ),
        ),
        Positioned(
          left: _rect.right - (dotTotalSize / 2),
          top: _rect.bottom - (dotTotalSize / 2),
          child: GestureDetector(
            onPanUpdate: (details) {
              rect = calculator.moveBottomRight(
                _rect,
                details.delta.dx,
                details.delta.dy,
                _imageRect,
                aspectRatio: _aspectRatio,
              );
            },
            child: widget.cornerDotBuilder?.call(dotTotalSize, 3) ??
                const DotControl(),
          ),
        ),
      ],
    );
  }
}

class _CropAreaClipper extends CustomClipper<Path> {
  final Rect rect;

  _CropAreaClipper(this.rect);

  @override
  Path getClip(Size size) {
    return Path()
      ..addPath(
        Path()
          ..moveTo(rect.left, rect.top)
          ..lineTo(rect.right, rect.top)
          ..lineTo(rect.right, rect.bottom)
          ..lineTo(rect.left, rect.bottom)
          ..close(),
        Offset.zero,
      )
      ..addRect(Rect.fromLTWH(0.0, 0.0, size.width, size.height))
      ..fillType = PathFillType.evenOdd;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class DotControl extends StatelessWidget {
  const DotControl({
    Key key,
    this.color = Colors.white,
    this.padding = 8,
  }) : super(key: key);

  final Color color;

  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: dotTotalSize,
      height: dotTotalSize,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(dotTotalSize),
          child: Container(
            width: dotTotalSize - (padding * 2),
            height: dotTotalSize - (padding * 2),
            color: color,
          ),
        ),
      ),
    );
  }
}

Uint8List _doCrop(List<dynamic> cropData) {
  final originalImage = cropData[0] as image.Image;
  final rect = cropData[1] as Rect;
  return Uint8List.fromList(
    image.encodePng(
      image.copyCrop(
        originalImage,
        rect.left.toInt(),
        rect.top.toInt(),
        rect.width.toInt(),
        rect.height.toInt(),
      ),
    ),
  );
}
