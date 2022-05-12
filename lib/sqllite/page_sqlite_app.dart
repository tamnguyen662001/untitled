import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'page_home.dart';
import 'provider_data.dart';


class SQLiteApp extends StatefulWidget {
  const SQLiteApp({Key? key}) : super(key: key);

  @override
  State<SQLiteApp> createState() => _SQLiteAppState();
}

class _SQLiteAppState extends State<SQLiteApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context){
          var databaseProvider = DatabaseProvider();
          databaseProvider.readUsers();
          return databaseProvider;
        },
    child: const MaterialApp(
      title: "SQLite APP",
      home: PageListUserSQLite(),
    ),);
  }
}
