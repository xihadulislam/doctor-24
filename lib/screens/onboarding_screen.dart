import 'package:flutter/material.dart';
import 'package:flutter_doctor24/providers/DataProvider.dart';
import 'package:flutter_doctor24/screens/home_screen.dart';
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
                    onBoardPage("onBoard1", "Choose Clothes"),
                    onBoardPage("onBoard2", "Schedule Pickup"),
                    onBoardPage("onBoard3", "Get Best Iron Service"),
                    onBoardPage("onBoard4", "Get on Time Delivery"),
                  ],
                  onPageChanged: (value) => {setCurrentPage(value)},
                ),
              ),
              Spacer(
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) => getIndicator(index))),
              Spacer(
              ),
              GestureDetector(
                onTap: changePage,
                child: Container(
                  height: 70,
                  width: 70,
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
                  )
                )
              ),
              SizedBox(
                height: 8,
              )
            ],
          ),
        ],
      ),
    );
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
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum andard dummy text",
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }

  void changePage() {
    print(currentPage);
    if (currentPage == 3) {
     Provider.of<DataProvider>(context,listen: false).storeIsFirstTime(false);
      Get.off(() => MainScreen());
    } else {
      _pageController.animateToPage(currentPage + 1,
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }
}
