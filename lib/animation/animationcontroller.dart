import 'package:flutter/material.dart';

class controller extends StatefulWidget {
  const controller({super.key});

  @override
  State<controller> createState() => _controllerState();
}

class _controllerState extends State<controller>
    with SingleTickerProviderStateMixin {
  bool isfav = false;
  late AnimationController animationController;
  late Animation coloranimation;
  late Animation<double> sizeanimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    coloranimation = ColorTween(begin: Colors.grey, end: Colors.red)
        .animate(animationController);
    sizeanimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem(tween: Tween<double>(begin: 30, end: 50), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 50, end: 30), weight: 50),
    ]).animate(animationController);
    animationController.addListener(() {
      print(animationController.value);
      print(coloranimation.value);
    });
    animationController.forward();
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isfav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isfav = false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Demo'),
        ),
        body: ListTile(
            title: Text('User'),
            trailing: AnimatedBuilder(
                animation: animationController,
                builder: (BuildContext context, _) {
                  return IconButton(
                      onPressed: () {
                        isfav
                            ? animationController.reverse()
                            : animationController.forward();
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: coloranimation.value,
                        size: sizeanimation.value,
                      ));
                })));
  }
}
