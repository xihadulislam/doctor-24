import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_version/get_version.dart';
import 'package:mailto/mailto.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String projectAppID = "";

  @override
  Widget build(BuildContext context) {

    _getAppId();

    return Container(
      color: Colors.blueGrey,
      child: Padding(
        padding: EdgeInsets.only(top: 50, left: 30, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                SvgPicture.asset('assets/icons/profile.svg'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Doctor 24 ',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Spacer(),
            Column(
              children: <Widget>[
                NewRow(
                  press: (){
                    Share.share('check out This app : https://play.google.com/store/apps/details?id=$projectAppID');
                  },
                  text: 'Share',
                  icon: Icons.share,
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  press: (){
                    _launchURL("https://play.google.com/store/apps/details?id=$projectAppID");
                  },
                  text: 'Rate App',
                  icon: Icons.star,
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  press: (){
                    _launchURL("https://play.google.com/store/apps/dev?id=5852379392695255971");
                  },
                  text: 'More Apps',
                  icon: Icons.apps,
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  press: (){
                    openMailComposer();
                  },
                  text: 'Report Bug',
                  icon: Icons.bug_report_outlined,
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  press: (){
                    _launchURL("https://firebasestorage.googleapis.com/v0/b/privacy-policy-b3dda.appspot.com/o/Doctor24%2Fdoctor24sylhet.html?alt=media&token=1bf4cbd8-c150-45a5-bd54-88672d577433");
                  },
                  text: 'Privacy Policy',
                  icon: Icons.approval,
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  press: () {
                    SystemNavigator.pop();
                  },
                  text: 'Exit',
                  icon: Icons.close,
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
            Spacer(
              flex: 4,
            ),
            Row(
              children: <Widget>[
                Text(
                  'Ok Codex'.toUpperCase(),
                  style: TextStyle(color: Colors.white.withOpacity(0.6)),
                )
              ],
            ),
            SizedBox(
              height: 4,
            ),
            Row(
              children: <Widget>[
                Text(
                  'teamokcodex@gmail.com',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6), fontSize: 12),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  _getAppId() async {
    try {
      projectAppID = await GetVersion.appID;
    } on PlatformException {
      projectAppID = 'Failed to get app ID.';
    }
  }

  void openMailComposer() async {
    final mailtoLink = Mailto(
      to: ['teamokcodex@gmail.com'],
      subject: '',
      body: '',
    );
    await launch('$mailtoLink');
  }

  _launchURL(String url) async {
    print(url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}

class NewRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function press;

  const NewRow({Key key, this.icon, this.text, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16),
          )
        ],
      ),
    );
  }
}
