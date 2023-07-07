import 'package:flutter/material.dart';
import 'package:resume/globalvariable.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}
final _formKey = GlobalKey<FormState>();
TextEditingController projectController=TextEditingController();
TextEditingController technologiesController=TextEditingController();
TextEditingController rolesController=TextEditingController();
TextEditingController descriptionController=TextEditingController();


class _ProjectScreenState extends State<ProjectScreen> {
  bool value=false;

  bool value1=false;

  bool value2=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       // resizeToAvoidBottomInset: false,
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
          title: Text("Projects"),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                            "Project Title",
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
controller: projectController,
validator: (value) {
  if(value!.isEmpty)
  {
    return 'Enter The Project Title!!';
  }
  return null;
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
                          hintText: "Resume Builder App",
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
                            "Technologies",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child:Row(
                            children: [
                              Checkbox(

                                value: this.value,
                                onChanged: ( value) async {
                                  setState(() {
                                    this.value = value!;
                                  });
                                },
                              ),
                              SizedBox(width: 5,),
                              Text("C Programming",style: TextStyle(
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

                                value: this.value1,
                                onChanged: ( value) async {
                                  setState(() {
                                    this.value1 = value!;
                                  });
                                },
                              ),
                              SizedBox(width: 5,),
                              Text("C++",style: TextStyle(
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

                                value: this.value2,
                                onChanged: ( value) async {
                                  setState(() {
                                    this.value2 = value!;
                                  });
                                },
                              ),
                              SizedBox(width: 5,),
                              Text("Flutter",style: TextStyle(
                                  color: Colors.grey.withOpacity(0.9)
                              ),)
                            ],
                          )
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Roles",
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
                            return 'Enter The Roles!!';
                          }
                        },
controller: rolesController,
                        maxLines: 2,
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
                          hintText: "Organize team members.Code Analysis",
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
                            "Technologies",
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
                            return 'Enter The technologies!!';
                          }
                        },
controller: technologiesController,

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
                          hintText: "5- Programmers",
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
                            "Project Description",
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
controller: descriptionController,
                        validator: (value) {
                          if(value!.isEmpty)
                          {
                            return 'Enter The Project Description!!';
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
                          hintText: "Enter Your Project Description",
                          hintStyle: TextStyle(
                              fontSize: 20, color: Colors.grey.withOpacity(0.8)),
                        ),
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(onPressed: (){

                        if(_formKey.currentState!.validate())
                        {
                          projectTitle=projectController.text;
                          value?technologies.add('C Programming'):null;
                          value1?technologies.add('C++'):null;
                          value2?technologies.add('Flutter'):null;
                          projectRoles=rolesController.text;
                          technologies2=technologiesController.text;
                          projectDescription=descriptionController.text;
                          Navigator.pop(context);
                          _formKey.currentState!.save();
                        }
                      }, child: Text("Save"))

                    ],
                  ),
                ),


              ],
            ),
          ),
        ));
  }
}