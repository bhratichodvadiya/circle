import 'package:flutter/material.dart';

class Animationcontainer extends StatefulWidget {
  const Animationcontainer({super.key});

  @override
  State<Animationcontainer> createState() => _AnimationcontainerState();
}

class _AnimationcontainerState extends State<Animationcontainer> {
 

  var _width = 200.0;
  var _height = 100.0;

  bool flag = true;

  Decoration MYdec = BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    color: Color.fromARGB(255, 187, 114, 138),
  );

  double _wid = 200.0;
  double _hei = 300.0;
  bool flag1 = true;
  Decoration Mydeco = BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    color: Color.fromARGB(255, 131, 84, 211),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: AnimatedContainer(
            curve: Curves.easeInOutCubicEmphasized,
            width: _wid,
            height: _hei,
            decoration: MYdec,
            duration: Duration(seconds: 5),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                if (flag1) {
                 _wid=200.0;
                 _hei = 200.0;
      
                  MYdec = BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.yellow);
                  flag1 = false;
                } else {
                  flag1 = true;
                 _wid=200.0;
                 _hei=200.0;
                  MYdec= BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: const Color.fromARGB(255, 46, 45, 37));
                }
              });
            },
            child: Text('container')),
        SizedBox(
          height: 20,
        ),
        Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 3),
            curve: Curves.bounceIn,
            width: _width,
            height: _height,
            decoration: Mydeco,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (flag) {
                _height = 200.0;
                _width = 100.0;

                Mydeco = BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromARGB(255, 129, 121, 121),
                );
                flag = false;
              } else {
                _height = 100.0;
                _width = 200.0;

                Mydeco = BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color.fromARGB(255, 128, 54, 78));
                flag = true;
              }
            });
          },
          child: Text(
            'Animated',
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ],
    ));
  }
}
