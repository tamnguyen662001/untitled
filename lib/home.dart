import 'package:flutter/material.dart';
import 'package:untitled/formgridview.dart';
import 'package:untitled/input.dart';
import 'package:untitled/listview.dart';
import 'package:untitled/provider/counter_page.dart';
import 'package:untitled/provider/myapp_provider.dart';
import 'package:untitled/provider/product_page_2.dart';
import 'package:untitled/provider/slidable.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
            //ElevatedButton(onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context) => MyListViewPage(),)),child: Text("list view"))
            buttonBuilder(context, title: "lits view 2", destination: MyListViewPage()),
            buttonBuilder(context, title: "input page 2", destination: Inputpage()),
            buttonBuilder(context, title: "gridview", destination: MyApp()),

            buttonBuilder(context, title: "slidable_1", destination: slidable()),
            buttonBuilder(context, title: "slieable_2", destination: ListProduct()),
            buttonBuilder(context, title: " counter_page", destination:  myapp_provider()),

          ],
        ),
      ),
    );
  }
  
  Widget buttonBuilder(BuildContext context, {required String title, required Widget destination }){
    return ElevatedButton(onPressed:() => Navigator.push(context, MaterialPageRoute(builder: (context) => destination,)), child: Text(title),
    );
  }
}
