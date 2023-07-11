import 'dart:io';
import 'package:contact/cantact_view.dart';
import 'package:contact/sharepefrence.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'contact_edit.dart';
import 'contact_save.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({Key? key}) : super(key: key);

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

List<Map<String, dynamic>> contactdata = [];

class _FirstscreenState extends State<Firstscreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return SafeArea(
          child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(
            "Contacts",
          ),
          actions: [
            InkWell(
                onTap: () {
                  setState(() {
                    themeNotifier.isDark
                        ? themeNotifier.isDark = false
                        : themeNotifier.isDark = true;
                  });
                },
                child: Icon(Icons.circle_rounded)),
            Icon(Icons.more_vert)
          ],
        ),
        body: Center(
            child: contactdata.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/box.png',
                        height: 130,
                        width: 130,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "You have not contact yet",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  )
                : ListView.separated(
                    physics: BouncingScrollPhysics(
                        decelerationRate: ScrollDecelerationRate.fast),
                    itemCount: contactdata.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ContactView(userDetails: contactdata[index])),
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              contactdata[index]['image']!="" ?
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: FileImage(File('${contactdata[index]['image']}',),
                                    ),
                                    fit: BoxFit.cover
                                  )
                                ),
                              /*  child: Image.file(
                                  File('${contactdata[index]['image']}'),
                                  fit: BoxFit.fill,
                                  width: 30,
                                  height: 30,
                                ),*/
                              )
                                  :
                               Icon(Icons.person,size: 50,),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      "${contactdata[index]['firstname']} ${contactdata[index]['Secondname']}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("+91 ${contactdata[index]['phone']}",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.grey))
                                ],
                              ),

                              Spacer(
                                flex: 2,
                              ),
                              Icon(
                                Icons.call,
                                color: Colors.green,
                                size: 40,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 10,
                      );
                    },
                  )),
        floatingActionButton: Align(
          alignment: Alignment(0.9, 0.9),
          child: FloatingActionButton(
            child: Icon(
              Icons.add,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactSave()),
              );
            },
          ),
        ),
      ));
    });
  }
}
