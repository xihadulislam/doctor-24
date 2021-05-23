
import 'package:flutter/material.dart';
import 'package:flutter_doctor24/models/Doctor.dart';
import 'package:flutter_doctor24/screens/detail_screen.dart';

import '../constant.dart';

class DoctorCard extends StatelessWidget {

  final Doctor doctor;
  DoctorCard(this.doctor);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(doctor),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: kBlueColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: Image.asset(doctor.image),
            title: Text(
              doctor.name,
              style: TextStyle(
                color: kTitleTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              doctor.chamber,
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
