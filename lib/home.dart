import 'package:flutter/material.dart';
import 'package:untitled/formgridview.dart';
import 'package:untitled/input.dart';
import 'package:untitled/listview.dart';
import 'package:untitled/provider/myapp_provider.dart';
import 'package:untitled/provider/slidable.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Danh sách các bài tập Flutter"),
    ),
      body: Column(

        children: [
          //ElevatedButton(onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context) => MyListViewPage(),)),child: Text("list view"))
          buttonBuilder(context, title: "lits view 2", destination: MyListViewPage()),
          buttonBuilder(context, title: "input page 2", destination: Inputpage()),
          buttonBuilder(context, title: "gridview", destination: MyApp()),
          buttonBuilder(context, title: "myapp_provider", destination: myapp_provider()),
          buttonBuilder(context, title: "slidable", destination: slidable()),
        ],
      ),
    );
  }
  
  Widget buttonBuilder(BuildContext context, {required String title, required Widget destination }){
    return ElevatedButton(onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context) => destination,)), child: Text(title),
    );
  }
}
