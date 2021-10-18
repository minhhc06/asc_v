import 'package:flutter/material.dart';
import 'package:vnu_app/src/pages/infomationPage/components/InformationPageComponents.dart';
import 'package:vnu_app/src/pages/infomationPage/components/SexOptionRadio.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> with BaseComponent {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUtil(title: '${WordUtil.information}', context: context, iconDataBack: Icons.arrow_back_ios),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DoubleUtil.padding16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildInputUtil(title: WordUtil.fullName),
              SizedBox(
                height: DoubleUtil.padding16,
              ),
              Text(WordUtil.gender, style: TextStyle(fontWeight: FontWeight.bold),),
              SexOptionRadio(),
              SizedBox(
                height: DoubleUtil.padding16,
              ),
              Text(WordUtil.birthDay, style: TextStyle(fontWeight: FontWeight.bold),),
              InformationPageComponents().buildDropDown(title: WordUtil.selectBirthDay),
              SizedBox(
                height: DoubleUtil.padding16,
              ),
              Text(WordUtil.workUnit, style: TextStyle(fontWeight: FontWeight.bold),),
              InformationPageComponents().buildDropDown(title: WordUtil.selectWorkUnit),

              SizedBox(
                height: DoubleUtil.padding16,
              ),
              Text(WordUtil.position, style: TextStyle(fontWeight: FontWeight.bold),),
              InformationPageComponents().buildDropDown(title:WordUtil.selectPosition),

              SizedBox(
                height: DoubleUtil.padding16,
              ),
              buildInputUtil(title: WordUtil.phone),

              SizedBox(
                height: DoubleUtil.padding16,
              ),
              buildInputUtil(title: WordUtil.email),
              SizedBox(
                height: DoubleUtil.padding16,
              ),
              buildButton(title:WordUtil.saveChange,titleColor: Colors.white)
              
            ],
          ),
        ),
      ),
    );
  }
}
