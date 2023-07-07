import 'package:flutter/material.dart';
import 'package:resume/pages/achievements.dart';
import 'package:resume/pages/carrier_objective.dart';
import 'package:resume/pages/contact_info.dart';
import 'package:resume/pages/declaration.dart';
import 'package:resume/pages/education.dart';
import 'package:resume/pages/ex.dart';
import 'package:resume/pages/experiences.dart';
import 'package:resume/pages/personal_details.dart';
import 'package:resume/pages/projects.dart';
import 'package:resume/pages/references.dart';
import 'package:resume/pages/technical_skills.dart';
import 'package:resume/pdfpreview.dart';

import 'buildoption.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) =>Homescreen(),
      '/contact': (context) => Contactscreen(),
      '/carrier': (context) => Carrier(),
      '/person': (context) => PersonalScreen(),
      '/education': (context) => Education(),
      '/experience': (context) => Experience(),
      '/technical': (context) => TechnicalScreen(),
      '/project': (context) => ProjectScreen(),
      '/achievements': (context) => AchievementsScreen(),
      '/reference': (context) => ReferenceScreen(),
      '/declaration': (context) => Declaration(),
    },
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
  ));
}

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 140,
        title: Column(children: [
          Align(alignment: Alignment.topCenter, child: Text("Resume Builder")),
          SizedBox(
            height: 50,
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "\nRESUMES",
                style: TextStyle(
                    fontSize: 18, color: Colors.white.withOpacity(0.8)),
              ))
        ]),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
                height: 60,
                width: 60,
                child: Image.asset(
                  "assets/images/open-cardboard-box.png",
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: 5,
            ),
            Text(
              "No Resumes + Create new resume",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ContainScreen()),
          );

        },
        child: Icon(Icons.add),
      ),
    ));
  }
}
