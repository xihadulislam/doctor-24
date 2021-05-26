import 'package:flutter/material.dart';
import 'package:flutter_doctor24/components/doctor_card.dart';
import 'package:flutter_doctor24/providers/DataProvider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../constant.dart';

class DoctorListScreen extends StatefulWidget {


  final catId;
  DoctorListScreen(this.catId);


  @override
  _DoctorListScreenState createState() => _DoctorListScreenState();
}

class _DoctorListScreenState extends State<DoctorListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.6,
                decoration: BoxDecoration(
                  color: kOrangeColor,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(70),
                  ),
                ),
                child: Stack(
                  children: [
                    // ClipPath(
                    //   clipper: WaveClipper3(),
                    //   child: Container(
                    //     child: Column(),
                    //     width: double.infinity,
                    //     height: MediaQuery.of(context).size.height / 2,
                    //     decoration: BoxDecoration(
                    //         gradient: LinearGradient(colors: [
                    //       Color(0x44ff3a5a),
                    //       Color(0x44fe494d)
                    //     ])),
                    //   ),
                    // ),
                    //
                    // ClipPath(
                    //   clipper: WaveClipper3(),
                    //   child: Container(
                    //     child: Column(),
                    //     width: double.infinity,
                    //     height: MediaQuery.of(context).size.height / 3,
                    //     decoration: BoxDecoration(
                    //         gradient: LinearGradient(colors: [
                    //       Color(0x44f34075),
                    //      kOrangeColor
                    //     ])),
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/back.svg',
                                    height: 18,
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/icons/3dots.svg',
                                  height: 18,
                                ),
                              ],
                            ),
                          ),

                          Image.asset(
                            'assets/icons/heart_surgeon.png',
                            width: 100,
                            height: 100,
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              buildDoctorList(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  buildDoctorList() {
    return Consumer<DataProvider>(
        builder: (ctx, data, _) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0.0),
            child: Column(
              children: List.generate(data.getDoctorsByCategoryID(widget.catId).length,
                  (index) => DoctorCard(data.allDoctorList[index])),
            )));
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
