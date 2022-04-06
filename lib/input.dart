import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Inputpage extends StatefulWidget {
  const Inputpage({Key? key}) : super(key: key);

  @override
  State<Inputpage> createState() => _InputpageState();
}

class _InputpageState extends State<Inputpage> {
  TextEditingController txtNameController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Input widget"),
      ),
      drawer: Container(
        width: 150,
        color: Colors.grey,
        child: Column(
          children: [
            SizedBox(height: 50),
            TextButton(onPressed: () => {}, child: Text("Menu"))
          ],
        ),
      ),
      body: Column(
        children: [
          TextField(
            controller: txtNameController,
             decoration: InputDecoration(
               labelText: "Name : ",
                   hintText : "Enter here",
             ),
           // keyboardType: TextInputType.phone,
          ),
          Row(
             mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(onPressed:() => Navigator.pop(context), child: Text("Back home")),
              ElevatedButton(onPressed: ()=> {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("hello : ${txtNameController.text}"),
                      duration: Duration(seconds : 5),
                    ))
              }

              , child: Text("Submit"))
            ],
            )


        ],
      )
    );

  }
}
