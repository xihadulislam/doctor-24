
import 'package:flutter/material.dart';

class Department {
  int id;
  String title;
  String image;
  Color color;

  Department({this.id, this.title, this.image, this.color});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['color'] = this.color;
    return data;
  }
}
