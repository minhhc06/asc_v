class DateTimeOfLeave {
  String ngayNghi;
  int caNghi;
  DateTimeOfLeave({
    this.caNghi,
    this.ngayNghi,
  });
  Map<String, dynamic> toJson() => {
        'ngayNghi': ngayNghi,
        'caNghi': caNghi,
      };
}
