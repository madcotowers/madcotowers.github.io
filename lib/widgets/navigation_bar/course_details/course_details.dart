import 'package:flutter/material.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: Column(
        //all text appears at the left side of the column
        crossAxisAlignment: CrossAxisAlignment.start,
        //appears in the center vertically
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Madison County Historical Society \nCommunity Tower Project',
            style: TextStyle(
                fontWeight: FontWeight.w800, height: 0.9, fontSize: 80),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'This is a prototype of our senior project / description',
            style: TextStyle(fontSize: 21, height: 1.7),
          )
        ],
      ),
    );
  }
}
