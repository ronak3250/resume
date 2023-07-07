
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../globalvariable.dart';
import '../pdfpreview.dart';
class Declaration extends StatefulWidget {
  const Declaration({super.key});

  @override
  State<Declaration> createState() => _DeclarationState();
}
bool isSwitched = false;
final _formKey = GlobalKey<FormState>();
class _DeclarationState extends State<Declaration> {
TextEditingController declarationController=TextEditingController();

TextEditingController dateController=TextEditingController();
TextEditingController placeController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    void toggleSwitch(bool value) {

      if(isSwitched == false)
      {
        setState(() {
          isSwitched = true;

        });

      }
      else
      {
        setState(() {
          isSwitched = false;

        });

      }
    }
    return Scaffold(
     //   resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white.withOpacity(0.95),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: InkWell(
            child: Icon(Icons.arrow_back_outlined),
            onTap: ()
            {

              Navigator.pop(context);

            },
          ),
          toolbarHeight: 120,
          centerTitle: true,
          title: Text("Declaration"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(30),
                  margin: EdgeInsets.all(30),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),

                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/declaration.png",height: 40,width: 40,),
                          Spacer(flex: 3,),
                          Switch(
                            onChanged: toggleSwitch,
                            value: isSwitched,
                            activeColor: Colors.grey,
                            inactiveThumbColor: Colors.redAccent,
                            thumbColor: MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.disabled)) {
                                  return Colors.blue.withOpacity(.48);
                                }
                                return Colors.blue;
                              },
                            ),
                          //  thumbColor: MaterialStateColor[Colors.blue],


                          ),
                        ],
                      )
                      ,
                      SizedBox(
                        height: 10,
                      ),
                      isSwitched? Container(
                       child: Column(
                         children: [
                           TextFormField(
controller: declarationController,
                             validator: (value) {
                               if(value!.isEmpty)
                               {
                                 return 'Enter the Description!!';
                               }
                             },
                             decoration: InputDecoration(
                               focusedBorder: OutlineInputBorder(
                                 borderSide: BorderSide(
                                     width: 1,
                                     color:
                                     Colors.black.withOpacity(0.3)), //<-- SEE HERE
                               ),
                               enabledBorder: OutlineInputBorder(
                                 borderSide: BorderSide(
                                     width: 1,
                                     color:
                                     Colors.black.withOpacity(0.3)), //<-- SEE HERE
                               ),
                               border: InputBorder.none,
                               hintText: "Description",
                               hintStyle: TextStyle(
                                   fontSize: 20, color: Colors.grey.withOpacity(0.8)),
                             ),
                           ),
                           SizedBox(
                             height: 10,
                           ),
                           Divider(
                             thickness: 1,
                           ),
                           SizedBox(
                             height: 10,
                           ),


                           Row(

                             children: [
                               Column(
                                 children: [

                                   Align(
                                       alignment: Alignment.topRight,
                                       child: Text(
                                         "Date",
                                         style: TextStyle(
                                           color: Colors.grey,
                                           fontSize: 14,
                                           fontWeight: FontWeight.w700,
                                         ),
                                       )),

                                   Container(
                                     height: 60,
                                     width: 125,
                                     child: TextFormField(
                                       keyboardType: TextInputType.phone,
controller: dateController,
                                       validator: (value) {
                                         if(value!.isEmpty)
                                         {
                                           return 'Enter the Date';
                                         }
                                       },
                                       maxLines: 3,
                                       decoration: InputDecoration(

                                         focusedBorder: OutlineInputBorder(
                                           borderSide: BorderSide(
                                               width: 1,
                                               color:
                                               Colors.black.withOpacity(0.3)), //<-- SEE HERE
                                         ),
                                         enabledBorder: OutlineInputBorder(
                                           borderSide: BorderSide(
                                               width: 1,
                                               color:
                                               Colors.black.withOpacity(0.3)), //<-- SEE HERE
                                         ),
                                         border: InputBorder.none,
                                         hintText: "DD/MM/YYYY",
                                         hintStyle: TextStyle(
                                             fontSize: 14, color: Colors.grey.withOpacity(0.8)),
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                               Spacer(flex: 1,),
                               Column(
                                 children: [
                                   SizedBox(
                                     height: 5,
                                   ),
                                   Align(
                                       alignment: Alignment.center,
                                       child: Text(
                                         "Place(city)",
                                         style: TextStyle(
                                           color: Colors.grey,
                                           fontSize: 14,
                                           fontWeight: FontWeight.w700,
                                         ),
                                       )),
                                   SizedBox(
                                     height: 5,
                                   ),

                                   Container(
                                     height: 60,
                                     width: 120,
                                     child: TextFormField(
controller: placeController,

                                       validator: (value) {
                                         if(value!.isEmpty)
                                         {
                                           return 'Enter the Place';
                                         }
                                       },
                                       maxLines: 3,
                                       decoration: InputDecoration(

                                         focusedBorder: OutlineInputBorder(
                                           borderSide: BorderSide(
                                               width: 1,
                                               color:
                                               Colors.black.withOpacity(0.3)), //<-- SEE HERE
                                         ),
                                         enabledBorder: OutlineInputBorder(
                                           borderSide: BorderSide(
                                               width: 1,
                                               color:
                                               Colors.black.withOpacity(0.3)), //<-- SEE HERE
                                         ),
                                         border: InputBorder.none,
                                         hintText: "Eg.Ahmedabad",
                                         hintStyle: TextStyle(
                                             fontSize: 14, color: Colors.grey.withOpacity(0.8)),
                                       ),
                                     ),
                                   )

                                 ],

                               )
                             ],
                           ),
                           SizedBox(height: 10,),
                           ElevatedButton(onPressed: (){
declarationDescbrition=declarationController.text;
declarationDate=dateController.text;
place=placeController.text;
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => PdfPreviewPage()),
);
                             if(_formKey.currentState!.validate())
                             {
                               return _formKey.currentState?.save();
                             }



                           }, child: Text("Save"))
                         ],
                       ),
                     ):Text(""),



                    ],
                  ),
                ),


              ],
            ),
          ),
        ));
  }
}

