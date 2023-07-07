import 'package:flutter/material.dart';
import 'package:resume/globalvariable.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}
final _formKey = GlobalKey<FormState>();
TextEditingController courseController=TextEditingController();

TextEditingController schoolController=TextEditingController();

TextEditingController percetangeController=TextEditingController();

TextEditingController passingyearController=TextEditingController();
class _EducationState extends State<Education> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white.withOpacity(0.95),
        appBar: AppBar(
          automaticallyImplyLeading: false,

          leading: InkWell(
            child: Icon(Icons.arrow_back_outlined),
            onTap: ()
            {

              if(_formKey.currentState!.validate())
              {
                course=courseController.text;
                school=schoolController.text;
                percetange=percetangeController.text;
                yearOfPassing=passingyearController.text;
                Navigator.pop(context);
              }


            },
          ),
          toolbarHeight: 120,
          centerTitle: true,
          title: Text("Education"),
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
                            "Course/Degree",
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

controller: courseController,
                        validator: (value) {
                          if(value!.isEmpty)
                            {
                              return 'Enter the Course/Degree';
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
                          hintText: "B.Tech information Technology",
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
                            "School/College/Institude",
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
controller: schoolController,
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return 'Enter the School/Institude';
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
                          hintText: "GUJARAT UNIVERSITY",
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
                            "Percentage(with %)",
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
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return 'Enter the Pecentage';
                          }
                        },
controller: percetangeController,
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
                          hintText: "70%(or) 7.0 CGPA",
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
                            "Year of Pass",
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
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return 'Enter the Passing Year';
                          }
                        },
controller: passingyearController,
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
                          hintText: "2019",
                          hintStyle: TextStyle(
                              fontSize: 20, color: Colors.grey.withOpacity(0.8)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                    ],
                  ),
                ),


              ],
            ),
          ),
        ));
  }
}