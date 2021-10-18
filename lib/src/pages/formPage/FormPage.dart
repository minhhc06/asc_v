import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/FormPageBloc/FormPageBloc.dart';
import 'package:vnu_app/src/pages/formPage/components/FormPageComponents.dart';
import 'package:vnu_app/src/repository/api/model/FormModel/FormModel.dart';
import 'package:vnu_app/src/repository/api/provider/form_provider/FormProvider.dart';
import 'package:vnu_app/src/utils/BaseComponent.dart';
import 'package:vnu_app/src/utils/word/DoubleUtil.dart';
import 'package:vnu_app/src/utils/word/WordUtil.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> with BaseComponent {
  FormPageBloc formPageBloc;
  @override
  void initState() {
    super.initState();
    formPageBloc = new FormPageBloc();
    FormProvider().fetchListForm(context: context, formPageBloc: formPageBloc);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarUtil(
          title: '${WordUtil.exportForm}',
          context: context,
          iconDataBack: Icons.arrow_back_ios),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(DoubleUtil.padding16),
          child: StreamBuilder<List<FormModel>>(
            stream: formPageBloc.getListFom,
            builder: (_, snapshot) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (snapshot.data != null && snapshot.data.length > 0)
                  ...snapshot.data
                      .map(
                        (e) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: DoubleUtil.padding8),
                              child: Text(
                                e.name,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            if (e.child != null && e.child.length > 0)
                              ...e.child
                                  .map(
                                    (eItem) => FormPageComponents()
                                        .buildFeature(title: eItem),
                                  )
                                  .toList(),
                            Container(
                              height: 1,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                      )
                      .toList(),
                if (snapshot.data == null) Text(WordUtil.loadding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
