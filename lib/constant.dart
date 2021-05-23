import 'package:flutter/material.dart';

var kBackgroundColor = Color(0xffF9F9F9);
var kWhiteColor = Color(0xffffffff);
var kOrangeColor = Color(0xffEF716B);
var kBlueColor = Color(0xff4B7FFB);
var kYellowColor = Color(0xffFFB167);
var kPurpleColor = Color(0xff9575cd);
var kGreenColor = Color(0xff66bb6a);
var kBlueGreyColor = Colors.blueGrey;

var kTitleTextColor = Color(0xff1E1C61);
var kSearchBackgroundColor = Color(0xffF2F2F2);
var kSearchTextColor = Color(0xffC0C0C0);
var kCategoryTextColor = Color(0xff292685);




const kPrimaryGradientColor =  LinearGradient(
  begin: Alignment(-0.80, -0.500),
  end: Alignment(-0.80, 0.700),
  stops: [
    0.1,
    0.9,
  ],
  colors: <Color>[Color(0xFFFFA53E), Color(0xFFFF7643)],
);


// LinearGradient(
//   begin: Alignment.topLeft,
//   end: Alignment.bottomRight,
//   colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
// );


const LinearGradient kGradientColor = LinearGradient(
  begin: Alignment(0.80, 0.100),
  end: Alignment(-0.80, 0.700),
  stops: [
    0.1,
    0.9,
  ],
  colors: <Color>[
    Color(0xffF8E4CC),
    Color(0xffC4DDE1),
  ],
);

class MainButtonWidget extends StatelessWidget {
  const MainButtonWidget({Key key, @required this.text,  this.onPressed})
      : super(key: key);

  final Widget text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: kPrimaryGradientColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      child: FlatButton(
        onPressed: this.onPressed,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
        shape: StadiumBorder(),
        child: this.text,
      ),
    );
  }
}


