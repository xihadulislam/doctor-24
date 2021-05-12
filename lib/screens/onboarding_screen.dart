import 'package:flutter/material.dart';
import 'package:flutter_doctor24/screens/home_screen.dart';
import 'package:get/get.dart';


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
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/bg.png'
                    )
                )
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Spacer(),
              Container(
                height: 520,
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

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) => getIndicator(index))
              ),

              Spacer(
                flex: 3,
              ),

            ],
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: changePage,
                child: Container(
                  height: 70,
                  width: 70,
                  margin: EdgeInsets.only(bottom: 30),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors:  [Color(0xffee4545), Color(0xfff11010)],
                          stops: [0,1],
                          begin: Alignment.topCenter
                      )
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              )
          ),

        ],
      ),
    );
  }
  setCurrentPage(int value)
  {
    currentPage = value;
    setState(() {

    });
  }
  AnimatedContainer getIndicator(int pageNo)
  {
    return AnimatedContainer(
        duration: Duration(milliseconds: 100),
        height: 8,
        width: (currentPage == pageNo) ? 20 : 10,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: (currentPage == pageNo) ? Colors.redAccent : Colors.grey
        )
    );
  }
  Column onBoardPage(String img, String title)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 220,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/$img.png')
              )
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(title, style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500
          ),),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text", style: TextStyle(
              fontSize: 16,
              color: Colors.grey
          ),textAlign: TextAlign.center,),
        )
      ],
    );
  }
  void changePage()
  {
    print(currentPage);
    if(currentPage == 3)
    {
      Get.off(()=>HomeScreen());
    }
    else{
      _pageController.animateToPage(currentPage+1, duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }
}
