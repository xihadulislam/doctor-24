class Doctor {
  int categoryId;
  String chamber;
  int color;
  String contact;
  String division;
  int id;
  String image;
  String name;
  List<String> onDay;
  String qualification;
  String visitingTime;
  String worksAt;

  Doctor(
      this.categoryId,
        this.chamber,
        this.color,
        this.contact,
        this.division,
        this.id,
        this.image,
        this.name,
        this.onDay,
        this.qualification,
        this.visitingTime,
        this.worksAt);

  Doctor.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    chamber = json['chamber'];
    color = json['color'];
    contact = json['contact'];
    division = json['division'];
    id = json['id'];
    image = json['image'];
    name = json['name'];

    if (json['onDay'] != null) {
      onDay = new List<String>();
      json['onDay'].forEach((v) {
        onDay.add(v);
      });
    }

    qualification = json['qualification'];
    visitingTime = json['visitingTime'];
    worksAt = json['worksAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['chamber'] = this.chamber;
    data['color'] = this.color;
    data['contact'] = this.contact;
    data['division'] = this.division;
    data['id'] = this.id;
    data['image'] = this.image;
    data['name'] = this.name;

    if (this.onDay != null) {
      data['onDay'] = this.onDay.map((v) => v).toList();
    }

    data['qualification'] = this.qualification;
    data['visitingTime'] = this.visitingTime;
    data['worksAt'] = this.worksAt;
    return data;
  }
}


