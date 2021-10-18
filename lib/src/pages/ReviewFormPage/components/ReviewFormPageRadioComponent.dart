import 'package:flutter/material.dart';
import 'package:vnu_app/src/repository/api/model/ReviewFormPageModelRequest/ReviewFormPageModelRequest.dart';
import 'package:vnu_app/src/utils/word/IntUnit.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

enum SingingCharacter { accept, reject }

class ReviewFormPageRadioComponent extends StatefulWidget {
  ReviewFormPageModelRequest modelRequest;

  ReviewFormPageRadioComponent({this.modelRequest});

  @override
  _ReviewFormPageRadioComponentState createState() =>
      _ReviewFormPageRadioComponentState();
}

class _ReviewFormPageRadioComponentState
    extends State<ReviewFormPageRadioComponent> {
  SingingCharacter _character = SingingCharacter.accept;

  @override
  void initState() {
    super.initState();
    widget.modelRequest.trangThai = IntUnit.statusAccept;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Radio<SingingCharacter>(
                value: SingingCharacter.accept,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                    widget.modelRequest.trangThai = IntUnit.statusAccept;
                  });
                },
              ),
              Text(WordUtil.approve)
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Radio<SingingCharacter>(
                value: SingingCharacter.reject,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                    widget.modelRequest.trangThai = IntUnit.statusReject;
                  });
                },
              ),
              Text(WordUtil.khongDuyet)
            ],
          ),
        ),
      ],
    );
  }
}
