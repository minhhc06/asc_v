import 'package:rxdart/rxdart.dart';
import 'package:vnu_app/src/repository/api/model/notifi_model/NotificationModel.dart';

class NotificationBloc {
  int index;
  final List<NotificationModel> listNotification;
  BehaviorSubject<int> subject;
  BehaviorSubject<List<NotificationModel>> subjectNotifi;
  NotificationBloc({this.index, this.listNotification}) {
    subject = new BehaviorSubject<int>.seeded(this.index);
    subjectNotifi = new BehaviorSubject<List<NotificationModel>>.seeded(
        this.listNotification);
  }
  Stream<int> get indexStream => subject.stream;
  Stream<List<NotificationModel>> get listNotificationStream =>
      subjectNotifi.stream;
  void setIndex(int index) => subject.sink.add(index);
  void setListNotification(List<NotificationModel> listNotification) =>
      subjectNotifi.sink.add(listNotification);
  void dispose() {
    subject.close();
    subjectNotifi.close();
  }
}
