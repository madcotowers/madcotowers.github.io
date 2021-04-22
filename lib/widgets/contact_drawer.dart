import 'package:flutter/material.dart';
import 'package:madcotowers_1/CustomMaterialColor.dart';

class ContactDrawer extends StatelessWidget {
  ContactDrawer({Key key}) : super(key: key);
  final customColor =
      CustomMaterialColor().createMaterialColor(Color(0xFF8b0d04));

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        child: Container(
          color: Colors.black45,
          width: width,
          height: 35 + (height / 3),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.keyboard_arrow_up,
                size: 20,
              ),
              Text(
                "Contact Us",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
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
        ));
  }
}
