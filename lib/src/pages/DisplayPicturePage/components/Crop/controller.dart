import 'dart:typed_data';

import 'package:flutter/material.dart';

class CropController {
  CropControllerDelegate _delegate;
  set delegate(CropControllerDelegate value) => _delegate = value;
  void crop() => _delegate.onCrop(false);
  set image(Uint8List value) => _delegate.onImageChanged(value);
  set aspectRatio(double value) => _delegate.onChangeAspectRatio(value);
  set rect(Rect value) => _delegate.onChangeRect(value);
  set area(Rect value) => _delegate.onChangeArea(value);
}

class CropControllerDelegate {
  ValueChanged<bool> onCrop;
  ValueChanged<Uint8List> onImageChanged;
  ValueChanged<double> onChangeAspectRatio;
  ValueChanged<Rect> onChangeRect;
  ValueChanged<Rect> onChangeArea;
}