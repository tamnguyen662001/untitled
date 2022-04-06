import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart ';
import 'package:untitled/fruit.dart';

import '../formgridview.dart';

class slidable extends StatelessWidget {
  List<Fruit> items = List.of(allFruit);

  slidable({Key? key}) : super(key: key);
  // const slidable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slidable page"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          //return buildListTitle(item);
          return Slidable(

              child: buildListTitle(item),
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {
                      //
                    },
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    icon: Icons.edit,
                    label: 'Chỉnh sửa',
                  ),
                  SlidableAction(
                    onPressed: (context) {
                      //
                    },
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Xoá',
                  ),
                ],
              ),
            );

        },
      ),
    );
  }

  Widget buildListTitle(Fruit item) => ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        leading:
            CircleAvatar(radius: 28, backgroundImage: NetworkImage(item.url)),
        title: Text(item.ten, style: TextStyle(fontSize: 20)),
      );
}
