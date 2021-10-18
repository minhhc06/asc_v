import 'package:flutter/material.dart';
import 'package:vnu_app/src/utils/MyHexColor.dart';
import 'package:vnu_app/src/utils/word/ColorUnit.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class ReviewFormPageComponents {
  Widget buildInputContent(
      {TextEditingController controller, Function(String) validate}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(DoubleUtil.padding8),
        child: Column(
          children: [
            Row(
              children: [
                Text(WordUtil.contentApprove),
                Text(
                  ' (*)',
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
            SizedBox(
              height: DoubleUtil.padding8,
            ),
            TextFormField(
              validator: (String validator) {
                return validate(validator);
              },
              cursorColor: MyHexColor(ColorUtil.green),
              keyboardType: TextInputType.multiline,
              controller: controller,
              decoration: InputDecoration(
                isDense: true,
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: MyHexColor(ColorUtil.green),
                  ),
                ),
              ),
              maxLines: 5,
              minLines: 3,
              // controller: cpfcontroller,
            )
          ],
        ),
      ),
    );
  }
}
