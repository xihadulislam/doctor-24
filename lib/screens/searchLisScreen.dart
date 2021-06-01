import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctor24/components/doctor_card.dart';
import 'package:flutter_doctor24/providers/DataProvider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../constant.dart';

class SearchLisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var arg = Get.arguments;
    var data = Provider.of<DataProvider>(context,listen: false);
    data.loading = true;
    data.getDoctorsBySearch(arg);

    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'আপনার পছন্দসই\nডাক্তারটি সন্ধান করুন',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: kTitleTextColor,
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: SearchBar(msg: arg),
          ),
          SizedBox(height: 20),
          buildDoctorList()
        ],
      ),
    );
  }

  buildDoctorList() {
    return Consumer<DataProvider>(
        builder: (ctx, data, _) => data.loading== true ? Container(
          margin: EdgeInsets.only(bottom: 40),
          height: 60,
          width: 60,
          child: Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.redAccent,
            ),
          ),
        ) : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0.0),
                child: Column(
                  children: List.generate(data.searchDoctorList.length,
                      (index) => DoctorCard(data.searchDoctorList[index])),
                )));
  }
}

class SearchBar extends StatelessWidget {
  final String msg;

  SearchBar({this.msg});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    searchController.text = msg == null ? "" : msg;

    var data = Provider.of<DataProvider>(context, listen: false);

    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          height: 50,
          padding: EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: kSearchBackgroundColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextField(
              controller: searchController,
              decoration: InputDecoration.collapsed(
                hintText: 'ডাক্তারদের সন্ধান করুন',
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: MaterialButton(
            onPressed: () {
              data.setLoading();
              data.getDoctorsBySearch(searchController.text);
            },
            color: kOrangeColor,
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 15,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: SvgPicture.asset('assets/icons/search.svg'),
          ),
        ),
      ],
    );
  }
}
