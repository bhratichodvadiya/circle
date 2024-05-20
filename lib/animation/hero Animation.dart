import 'package:flutter/material.dart';

class HeroAnimated extends StatefulWidget {
  const HeroAnimated({super.key});

  @override
  State<HeroAnimated> createState() => _HeroAnimatedState();
}

class _HeroAnimatedState extends State<HeroAnimated> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      body:  Center(

           child: Container(
             child: Image.asset('assets/images/jaipur.jpg'),
           ),
        ),

    );
  }
}