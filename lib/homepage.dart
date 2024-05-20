import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1_flutter/api.dart';
import 'package:project1_flutter/profilescreen.dart';
import 'package:search_page/search_page.dart';

class Myhomepage extends StatefulWidget {
  const Myhomepage({super.key});

  @override
  State<Myhomepage> createState() => _MyhomepageState();
}
class _MyhomepageState extends State<Myhomepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getvalue();
  }
  bool _isLoading = true;
  Temperatures? dataFromAPI;
  _getvalue() async {
    final res = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body.toString());
      dataFromAPI = Temperatures.fromJson(data);
      _isLoading = false;
      setState(() {});
    } else {
      return dataFromAPI;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.person),
          title: Text('User Detail'),
          backgroundColor: Colors.blueAccent,
          actions: [
            IconButton(
                onPressed: () => showSearch(
                    context: context,
                    delegate: SearchPage(
                      
                        searchLabel: 'Search people',
                        suggestion: const Center(
                          child: Text('Filter people by name, surname or age'),
                        ),
                        failure: const Center(
                          child: Text('No result found'),
                        ),
                        builder: (data) => Card(
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              Myprofile(data)));
                                },
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: NetworkImage(data.avatar),
                                  ),
                                  title: Text(data.firstName.toString()),
                                  subtitle: Text(data.lastName.toString()),
                                ),
                              ),
                            ),
                        filter: (data) => [
                              data.avatar,
                              data.firstName,
                              data.lastName,
                              data.email,
                            ],
                        items: dataFromAPI!.data)),
                icon: Icon(Icons.search))
          ],
        ),
        /*    drawer: Drawer(
            backgroundColor: Colors.grey[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: CircleAvatar(
                    radius: 70,
                    child: Center(
                      child: Text(
                        'A',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 4,),
                Text('Email:${dataFromAPI!.data[0].email}'),
                Text('UserName: ${dataFromAPI!.data[0].firstName}'),
                Text('LastName: ${dataFromAPI!.data[0].lastName}'),
              ],
            )), */
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  final data = dataFromAPI!.data[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 3, horizontal: 2),
                    child: Card(
                        elevation: 4,
                        child: InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Myprofile(dataFromAPI!.data[index])));
                            },
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    dataFromAPI!.data[index].avatar),
                              ),
                              title: Text(dataFromAPI!.data[index].firstName
                                  .toString(),style: TextStyle(fontFamily: 'Varela Round'),),
                              subtitle: Text(
                                  dataFromAPI!.data[index].lastName.toString()),
                            ))),
                  );
                },
                itemCount: dataFromAPI!.data.length,
              ));
  }
}
