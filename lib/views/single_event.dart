import 'package:flutter/material.dart';

//import 'package:glassmorphism/glassmorphism.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            opacity: 0.75,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: const Image(
                image: NetworkImage('https://i.gifer.com/fxac.gif'),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Center(
            child: ClipPath(
              clipper:
                  BackgroundClipper(MediaQuery.of(context).size.height * 0.8),
              child: GlassContainer(
                blur: 10,
                height: MediaQuery.of(context).size.height * 0.8,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.20,
            top: MediaQuery.of(context).size.height * 0.075,
            child: Container(
              margin: const EdgeInsets.fromLTRB(40, 100, 0, 0),
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient:
                    LinearGradient(colors: [Colors.purple, Colors.transparent]),
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
            ),
          ),
        ],
      ),
    );
  }
}

class BackgroundClipper extends CustomClipper<Path> {
  final double height;

  BackgroundClipper(this.height);

  @override
  Path getClip(Size size) {
    var roundnessFactor = size.height * 0.05 * (height / size.height);

    var path = Path();

    path.moveTo(0, size.height * 0.33);
    path.lineTo(0, height - roundnessFactor);
    path.quadraticBezierTo(0, height, roundnessFactor, height);
    path.lineTo(size.width - roundnessFactor, height);
    path.quadraticBezierTo(
        size.width, height, size.width, height - roundnessFactor);
    path.lineTo(size.width, roundnessFactor * 2);
    path.lineTo(
        roundnessFactor * 0.6, size.height * 0.33 - roundnessFactor * 0.3);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
