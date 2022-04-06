import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/counter_provider.dart';

class counter_page extends StatelessWidget {
  const counter_page({Key? key}) : super(key: key);
// dua cac widget vao tt layout tinh sau
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Page"),
      ),
      body: Column(
        children: [
          Text("Number on pressed : "),
          Consumer<Counter_provider>(builder:(context, Counter_provider, child) {
            return Text("${Counter_provider.value}");
          },
          )
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
