import 'package:flutter/material.dart';
import 'package:resume/globalvariable.dart';

class Experience extends StatefulWidget {


  @override
  State<Experience> createState() => _ExperienceState();

}
String employee_status="Previously Employed";

class _ExperienceState extends State<Experience> {
  final _formKey = GlobalKey<FormState>();
TextEditingController companyController =TextEditingController();

  TextEditingController schoolController =TextEditingController();

  TextEditingController rolesController =TextEditingController();

  TextEditingController joinController =TextEditingController();

  TextEditingController exitController =TextEditingController();
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

              if(_formKey.currentState!.validate())
              {
                companyname=companyController.text;
                postion=schoolController.text;
                roles=rolesController.text;
                employeeStatus=employee_status;
                datejoined=joinController.text;
                dateExit=exitController.text;

                Navigator.pop(context);
                _formKey.currentState!.save();

              }

            },
          ),
          toolbarHeight: 120,
          centerTitle: true,
          title: Text("Experience"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 800,
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
                              "Company Name",
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
controller: companyController,
                          validator: (value) {
                            if(value!.isEmpty)
                            {
                              return 'Enter The Company Name!!';
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
                            hintText: "New Enterprise,San Francisco",
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
                              "Position",
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
                            hintText: "Flutter Developer",
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
                              "Roles(Optional)",
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
                            hintText: "Working with team members to come up with new concepts and product analysis...",
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
                              "Employed Status",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            )),
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 135,
                              child: RadioListTile(
                                contentPadding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                    horizontal: -4,
                                   ),
                                title: Text("Previously Employed",style: TextStyle(fontSize: 9),),
                                value: "Previously Employed",
                                groupValue: employee_status,
                                onChanged: (value){
                                  setState(() {
                                    employee_status = value.toString();
                                  });
                                },
                              ),
                            ),

                            Container(
                              height: 50,
                              width: 135,
                              child: RadioListTile(
                                contentPadding: EdgeInsets.zero,
                                visualDensity: const VisualDensity(
                                    horizontal: -4,
                                   ),
                                title: Text("Currently Employed",style: TextStyle(fontSize: 9),),
                                value: "Currently Employed",
                                groupValue: employee_status,
                                onChanged: (value){
                                  setState(() {
                                    employee_status = value.toString();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        Divider(thickness: 1,),

                        Row(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Date Joined",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
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
                                    keyboardType: TextInputType.phone,
                                    validator: (value) {
                                      if(value!.isEmpty)
                                      {
                                        return 'Enter The Join Date!!';
                                      }
                                    },
controller: joinController,
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
                            employee_status=="Previously Employed"? Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "Date Exit",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 18,
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
                                    keyboardType: TextInputType.phone,
                                    validator: (value) {
                                      if(value!.isEmpty)
                                      {
                                        return 'Enter The Exit Date!!';
                                      }
                                    },
controller: exitController,
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
                                )

                              ],

                            ):Text(""),
                          ],
                        ),
                        SizedBox(height: 20,),
                        ElevatedButton(onPressed: (){



                          if(_formKey.currentState!.validate())
                          {
                            companyname=companyController.text;
                            postion=schoolController.text;
                            roles=rolesController.text;
                            employeeStatus=employee_status;
                            datejoined=joinController.text;
                            dateExit=exitController.text;
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
          ),
        ));
  }
}