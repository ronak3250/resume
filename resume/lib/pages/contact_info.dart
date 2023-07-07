import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../globalvariable.dart';
import '../pdfpreview.dart';

class Contactscreen extends StatefulWidget {

  @override
  State<Contactscreen> createState() => _ContactscreenState();

}
File? imageFile;
TextEditingController nameControler=TextEditingController();
TextEditingController emailControler=TextEditingController();
TextEditingController phoneController=TextEditingController();
TextEditingController addressController=TextEditingController();

int index = 0;

class _ContactscreenState extends State<Contactscreen> {



  getFromGallery() async {
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        imagePath=imageFile!.path;
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    var pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
        imagePath=imageFile!.path;
      });
    }
  }

  @override
  bool border1 = true;
  bool border2 = false;
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
    //  resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          child: Icon(Icons.arrow_back_outlined),
          onTap: ()
          {
            index=0;
            Navigator.pop(context);

           //  Navigator.push(
           //    context,
           //    MaterialPageRoute(builder: (context) =>  PdfPreviewPage()),
           //  );

          },
        ),
        toolbarHeight: 110,
        title: Column(
          children: [
            Text("Resume Workspace"),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                      onTap: () {
                        setState(() {
                          index = 0;
                          border1 = true;
                          border2 = false;
                          print(imagePath);
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            border: border1
                                ? Border(
                                    bottom: BorderSide(
                                    width: 2,
                                  ))
                                : null,
                          ),
                          child: Center(child: Text("Contact")))),
                ),
                Expanded(
                  child: InkWell(
                      onTap: () {
                        setState(() {


                          if (_formKey.currentState!.validate()) {
                          name=nameControler.text;
                             email=emailControler.text;
                             phone=phoneController.text;
                             address=addressController.text;


                          index = 1;
                          border1 = false;
                          border2 = true;

                          }
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.only(bottom: 20),
                          decoration: BoxDecoration(
                            border: border2
                                ? Border(
                                    bottom: BorderSide(
                                    width: 2,
                                  ))
                                : null,
                          ),
                          child: Center(child: Text("Photo")))),
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            IndexedStack(
              index: index,
              children: [
                Container(
                  height: 500,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  width: double.infinity,
                  child:  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller:nameControler,
                            validator: (value) {
                             if(value!.isEmpty)
                               {
                                 return 'Enter The Full Name ';
                               }
                             return null;
                            },
                            decoration: const InputDecoration(
                              icon: const Icon(
                                Icons.person,
                                size: 35,
                              ),
                              hintText: 'Name',
                            ),
                          ),
                          TextFormField(
                            controller:emailControler,
                            validator: (emailvalue) {
                              bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(emailvalue!);
                              if(emailvalue!.isEmpty)
                              {
                                return 'Enter The Email Address ';
                              }
                              if(emailValid!=true)
                                {
                                  return "Enter Valid Email Address";
                                }


                            },
                            decoration: const InputDecoration(

                              icon: const Icon(
                                Icons.email,
                                size: 35,
                              ),
                              hintText: 'Email',
                            ),
                          ),
                          TextFormField(
                            controller:phoneController,
                            validator: (phonevalue)
                            {
                              String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                              RegExp regExp = new RegExp(patttern);
                              if (phonevalue?.length == 0) {
                                return 'Please enter mobile number';
                              }
                              else if (!regExp.hasMatch(phonevalue!)) {
                                return 'Please enter valid mobile number';
                              }
                              else if(phonevalue?.length==11)
                                {
                                  return 'Mobile Number must be 10 digits';
                                }
                              return null;
                            },
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              icon: const Icon(
                                Icons.phone_android,
                                size: 35,
                              ),
                              hintText: 'Phone',
                            ),
                          ),
                          TextFormField(
                            validator: (addressvalue)
                            {
                              if(addressvalue!.isEmpty)
                              {
                                return 'Enter The Address ';
                              }
                            },
                            controller:addressController,
                            maxLines: 3,
                            decoration: const InputDecoration(
                                icon: const Icon(
                                  Icons.location_on_sharp,
                                  size: 35,
                                ),
                                hintText: 'Address(Street,Building No)'),
                          ),
                        ],
                      ),
                    ),
                  
                ),
                Container(
                    child: imageFile == null
                        ? Container(
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Align(
                              child: Container(
                                margin: EdgeInsets.all(30),
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.7),
                                  shape: BoxShape.circle,
                                ),
                                child: Stack(
                                  children: [
                                    Center(
                                      child: Text(
                                        "ADD",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: InkWell(
                                        onTap: () {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: const Text("Select Image"),
                                              content: const Text(
                                                  "Add Your Profile Image from Mention Below"),
                                              actions: <Widget>[
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    await getFromGallery();
                                                    Navigator.of(context).pop();
                                                  },
                                                  child:
                                                      Text("PICK FROM GALLERY"),
                                                ),
                                                Container(
                                                  height: 20.0,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () async {
                                                    await _getFromCamera();
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("PICK FROM CAMERA"),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                        child: Container(
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.blue),
                                            height: 30,
                                            width: 30,
                                            child: Center(
                                                child: Icon(
                                              Icons.add,
                                              color: Colors.white,
                                            ))),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        // : Container(
                        //     child: Image.file(
                        //       imageFile!,
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ))
                        : Container(
                            margin: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Align(
                              child: Container(
                                margin: EdgeInsets.all(30),
                                child: CircleAvatar(
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: const Text("Select Image"),
                                            content: const Text(
                                                "Add Your Profile Image from Mention Below"),
                                            actions: <Widget>[
                                              ElevatedButton(
                                                onPressed: () async {
                                                  await getFromGallery();
                                                  Navigator.of(context).pop();
                                                },
                                                child:
                                                Text("PICK FROM GALLERY"),
                                              ),
                                              Container(
                                                height: 20.0,
                                              ),
                                              ElevatedButton(
                                                onPressed: () async {
                                                  await _getFromCamera();
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("PICK FROM CAMERA"),
                                              )
                                            ],
                                          ),
                                        );
                                      },
                                      child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.blue),
                                          height: 30,
                                          width: 30,
                                          child: Center(
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ))),
                                    ),
                                  ) ,
                                  radius: 120 - 5,
                                  backgroundImage: Image.file(
                                    imageFile!,
                                    fit: BoxFit.cover,
                                  ).image,
                                ),
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.7),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

