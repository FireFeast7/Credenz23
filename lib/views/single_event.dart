import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/events_page.dart';
import 'package:get/get.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Name'),
      ),
      body: Stack(
        children: [
          Center(
            child: ClipPath(
              clipper: BackgroundClipper(),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.7),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Hehe'),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Chinamy'),
                      Icon(Icons.abc_outlined),
                      Icon(Icons.ac_unit_sharp),
                      IconButton(
                        onPressed: () {
                          Get.to(() => EventsList());
                        },
                        icon: Icon(Icons.next_plan),
                      ),
                      Text('Omkar'),
                      Text('ameya')
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 75,
            top: 50,
            child: Container(
              padding: EdgeInsets.fromLTRB(30, 20, 50, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                children: [
                  Hero(
                    tag: 'wallstreet',
                    child: Image(
                      image: NetworkImage(
                          'https://credenz.in/static/media/wallstreet.8165edf9.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = size.height * 0.05;

    var path = Path();

    path.moveTo(0, size.height * 0.33);
    path.lineTo(0, size.height - roundnessFactor);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - roundnessFactor);
    path.lineTo(size.width, roundnessFactor * 2);
    path.quadraticBezierTo(
        size.width - roundnessFactor * 0.5,
        roundnessFactor * 1.15,
        size.width - roundnessFactor * 1.5,
        roundnessFactor * 1.65);
    path.lineTo(
        roundnessFactor * 0.6, size.height * 0.33 - roundnessFactor * 0.3);
    path.quadraticBezierTo(
        0, size.height * 0.33, 0, size.height * 0.33 + roundnessFactor);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
