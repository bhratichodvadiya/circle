import 'package:flutter/material.dart';
import 'package:project1_flutter/animation/hero%20Animation.dart';

class tween extends StatefulWidget {
  const tween({super.key});

  @override
  State<tween> createState() => _tweenState();
}

class _tweenState extends State<tween> with SingleTickerProviderStateMixin {
  late Animation animation;
  late Animation animationcolor;
  late Animation boxanimation;
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    animation = Tween(begin: 0.0, end: 200.0).animate(animationController);
    animationcolor = ColorTween(begin: Colors.amber, end: Colors.black)
        .animate(animationController);
    boxanimation = BorderRadiusTween(
            begin: BorderRadius.circular(100), end: BorderRadius.circular(0))
        .animate(animationController);
    animation.addListener(() {
      print(animation.value);
      setState(() {});
    });
    animationController.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) =>const HeroAnimated()));
              },
              child: Hero(
                tag: 'loation image',
                child: Image.asset(
                  'assets/images/jaipur.jpg',
                  height: 100,
                ),
              ),
            ),
          ),
          // Center(
          //   child: Container(
          //     width: animation.value,
          //     height: animation.value,
          //     decoration: BoxDecoration(
          //         color: animationcolor.value,
          //         borderRadius: boxanimation.value),
          //   ),
          // ),
        ],
      ),
    );
  }
}
