import 'package:flutter/material.dart';
import 'package:flutter_doctor24/models/Department.dart';
import 'package:flutter_doctor24/screens/doctorListScreen.dart';
import 'package:get/get.dart';

import '../constant.dart';

class CategoryCard extends StatelessWidget {
  final Department department;

  CategoryCard(this.department);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> DoctorListScreen(department.id));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 6.0),
        width: 130,
        height: 160,
        child: Stack(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                width: 120,
                height: 137,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    department.title,
                    style: TextStyle(
                        color: kTitleTextColor, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              child: Container(
                height: 84,
                width: 84,
                decoration: BoxDecoration(
                  color: department.color,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  department.image,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
