import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class hero extends StatefulWidget {
  const hero({super.key});

  @override
  State<hero> createState() => _heroState();
}

class _heroState extends State<hero> {
  List<String> text = [
    'ABC',
    'Sell',
    'Unit',
    'Alarm',
    'New',
    'Balance',
    'Box',
    'Favorite',
    'Home',
    'Demo',
    'Tool',
    'Pero',
  ];
  List<IconData> icon = [
    Icons.abc,
    Icons.sell_rounded,
    Icons.search,
    Icons.ac_unit_sharp,
    Icons.access_alarm,
    Icons.accessibility_new_outlined,
    Icons.account_balance_sharp,
    Icons.account_box,
    Icons.arrow_back,
    Icons.favorite,
    Icons.home,
    Icons.account_balance,
  ];

  bool startAnimation = false;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
  //     setState(() {
  //       startAnimation = true;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
 //   double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: screenwidth / 20),
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: (){
                  Future.delayed(Duration(milliseconds: 300),(){
                    setState(() {
                      startAnimation = true;
                    });
                  });
                },
                child: Text(
                  'show List',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: text.length,
                  itemBuilder: (context, index) {
                    return AnimatedContainer(
                      curve: Curves.easeInOut,
                      transform: Matrix4.translationValues(
                          startAnimation ? 0 : screenwidth, 0, 0),
                      duration: Duration(milliseconds: 500 + (index * 100)),
                      height: 55,
                      width: screenwidth,
                      margin: EdgeInsets.only(bottom: 12),
                      padding:
                          EdgeInsets.symmetric(horizontal: screenwidth / 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${index + 1}.${text[index]}',
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          Icon(icon[index]),
                        ],
                      ),
                    );
                  })
            ],
          ),
        ));
  }
} 
  