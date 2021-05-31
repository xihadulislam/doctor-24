import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_doctor24/constant.dart';
import 'package:flutter_doctor24/providers/DataProvider.dart';
import 'package:flutter_doctor24/screens/mainScreen.dart';
import 'package:flutter_doctor24/utils/size_config.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;

  int loading = 0;

  PageController _pageController = new PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                image:
                    DecorationImage(image: AssetImage('assets/images/bg.png'))),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(),
              Container(
                height: getProportionateScreenHeight(540),
                child: PageView(
                  controller: _pageController,
                  children: [
                    onBoardPage("onBoard1", "আপনি কি ডাক্তারের সন্ধান করছেন?"),
                    onBoardPage("onBoard2",
                        "আপনার পরবর্তী ডাক্তারের জন্য সময়সূচী বাছাই করুন।"),
                    onBoardPage("onBoard3", "সেরা ডাক্তারদের পরিষেবা নিন।"),
                    onBoardPage("onBoard4",
                        "আপনার রোগীকে একটি নির্দিষ্ট তারিখে ডাক্তার দেখান।"),
                  ],
                  onPageChanged: (value) => {setCurrentPage(value)},
                ),
              ),
              Spacer(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) => getIndicator(index))),
              Spacer(),
              GestureDetector(
                  onTap: changePage,
                  child: currentPage == 3
                      ? buildLinerContainer()
                      : buildRoundContainer()),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ],
      ),
    );
  }

  Container buildRoundContainer() {
    return Container(
        height: 60,
        width: 60,
        margin: EdgeInsets.only(bottom: 30),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                colors: [Color(0xffee4545), Color(0xfff11010)],
                stops: [0, 1],
                begin: Alignment.topCenter)),
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
          size: 40,
        ));
  }

  Container buildLinerContainer() {
    return loading == 1
        ? CircularProgressIndicator(
            backgroundColor: Colors.redAccent,
          )
        : Container(
            height: 60,
            width: 260,
            margin: EdgeInsets.only(bottom: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                gradient: LinearGradient(
                    colors: [Color(0xffee4545), Color(0xfff11010)],
                    stops: [0, 1],
                    begin: Alignment.topCenter)),
            child: Center(
                child: Text(
              "Get Started",
              style: TextStyle(color: Colors.white, fontSize: 24),
            )));
  }

  setCurrentPage(int value) {
    currentPage = value;
    setState(() {});
  }

  AnimatedContainer getIndicator(int pageNo) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 100),
        height: 8,
        width: (currentPage == pageNo) ? 20 : 10,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: (currentPage == pageNo) ? Colors.redAccent : Colors.grey));
  }

  Column onBoardPage(String img, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage('assets/images/$img.png'))),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: kTitleTextColor),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  void changePage() {
    print(currentPage);
    if (currentPage == 3) {
      Provider.of<DataProvider>(context, listen: false).storeIsFirstTime(false);
      Get.off(() => MainScreen());
      loading = 1;
     // setState(() {});
    } else {
      _pageController.animateToPage(currentPage + 1,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }
}



