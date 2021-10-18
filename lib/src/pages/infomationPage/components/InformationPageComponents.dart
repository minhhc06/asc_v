import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InformationPageComponents{
  Widget buildDropDown({String title}){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('$title'),
        Icon(Icons.keyboard_arrow_down)
      ],
    );
  }
}