import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Padding(
        padding: EdgeInsets.only(top: 50, left: 30, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  text: 'Settings',
                  icon: Icons.error_outline,
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  text: 'Profile',
                  icon: Icons.person_outline,
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  text: 'Messages',
                  icon: Icons.chat_bubble_outline,
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  text: 'Saved',
                  icon: Icons.bookmark_border,
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  text: 'Favorites',
                  icon: Icons.favorite_border,
                ),
                SizedBox(
                  height: 20,
                ),
                NewRow(
                  text: 'Hint',
                  icon: Icons.lightbulb_outline,
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
                  'Ok Codex',
                  style: TextStyle(color: Colors.white.withOpacity(0.6)),
                )
              ],
            )

          ],
        ),


      ),
    );
  }
}

class NewRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const NewRow({
    Key key,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
          size: 28,
        ),
        SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white,fontSize: 16),
        )
      ],
    );
  }
}
