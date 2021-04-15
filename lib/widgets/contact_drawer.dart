import 'package:flutter/material.dart';

class ContactDrawer extends StatelessWidget {
  const ContactDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
      width: width,
      height: height / 3,
      child: Column(
        children: <Widget>[
          Icon(
            Icons.keyboard_arrow_up,
            size: 20,
          ),
          Text(
            "Contact Us",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            "Email: **************",
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
          Text(
            "Phone: ***-***-****",
            style: TextStyle(fontSize: 10, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
