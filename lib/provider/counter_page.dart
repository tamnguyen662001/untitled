import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/counter_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class counter_page extends StatelessWidget {
  const counter_page({Key? key}) : super(key: key);
// dua cac widget vao tt layout tinh sau
  @override
  Widget build(BuildContext context) {
    var counter_provider = Provider.of<Counter_provider>(context, listen : true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Page"),
      ),
      body: Column(
        children: [
          Text("Number on pressed : "),
          // Consumer<Counter_provider>(builder:(context, Counter_provider, child) {
          //   return Text("${Counter_provider.value}");
          // },
          // )
          FutureBuilder <int>(future: counter_provider.getValue(), builder: (context, snapshot){
            return Text("${snapshot.data}");
          },)
        ],
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.add),
        onPressed: (){
          var provider = context.read<Counter_provider>();
          provider.increament();
        },
      ),
    );
  }
}
