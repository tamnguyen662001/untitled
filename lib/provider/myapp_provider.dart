import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/provider/counter_page.dart';
import 'counter_provider.dart';

class myapp_provider extends StatelessWidget {
  const myapp_provider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Counter_provider(),
        child: const MaterialApp(
          title: "Provider",
          home: const counter_page(),
        ),
        );
    // tra ve mot cai changnotifie provider, co pt create
  }
}
