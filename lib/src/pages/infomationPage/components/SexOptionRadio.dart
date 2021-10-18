/// Flutter code sample for RadioListTile

// ![RadioListTile sample](https://flutter.github.io/assets-for-api-docs/assets/material/radio_list_tile.png)
//
// This widget shows a pair of radio buttons that control the `_character`
// field. The field is of the type `SingingCharacter`, an enum.

import 'package:flutter/material.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

enum SingingCharacter { male, female, other }

/// This is the stateful widget that the main application instantiates.
class SexOptionRadio extends StatefulWidget {
  const SexOptionRadio({Key key}) : super(key: key);

  @override
  State<SexOptionRadio> createState() => _SexOptionRadioState();
}

/// This is the private State class that goes with SexOptionRadio.
class _SexOptionRadioState extends State<SexOptionRadio> {
  SingingCharacter _character = SingingCharacter.male;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Radio<SingingCharacter>(
                value: SingingCharacter.male,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              Text('${WordUtil.nam}')
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Radio<SingingCharacter>(
                value: SingingCharacter.female,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              Text('${WordUtil.nu}')
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Radio<SingingCharacter>(
                value: SingingCharacter.other,
                groupValue: _character,
                onChanged: (SingingCharacter value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              Text('${WordUtil.khac}')
            ],
          ),
        ),
      ],
    );
  }
}
