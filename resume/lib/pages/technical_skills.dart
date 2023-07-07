import 'package:flutter/material.dart';

import '../globalvariable.dart';



class TechnicalScreen extends StatefulWidget {
  const TechnicalScreen({super.key});

  @override
  State<TechnicalScreen> createState() => _TechnicalScreenState();
}

List<TextEditingController> _controllers = [];
List<Row> _fields = [];


class _TechnicalScreenState extends State<TechnicalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          child: Icon(Icons.arrow_back_outlined),
          onTap: ()
          {
            for(var i in _controllers)
            {
              skill!.add(i.text);
            }
Navigator.pop(context);



          },
        ),
        toolbarHeight: 120,

        centerTitle: true,
        title: Text("Technical Skills"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          final controller = TextEditingController();
          final fields = Row(
            children: [
              Container(
                height: 20,
                width: 250,
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "C Programming,Web Technical",
                    hintStyle: TextStyle(
                        fontSize: 18, color: Colors.grey.withOpacity(0.8)),
                  ),
                ),
              ),
            ],
          );


          setState(() {
            _controllers.add(controller);
            _fields.add(fields);
          });

        },
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.all(30),
                  child: Text(
                    "Enter Your Skills",
                    style: TextStyle(
                        fontSize: 20, color: Colors.grey.withOpacity(0.8)),
                  )),
              Container(
                height: 450,
                width: double.infinity,
                child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(_fields.length, (index) {
                        return buildContainer(index);
                      }),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildContainer(index) {
    return Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        height: 60,
        width: double.infinity,
        child: Row(
          children: [
            _fields[index],
            InkWell(
              onTap: () {
                _fields.removeAt(index);
                _controllers.removeAt(index);
                print(_controllers[index].text);
                setState(() {
                  print(index);
                  print(_fields.length);
                });
              },
              child: Container(
                  height: 60, child: Icon(Icons.delete_outline_outlined)),
            )
          ],
        ));
  }
}