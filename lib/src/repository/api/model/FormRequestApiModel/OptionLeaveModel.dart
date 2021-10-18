class OptionLeaveModel{
  int id;
  String optionName;

  OptionLeaveModel({this.id, this.optionName});

  @override
  String toString() {
    return '$optionName';
  }
}