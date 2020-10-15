class PrincipleValues {
  String pcode;
  String pname;

  PrincipleValues(this.pcode, this.pname);
  // Data(this.ccode, this.nationality);

  PrincipleValues.fromJson(Map<String, dynamic> json) {
    pcode = json['pcode'];
    pname = json['pname'];
  }
}
