//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/gridview.dart';
class gridview extends StatefulWidget {
  const gridview({Key? key}) : super(key: key);

  @override
  State<gridview> createState() => _gridviewState();

}

class _gridviewState extends State<gridview> {

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
    body: GridView.extent(

      maxCrossAxisExtent:150,
      padding: EdgeInsets.all(5),
      mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: List.generate(100,
              (index) => Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue)
            ),
            child: Center(
              child: Text("${index+1}",
                style:TextStyle(fontSize: 20),),
            ),
          )
      ),
    ),
    );
  }
}

