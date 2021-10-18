import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';

class DialogComponent{
  Widget buildLayoutDialog({@required String title, @required String description, String textButton, Function function}){
    return Container(
      height: DoubleUtil.heightContainerDialogComponent,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(DoubleUtil.padding8),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                  child: Text(title, style: TextStyle(fontSize: DoubleUtil.fontSizeTextTitleDialogComponent , fontWeight: FontWeight.bold),)),

              Expanded(
                flex: 2,
                  child: Text(description, style: TextStyle(fontSize: DoubleUtil.fontSizeTextDescriptionDialogComponent),)),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: function,
                  child: Center(
                    child: Text(textButton, style: TextStyle(fontSize: DoubleUtil.fontSizeTextConfirmDialogComponent ,color: Colors.green),),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}