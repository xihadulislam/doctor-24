import 'package:flutter/material.dart';
import 'package:flutter_doctor24/models/Doctor.dart';
import 'package:flutter_doctor24/screens/detail_screen.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

import '../constant.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final int color;

  DoctorCard({@required this.doctor, this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(doctor),
          ),
        ).then((value) {
          if (color == null) {
            FlutterStatusbarcolor.setStatusBarColor(Colors.white);
          } else {
            FlutterStatusbarcolor.setStatusBarColor(getColor(color));
          }
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: getColor(doctor.color).withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: Hero(
                tag: doctor.id,
                child: Image.asset(getDoctorAvatar(doctor.color))),
            title: Text(
              doctor.name,
              style: TextStyle(
                color: kTitleTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              doctor.qualification,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: kTitleTextColor.withOpacity(0.7),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
