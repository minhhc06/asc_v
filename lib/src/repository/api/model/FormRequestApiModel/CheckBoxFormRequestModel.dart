class CheckBoxFormRequestModel{
  int id;
  String reason;
  int index;

  CheckBoxFormRequestModel({this.id, this.reason, this.index});

  @override
  String toString() {
    // TODO: implement toString
    return '$reason';

  }

}