import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../globalvariable.dart';

class PersonalScreen extends StatefulWidget {
  @override
  State<PersonalScreen> createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  final _formKey = GlobalKey<FormState>();
TextEditingController dobController=TextEditingController();
  TextEditingController nationalityController=TextEditingController();
  String gender='Single';
bool value=false;

  bool value1=false;

  bool value2=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        appBar: AppBar(
          leading: InkWell(
            child: Icon(Icons.arrow_back_outlined),
            onTap: () {


              if(_formKey.currentState!.validate())
              {
                _formKey.currentState!.save();
                dob=dobController.text;
                maritalStatus=gender;
                value?languagesKnown.add('English'):null;
                value1?languagesKnown.add('Hindi'):null;
                value2?languagesKnown.add('Gujarati'):null;
                nationality=nationalityController.text;

                Navigator.pop(context);

              }
            },
          ),
          toolbarHeight: 120,
          centerTitle: true,
          title: Text("Personal Details"),
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
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "DOB",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
keyboardType: TextInputType.phone,
controller: dobController,
                        validator: (dobvalue) {
                          if(dobvalue!.isEmpty)
                            {
                              return 'Enter the Date of Born!!';
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
                          hintText: "DD/MM/YYYY",

                          hintStyle: TextStyle(
                              fontSize: 20, color: Colors.grey.withOpacity(0.8)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Marital Status",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      RadioListTile(
                          contentPadding: EdgeInsets.zero,
                          visualDensity: const VisualDensity(
                            horizontal: -4,
                            vertical: -4
                          ),
                        title: Text("Single"),
                        value: "Single",
                        groupValue: gender,
                        onChanged: (value){
                          setState(() {
                            gender = value.toString();
                          });
                        },
                      ),

                      RadioListTile(
                        contentPadding: EdgeInsets.zero,
                        visualDensity: const VisualDensity(
                            horizontal: -4,
                            vertical: -4
                        ),
                        title: Text("Married"),
                        value: "Married",
                        groupValue: gender,
                        onChanged: (value){
                          setState(() {
                            gender = value.toString();
                          });
                        },
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Languages Known",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                  SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child:Row(
                      children: [
                        Checkbox(

                          visualDensity: const VisualDensity(
                              horizontal: -4,
                              vertical: -4
                          ),
                          value: this.value,
                          onChanged: ( value) async {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        ),
                        SizedBox(width: 5,),
                        Text("English",style: TextStyle(
                          color: Colors.grey.withOpacity(0.9)
                        ),)
                      ],
                    )
                     ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child:Row(
                            children: [
                              Checkbox(
                                visualDensity: const VisualDensity(
                                    horizontal: -4,
                                    vertical: -4
                                ),
                                value: this.value1,
                                onChanged: ( value) async {
                                  setState(() {
                                    this.value1 = value!;
                                  });
                                },
                              ),
                              SizedBox(width: 5,),
                              Text("Hindi",style: TextStyle(
                                  color: Colors.grey.withOpacity(0.9)
                              ),)
                            ],
                          )
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child:Row(
                            children: [
                              Checkbox(
                                visualDensity: const VisualDensity(
                                    horizontal: -4,
                                    vertical: -4
                                ),
                                value: this.value2,
                                onChanged: ( value) async {
                                  setState(() {
                                    this.value2 = value!;
                                  });
                                },
                              ),
                              SizedBox(width: 5,),
                              Text("Gujarati",style: TextStyle(
                                  color: Colors.grey.withOpacity(0.9)
                              ),)
                            ],
                          )
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Nationality",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(

 controller: nationalityController,
                        validator: (nationalityvalue) {
                          if(nationalityvalue!.isEmpty)
                            {
                              return 'Enter the Nationality';
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
                          hintText: "Indian",
                          hintStyle: TextStyle(
                              fontSize: 20, color: Colors.grey.withOpacity(0.8)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(onPressed: (){

                        if(_formKey.currentState!.validate())
                          {
                            dob=dobController.text;
                            maritalStatus=gender;
                            value?languagesKnown.add('English'):null;
                            value1?languagesKnown.add('Hindi'):null;
                            value2?languagesKnown.add('Gujarati'):null;
                            nationality=nationalityController.text;
                            _formKey.currentState!.save();
                            Navigator.pop(context);

                          }

                      }, child:Text("SAVE"))

                    ],
                  ),
                ),


              ],
            ),
          ),
        ));
  }
}

