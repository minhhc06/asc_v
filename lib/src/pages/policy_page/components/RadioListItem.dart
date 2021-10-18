import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/policy_bloc/PolicyBloc.dart';
import 'package:vnu_app/src/utils/word/WordEnum.dart';

class RadioListItem extends StatelessWidget {
  const RadioListItem({
    Key key,
    @required this.policyBloc,
    this.buttonName,
  }) : super(key: key);

  final PolicyBloc policyBloc;
  final TrangThai buttonName;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.all(0),
      color: Colors.white,
      child: ListTile(
        onTap: () {
          policyBloc.setTrangThai(buttonName);
        },
        visualDensity: VisualDensity(horizontal: -4, vertical: -4),
        title: Text(
          buttonName.name,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        trailing: StreamBuilder<TrangThai>(
          stream: policyBloc.subjectTrangThai,
          builder: (context, snapshot) => Radio<String>(
            value: buttonName.name,
            groupValue: snapshot.data.name,
            activeColor: Colors.green,
            onChanged: (data) {},
          ),
        ),
      ),
    );
  }
}
