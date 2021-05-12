class Doctor {
  int id;
  String name;
  String image;
  String qualification;
  String workStart;
  String chamber;
  String visitingTime;
  String offDay;
  String mobileNumber;
  int categoryId;
  int color;

  Doctor(
      {this.id,
      this.name,
      this.image,
      this.qualification,
      this.workStart,
      this.chamber,
      this.visitingTime,
      this.offDay,
      this.mobileNumber,
      this.categoryId,
      this.color});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    qualification = json['qualification'];
    workStart = json['workStart'];
    chamber = json['chamber'];
    visitingTime = json['visitingTime'];
    offDay = json['offDay'];
    mobileNumber = json['mobileNumber'];
    categoryId = json['category_id'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['qualification'] = this.qualification;
    data['workStart'] = this.workStart;
    data['chamber'] = this.chamber;
    data['visitingTime'] = this.visitingTime;
    data['offDay'] = this.offDay;
    data['mobileNumber'] = this.mobileNumber;
    data['category_id'] = this.categoryId;
    data['color'] = this.color;
    return data;
  }
}
