// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/Cart_Controller.dart';
import 'package:flutter_application_1/controllers/stepper_controller.dart';
import 'package:flutter_application_1/views/events_page.dart';

import 'package:get/get.dart';


Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Zoom Drawer Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final controller = Get.put(StepperController());
  final cartController = Get.put(CartController());
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To A Cart Page",
        ),
      ),
      floatingActionButton: Obx(
        () => Stack(
          children: [
            FloatingActionButton(
              onPressed: () {
                Get.to(
                  () => EventsList(),
                );
              },
              child: Icon(
                Icons.shopping_cart_rounded,
              ),
            ),
            Badge(
              largeSize: 17,
              backgroundColor: Colors.black,
              label: cartController.selectedEvent.isNotEmpty
                  ? Text(
                      cartController.selectedEvent.length.toString(),
                    )
                  : Text("0"),
            ),
          ],
        ),
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   final String title;
//   const MyHomePage({
//     super.key,
//     required this.title,
//   });

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final drawercontroller = ZoomDrawerController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Colors.purple, Colors.transparent],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: ZoomDrawer(
//         controller: drawercontroller,
//         menuScreen: MenuScreen(),
//         mainScreen: MainScreen(
//           zoomDrawerController: drawercontroller,
//         ),
//         angle: 0.0,
//         borderRadius: 24.0,
//         showShadow: false,
//         mainScreenScale: 0.05,
//         style: DrawerStyle.style3,
//         slideWidth: MediaQuery.of(context).size.width * 0.65,
//         openCurve: Curves.fastOutSlowIn,
//         closeCurve: Curves.decelerate,
//         menuBackgroundColor: Colors.transparent,
//         menuScreenWidth: MediaQuery.of(context).size.width * 0.65,
//         mainScreenAbsorbPointer: false,
//       ),
//     );
//   }
// }

// class MenuScreen extends StatelessWidget {
//   const MenuScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       body: Center(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 260,
//               child: DrawerHeader(
//                 child: Center(
//                   child: Column(
//                     children: [
//                       Center(
//                         child: Container(
//                           height: 50,
//                           width: MediaQuery.of(context).size.width * 1,
//                           color: Colors.black26,
//                           child: const Center(
//                             child: Text(
//                               "Credenz 2023",
//                               style: TextStyle(
//                                 fontWeight: FontWeight.w900,
//                                 fontSize: 20,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Icon(
//                         Icons.account_circle_rounded,
//                         size: 50,
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Text('Name Of the User'),
//                       Text('Email Of the User'),
//                       Text("Phone Number"),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Divider(
//                         height: 6,
//                         color: Colors.black,
//                         thickness: 6,
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.book,
//               ),
//               title: Text("PISB"),
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.book,
//               ),
//               title: Text("PING"),
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.book,
//               ),
//               title: Text("Sponsers"),
//             ),
//             Divider(
//               thickness: 2,
//               color: Colors.white24,
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.book,
//               ),
//               title: Text("My Events"),
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.book,
//               ),
//               title: Text("Visit Website"),
//             ),
//             Divider(
//               thickness: 2,
//               color: Colors.white24,
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.developer_board,
//               ),
//               title: Text(
//                 "Developers Page",
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MainScreen extends StatefulWidget {
//   final zoomDrawerController;
//   MainScreen({
//     super.key,
//     required this.zoomDrawerController,
//   });

//   @override
//   State<MainScreen> createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   @override
//   void initState() {
//     _controller = AnimationController(
//       duration: Duration(seconds: 1),
//       vsync: this,
//     );
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Main Screen "),
//         leading: IconButton(
//           splashRadius: 40,
//           onPressed: () {
//             widget.zoomDrawerController.toggle();
//           },
//           icon: Icon(Icons.menu),
//         ),
//       ),
//       body: SafeArea(
//         child: Center(
//           child: Container(
//             height: 100,
//             width: 100,
//             color: Colors.red,
//           ),
//         ),
//       ),
//     );
//   }
// }
