// ignore_for_file: prefer_const_constructors

import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/events_page.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:shifting_tabbar/shifting_tabbar.dart';
import 'package:custom_floating_action_button/custom_floating_action_button.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    TabController tabcontroller = TabController(length: 4, vsync: this);
    return CustomFloatingActionButton(
      spaceFromBottom: h * 0.01,
      spaceFromRight: w * 0.05,
      openFloatingActionButton: const Icon(
        Icons.shopping_cart_rounded,
      ),
      options: [
        Container(
          height: h * 0.047,
          width: w * 0.26,
          margin: EdgeInsets.fromLTRB(w * 0.2, w * 0.05, 0, 0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Get Pass'),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(0, 0, 60, 0),
          height: h * 0.047,
          width: w * 0.27,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(30),
            ),
            child: ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'To Cart',
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
      type: CustomFloatingActionButtonType.horizontal,
      closeFloatingActionButton: const Icon(
        Icons.close,
      ),
      body: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Event Name'),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Opacity(
              opacity: 0.9,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Image(
                  image: AssetImage('assets/yes1.webp'),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Center(
              child: ClipPath(
                clipper: BackgroundClipper(),
                child: GlassContainer(
                  blur: 5,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.84,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            DefaultTabController(
                              initialIndex: 1,
                              length: 4,
                              child: ShiftingTabBar(
                                // labelFlex: 2,
                                labelStyle: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                                controller: tabcontroller,
                                color: Colors.transparent,
                                tabs: [
                                  ShiftingTab(
                                    icon: const Icon(
                                      Icons.info,
                                    ),
                                    text: 'Details',
                                  ),
                                  ShiftingTab(
                                      icon: const Icon(Icons.file_copy),
                                      text: 'Rules'),
                                  ShiftingTab(
                                      icon: const Icon(Icons.bar_chart),
                                      text: 'Judging'),
                                  ShiftingTab(
                                      icon: const Icon(Icons.contact_page),
                                      text: 'Contact'),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: h * 0.015,
                            ),
                            Container(
                              color: Colors.transparent,
                              width: double.maxFinite,
                              height: h * 0.42,
                              child: TabBarView(
                                clipBehavior: Clip.antiAlias,
                                controller: tabcontroller,
                                children: [
                                  Center(
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: h * 0.07,
                                        ),
                                        Container(
                                            height: h * 0.17,
                                            width: w * 0.8,
                                            child: Lottie.asset(
                                                'assets/hourglass.json')),
                                        SizedBox(
                                          height: h * 0.01,
                                        ),
                                        Text(
                                          'Coming Soon...',
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: h * 0.07,
                                        ),
                                        Container(
                                            height: h * 0.17,
                                            width: w * 0.8,
                                            child: Lottie.asset(
                                                'assets/hourglass.json')),
                                        SizedBox(
                                          height: h * 0.01,
                                        ),
                                        Text(
                                          'Coming Soon...',
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: h * 0.07,
                                        ),
                                        Container(
                                            height: h * 0.17,
                                            width: w * 0.8,
                                            child: Lottie.asset(
                                                'assets/hourglass.json')),
                                        SizedBox(
                                          height: h * 0.01,
                                        ),
                                        Text(
                                          'Coming Soon...',
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          height: h * 0.07,
                                        ),
                                        Container(
                                            height: h * 0.17,
                                            width: w * 0.8,
                                            child: Lottie.asset(
                                                'assets/hourglass.json')),
                                        SizedBox(
                                          height: h * 0.01,
                                        ),
                                        Text(
                                          'Coming Soon...',
                                          style: TextStyle(fontSize: 20),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: h * 0.01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 6,
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        '₹40/-',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text('(Person)'),
                                    ],
                                  ),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.purple,
                                  radius: h * 0.035,
                                  child: IconButton(
                                    isSelected: false,
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.add_shopping_cart_rounded,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: h * 0.04,
                                  width: 1,
                                  color: Colors.black,
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Text(
                                        '₹100/-',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      Text('(Group of 4)'),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 7, 0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.purple,
                                    radius: h * 0.035,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.add_shopping_cart_rounded,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.20,
              top: MediaQuery.of(context).size.height * 0.050,
              child: Container(
                margin: const EdgeInsets.fromLTRB(40, 100, 0, 0),
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                      colors: [Colors.purple, Colors.transparent]),
                  border: Border.all(
                    width: 2,
                  ),
                ),
                child: const Hero(
                  tag: 'wallstreet',
                  child: GlassImage(
                    blur: 0.5,
                    image: Image(
                      image: AssetImage('assets/wallstreet.8165edf9.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ).blurClipped(blur: 0.75),
            ),

            // Positioned(
            //   left: 75,
            //   top: 50,
            //   child: Container(
            //     padding: EdgeInsets.fromLTRB(30, 20, 50, 0),
            //     height: MediaQuery.of(context).size.height * 0.4,
            //     width: MediaQuery.of(context).size.width * 0.7,
            //     child: Column(
            //       children: [
            //         Hero(
            //           tag: 'wallstreet',
            //           child: Image(
            //             image: NetworkImage(
            //                 'https://credenz.in/static/media/wallstreet.8165edf9.png'),
            //             fit: BoxFit.contain,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
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
