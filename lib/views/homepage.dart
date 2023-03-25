import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/views/single_event.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // late final AnimationController _controller;
  // @override
  // void initState() {
  //   _controller = AnimationController(
  //     vsync: this,
  //     duration: Duration(seconds: 2),
  //   );
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DashBoard()),
            );
          },
          child: Hero(
            tag: 'wallstreet',
            child: Image(
              image: NetworkImage(
                  'https://credenz.in/static/media/wallstreet.8165edf9.png'),
            ),
          ),
        ),
      ),
    );
  }
}
