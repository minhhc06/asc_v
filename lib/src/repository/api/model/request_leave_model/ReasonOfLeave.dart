class ReasonOfLeave {
  int idLyDoNghiPhep;
  ReasonOfLeave({this.idLyDoNghiPhep});
  Map<String, dynamic> toJson() => {
        'idLyDoNghiPhep': idLyDoNghiPhep,
      };
}
