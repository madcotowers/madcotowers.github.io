import 'package:flutter/material.dart';
import 'package:madcotowers_1/widgets/township_carousel.dart';
//import 'package:madcotowers_1/townshipMenu.dart';
//import 'package:madcotowers_1/widgets/navigation_bar/centered_view/centered_view.dart';
//import 'package:madcotowers_1/widgets/navigation_bar/course_details/course_details.dart';
//import 'package:madcotowers_1/widgets/navigation_bar/navigation_bar.dart';
//import 'package:madcotowers_1/widgets/township_carousel.dart'

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var pageNavigatedTo = await Navigator.push(
              context,
              new MaterialPageRoute(
                  builder: (context) =>
                      townshipMenu())); //navigates to township menu page, awaits result, then stores the destination
        },
      ),*/

      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Madison County Historical Society'),
      ),
      body: Scaffold(body: TownshipCarousel()),
    );
  }
}
