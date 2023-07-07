import 'package:resume/pages/contact_info.dart';
import 'dart:convert';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
import 'dart:io';
import 'package:flutter/services.dart' show Size, rootBundle;
import 'package:printing/printing.dart';

import 'dart:io';

String? name = "";
String? phone = "";
String? email = '';
String? address = "";
String? imagePath = imageFile?.path;
String? carrierObjective = "";
String? currentDesignation = "";
String? dob = "";
String? maritalStatus = "";
Set languagesKnown = {};
String? nationality = "";
String? course = "";
String? school = "";
String? percetange = "";
String? yearOfPassing = "";
String? companyname = "";
String? postion = "";
String? roles = "";
String? employeeStatus = "";
String? datejoined = "";
String? dateExit = "-";
List skill = [];
String? projectTitle = "";
Set technologies = {};
String? projectRoles = "";
String? technologies2 = '';
String? projectDescription = "";
List achievements = [];
String? referenceName = "";
String? designation = "";
String? organization = "";
String? declarationDescbrition = "";
String? declarationDate = "";
String? place = "";

Future<Uint8List> makePdf() async {
  final image = File(imageFile!.path).readAsBytesSync();
  final pdfImage = MemoryImage(image);
  final pdf = Document();
  pdf.addPage(
    Page(
      build: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.cover, image: pdfImage),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(name!,
                        // textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: PdfColors.black)),
                    Text(email!,
                        // textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: PdfColors.black)),
                    Text(phone!,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: PdfColors.black)),
                    Text(address!,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: PdfColors.black)),
                  ])
            ]),
            SizedBox(height: 5),
            Divider(thickness: 2),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Carrier Objective',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.black)),
            ),
            Divider(thickness: 2),
            Align(
              alignment: Alignment.topLeft,
              child: Text(currentDesignation!,
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(carrierObjective!,
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            SizedBox(height: 5),
            Divider(thickness: 2),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Personal Details',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.black)),
            ),
            Divider(thickness: 2),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Date Of Birth : $dob',
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text("\nMarital Status : $maritalStatus",
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text("\nLanguages Known : ",
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: languagesKnown
                      .map((e) => Text(e,
                          style:
                              TextStyle(fontSize: 14, color: PdfColors.black)))
                      .toList()),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text("\nNationality : $nationality",
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            Divider(thickness: 2),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Education Details',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.black)),
            ),
            Divider(thickness: 2),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Course Name : $course',
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text("\nSchool/ Collage/ Institude : $school",
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text("\nPercentage : $percetange",
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text("\nYear of Passsing : $yearOfPassing",
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            Divider(thickness: 2),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Experience',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.black)),
            ),
            Divider(thickness: 2),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Company Name : $companyname',
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text("\nPosition : $postion",
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text("\nRoles In Company: $roles",
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            employeeStatus == 'Previously Employed'
                ? Column(children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("\nDate Of Joining : $datejoined",
                          style:
                              TextStyle(fontSize: 14, color: PdfColors.black)),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("\nDate Of Exit : $dateExit",
                          style:
                              TextStyle(fontSize: 14, color: PdfColors.black)),
                    )
                  ])
                : Align(
                    alignment: Alignment.topLeft,
                    child: Text("\nDate Of Joining : $datejoined",
                        style: TextStyle(fontSize: 14, color: PdfColors.black)),
                  )
          ],
        );
      },
    ),
  );
  pdf.addPage(
    Page(
      build: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Divider(thickness: 2),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Technical Skill',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.black)),
            ),
            Divider(thickness: 2),
            Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              for (var i in skill)
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("$i\n", style: TextStyle(fontSize: 14)),
                )
            ]),
            Divider(thickness: 2),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Project',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.black)),
            ),
            Divider(thickness: 2),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Project Title Name : $projectTitle',
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Technologies : ",
                style: TextStyle(fontSize: 14, color: PdfColors.black),
              ),
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.topLeft,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: technologies
                      .map((e) => Text(e,
                          style:
                              TextStyle(fontSize: 14, color: PdfColors.black)))
                      .toList()),
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.topLeft,
              child: Text("Roles In Project : $projectRoles",
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text("Developers : $technologies2",
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text("Project Description : $projectDescription",
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            SizedBox(height: 5),
            Divider(thickness: 2),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Achievements',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.black)),
            ),
            Divider(thickness: 2),
            Align(
                alignment: Alignment.topLeft,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (var x in achievements)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text("$x\n"),
                        )
                    ])),
            Divider(thickness: 2),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Reference',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.black)),
            ),
            Divider(thickness: 2),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Reference Name: $referenceName',
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text("Designation $designation",
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Organization/Institude $organization',
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            Divider(thickness: 2),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Declaration',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: PdfColors.black)),
            ),
            Divider(thickness: 2),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(declarationDescbrition!,
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("\nDate:$declarationDate",
                    style: TextStyle(fontSize: 14, color: PdfColors.black)),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text("\n Place: $place",
                    style: TextStyle(fontSize: 14, color: PdfColors.black)),
              ),
            ]),
            SizedBox(height: 50),
            Align(
              alignment: Alignment.centerRight,
              child: Text("Your Sincerely\n ($name)",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: PdfColors.black)),
            ),
          ],
        );
      },
    ),
  );

  final outPut = await getExternalStorageDirectory();

  String path = outPut!.path + '/example.pdf';
  final file = File(path);
  file.writeAsBytesSync(await pdf.save());

  print(outPut.path);

  return pdf.save();
}

Widget PaddedText(
  final String text, {
  final TextAlign align = TextAlign.left,
}) =>
    Padding(
      padding: EdgeInsets.all(5),
      child: Text(
        text,
        textAlign: align,
      ),
    );
