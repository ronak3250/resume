import 'package:flutter/material.dart';
import 'package:resume/globalvariable.dart';

class Carrier extends StatefulWidget {
  @override
  State<Carrier> createState() => _CarrierState();
}

class _CarrierState extends State<Carrier> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController CarrierObjectiveController = TextEditingController();
  TextEditingController currentdesignationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white.withOpacity(0.95),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: InkWell(
            child: Icon(Icons.arrow_back_outlined),
            onTap: () {


              if(_formKey.currentState!.validate())
              {
                currentDesignation = currentdesignationController.text;
                carrierObjective = CarrierObjectiveController.text;
_formKey.currentState?.save();
                Navigator.pop(context);

              }
            },
          ),
          toolbarHeight: 120,
          centerTitle: true,
          title: Text("Carrier Objective"),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(30),
                  margin: EdgeInsets.all(30),
                  height: 350,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Career Objective",
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
                        controller: CarrierObjectiveController,
                        validator: (carriervalue) {
                          if (carriervalue!.isEmpty) {
                            return 'Enter the Carrier Objective';
                          }
                        },
                        maxLines: 8,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Colors.black
                                    .withOpacity(0.3)), //<-- SEE HERE
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Colors.black
                                    .withOpacity(0.3)), //<-- SEE HERE
                          ),
                          border: InputBorder.none,
                          hintText: "Description",
                          hintStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.grey.withOpacity(0.8)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 20),
                  margin: EdgeInsets.only(left: 30, right: 30, top: 10),
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Current Designation\n(Experienced Candidate)",
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
                        controller:currentdesignationController ,
                        validator: (Desiginationvalue) {
                          if (Desiginationvalue!.isEmpty) {
                            return 'Enter the  Current Desigination ';
                          }
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Colors.black
                                    .withOpacity(0.3)), //<-- SEE HERE
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1,
                                color: Colors.black
                                    .withOpacity(0.3)), //<-- SEE HERE
                          ),
                          border: InputBorder.none,
                          hintText: "Software Engineer",
                          hintStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.grey.withOpacity(0.8)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
