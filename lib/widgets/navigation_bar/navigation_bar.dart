import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
                height: 134,
                width: 300,
                child: Image.asset(
                    'assets/MCHS-Identity-WHiteText-340-300x134.png')),
            Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
              _NavBarItem('Townships'),
              SizedBox(
                width: 60,
              ),
              _NavBarItem('Contact Us'),
            ])
          ]),
      color: Colors.red[900],
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  const _NavBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(fontSize: 18));
  }
}
