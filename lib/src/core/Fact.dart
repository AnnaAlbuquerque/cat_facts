class Fact {
  String? fact;

  Fact({
    this.fact,
  });

  Fact.fromJson(Map<String, dynamic> json) {
    fact = json['fact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fact'] = this.fact;
    return data;
  }
}
