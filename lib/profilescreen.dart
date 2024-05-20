// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:project1_flutter/api.dart';
import 'package:project1_flutter/homepage.dart';

class Myprofile extends StatelessWidget {
  bool _isLoading = false;
  final Datum Temperatures;
  Myprofile(this.Temperatures);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          leading: IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Myhomepage()));
              },
              icon: Icon(Icons.arrow_back)),
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   SizedBox(
                    height: 30,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: Container(
                            width: 150,
                            height: 150,
                            child: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(Temperatures.avatar),
                            )),
                      ),
                      SizedBox(
                        width: 190,
                        height: 190,
                        child: CircularProgressIndicator(
                          value: 0.8,
                          color: Colors.blue,
                          strokeWidth: 6,
                          strokeCap: StrokeCap.round,
                          backgroundColor: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                 
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '    FirstName:     ${Temperatures.firstName},',
                        style: TextStyle(fontSize: 18),
                      ),
                      Divider(
                        endIndent: 60.0,
                        indent: 10.0,
                      ),
                      Text(
                        '    LastName :    ${Temperatures.lastName}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Divider(
                        endIndent: 60.0,
                        indent: 10.0,
                      ),
                      Text(
                        '    Email:       ${Temperatures.email}',
                        style: TextStyle(fontSize: 18),
                      ),
                      Divider(
                        endIndent: 60.0,
                        indent: 10.0,
                      ),
                    ],
                  ),
                ],
              ));
  }
}
