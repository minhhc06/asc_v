import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vnu_app/src/bloc/notification_bloc/NotificationBloc.dart';
import 'package:vnu_app/src/repository/api/model/notifi_model/NotificationModel.dart';
import 'package:vnu_app/src/utils/BaseProvider.dart';

class NotificationProvider extends BaseProvider {
  buildListNotification(
      {@required BuildContext context, @required NotificationBloc bloc}) async {
    bloc.setListNotification([
      NotificationModel(
        author: 'Đoàn Phi Hổ',
        description:
            'Căn cứ theo chỉ đạo TP.HCM về việc giãn cách toàn thành phố',
        category: '1',
        time: '2020-11-12 08:30AM',
        title: '1 Thông báo về việc chấm công trong gian ...',
        file: 'Phương án làm việc từ 01/06/2021.pdf',
      ),
      NotificationModel(
        author: 'Đoàn Phi Hổ',
        description:
            'Căn cứ theo chỉ đạo TP.HCM về việc giãn cách toàn thành phố',
        category: '2',
        time: '2020-11-12 08:30AM',
        title: '2 Thông báo về việc chấm công thời gian ...',
        file: 'Phương án làm việc từ 01/06/2021.pdf',
      ),
      NotificationModel(
        author: 'Đoàn Phi Hổ',
        description:
            'Căn cứ theo chỉ đạo TP.HCM về việc giãn cách toàn thành phố',
        category: '3',
        time: '2020-11-12 08:30AM',
        title: '3 Thông báo về việc chấm trong thời gian ...',
        file: 'Phương án làm việc từ 01/06/2021.pdf',
      ),
      NotificationModel(
        author: 'Đoàn Phi Hổ',
        description:
            'Căn cứ theo chỉ đạo TP.HCM về việc giãn cách toàn thành phố',
        category: '4',
        time: '2020-11-12 08:30AM',
        title: '4 Thông báo về việc công trong thời gian ...',
        file: 'Phương án làm việc từ 01/06/2021.pdf',
      ),
      NotificationModel(
        author: 'Đoàn Phi Hổ',
        description:
            'Căn cứ theo chỉ đạo TP.HCM về việc giãn cách toàn thành phố',
        category: '4',
        time: '2020-11-12 08:30AM',
        title: '5 Thông báo về chấm công trong thời gian ...',
        file: 'Phương án làm việc từ 01/06/2021.pdf',
      ),
      NotificationModel(
        author: 'Đoàn Phi Hổ',
        description:
            'Căn cứ theo chỉ đạo TP.HCM về việc giãn cách toàn thành phố',
        category: '1',
        time: '2020-11-12 08:30AM',
        title: '6 Thông báo việc chấm công trong thời gian ...',
        file: 'Phương án làm việc từ 01/06/2021.pdf',
      ),
      NotificationModel(
        author: 'Đoàn Phi Hổ',
        description:
            'Căn cứ theo chỉ đạo TP.HCM về việc giãn cách toàn thành phố ffffffffffffffffffffffffffffffffffff',
        category: '1',
        time: '2020-11-12 08:30AM',
        title: '7 Thông về việc chấm công trong thời 333 ...',
      ),
    ]);
  }
}
