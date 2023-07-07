import 'package:flutter/material.dart';
import 'package:resume/pages/achievements.dart';
import 'package:resume/pages/carrier_objective.dart';
import 'package:resume/pages/contact_info.dart';
import 'package:resume/pages/declaration.dart';
import 'package:resume/pages/education.dart';
import 'package:resume/pages/experiences.dart';
import 'package:resume/pages/personal_details.dart';
import 'package:resume/pages/projects.dart';
import 'package:resume/pages/references.dart';
import 'package:resume/pages/technical_skills.dart';



var Listdata = [
  {
    "image": "assets/images/contact_info.jpeg",
    "name": "Contact info",
    "routes":'/contact',

  },
  {
    "image": "assets/images/briefcase.png",
    "name": "Carrier Objective",
    "routes": '/carrier',

  },
  {
    "image": "assets/images/user.png",
    "name": "Personal Details",
    "routes": '/person',

  },
  {
    "image": "assets/images/mortarboard.png",
    "name": "Education",
    "routes": '/education',

  },
  {
    "image": "assets/images/thinking.png",
    "name": "Experiences",
    "routes":'/experience',

  },
  {
    "image": "assets/images/skill.jpeg",
    "name": "Technical Skills",
    "routes":'/technical',

  },
  {
    "image": "assets/images/project.png",
    "name": "Projects",
    "routes":'/project',

  },
  {
    "image": "assets/images/experience.png",
    "name": "Achievements",
    "routes": '/achievements',

  },
  {
    "image": "assets/images/handshake.png",
    "name": "References",
    "routes": '/reference',

  },
  {
    "image": "assets/images/declaration.png",
    "name": "Declaration",
    "routes": '/declaration',

  }
];

class ContainScreen extends StatelessWidget {
  const ContainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading:
            Align(alignment: Alignment(0, -0.6), child: InkWell(
                onTap: ()
                {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back))),
        toolbarHeight: 140,
        title: Column(children: [
          Align(
              alignment: Alignment(-0.2,0), child: Text("Resume Workspace")),
          SizedBox(
            height: 40,
          ),
          Align(
              alignment: Alignment(-0.2,0),
              child: Text(
                "Build Options",
                style: TextStyle(
                    fontSize: 18, color: Colors.white.withOpacity(0.8)),
              ))
        ]),
      ),
      body: SingleChildScrollView(
        child: Column(children: List.generate(Listdata.length, (index) {
         return buildContainer(
              index,
                  () => Navigator.of(context).pushNamed(Listdata[index]['routes']!)
          );
        }),


        ),
      ),
    );
  }
}

buildContainer(index, Function onTap) {
  return InkWell(
    onTap: () {
      onTap();
    },
    child: Container(
      height: 100,
      color: Colors.white,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 2),
      width: double.infinity,

      child: Row(
        children: [
          Image.asset(Listdata[index]['image'].toString(),
              height: 30, width: 30, fit: BoxFit.cover),
          SizedBox(
            width: 30,
          ),
          Text(
            Listdata[index]["name"].toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Spacer(
            flex: 5,
          ),
          Icon(
            Icons.chevron_right,
            size: 30,
          ),
        ],
      ),
    ),
  );
}
