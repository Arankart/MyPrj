class Training {
  late int? id;
  late String title;
  late String description;
  late int preparation;
  late int work;
  late int relax;
  late int cycle;

  Training(this.id, this.title, this.description, this.preparation, this.work,
      this.relax, this.cycle);

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    map['id'] = id;
    map["title"] = title;
    map["description"] = description;
    map["preparation"] = preparation;
    map["work"] = work;
    map["relax"] = relax;
    map["cycle"] = cycle;
    return map;
  }

  Training.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    title = map["title"];
    description = map["description"];
    preparation = map["preparation"];
    work = map["work"];
    relax = map["relax"];
    cycle = map["cycle"];
  }
}
