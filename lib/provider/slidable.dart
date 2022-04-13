// import 'dart:core';
// import 'dart:math';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart ';
// import 'package:untitled/fruit.dart';
//
// import 'package:provider/provider.dart';
// import 'package:untitled/provider/details.dart';
// import 'package:untitled/provider/slidable_provider.dart';
//
// import '../formgridview.dart';
//
// class slidable extends StatelessWidget {
//   List<Fruit> items = List.of(allFruit);
//
//    slidable({Key? key}) : super(key: key);
//   // const slidable({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Slidable page"),
//         centerTitle: true,
//       ),
//       body: Container(
//         child: (//Consumer<slidabe_provider>(builder:(context, slidabe_provider, child) {
//
//         ListView.builder(
//           itemCount: items.length,
//           itemBuilder: (context, index)
//         {
//           final item = items[index];
//           //return buildListTitle(item);
//           return Slidable(
//
//             child: buildListTitle(item),
//             endActionPane: ActionPane(
//               motion: const StretchMotion(),
//               children: [
//                 SlidableAction(
//                   onPressed: (context) {
//                     // if(them == true)
//                     //   {
//                     //     them();
//                     //   }
//                   },
//                   backgroundColor: Colors.orange,
//                   foregroundColor: Colors.white,
//                   icon: Icons.remove_red_eye_sharp,
//                   label: 'Xem',
//                 ),
//                 SlidableAction(
//                   onPressed: (context) async {
//                     // String? confim = await showConFirmDiaLog(
//                     //     context, "Có chắc muốn xoá ${item.ten} ?");
//                     // if (confim == "Ok") {
//                     //   var provider = context.read<Fruit>();
//                     //   provider.XoaSP(item.ten);
//                     // }
//                   },
//                   backgroundColor: Colors.red,
//                   foregroundColor: Colors.white,
//                   icon: Icons.delete,
//                   label: 'Xoá',
//                 ),
//                 SlidableAction(
//                   onPressed: (context)  {
//                     // Navigator.push(context, MaterialPageRoute(builder: (context) => ChiTiet(fr: Fruit.List[index]),))
//                     // String? confim = await showConFirmDiaLog(
//                     //     context, "Có chắc muốn xoá ${item.ten} ?");
//                     // if (confim == "Ok") {
//                     //   var provider = context.read<Fruit>();
//                     //   provider.XoaSP(item.ten);
//                     // }
//                   },
//                   backgroundColor: Colors.greenAccent,
//                   foregroundColor: Colors.white,
//                   icon: Icons.edit,
//                   label: 'Sửa',
//                 ),
//               ],
//             ),
//           );
//         },)
//
//   ),
//       ),
//     );
//   }
//
//   Widget buildListTitle(Fruit item) => ListTile(
//         contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
//         leading:
//             CircleAvatar(radius: 28, backgroundImage: NetworkImage(item.url)),
//         title: Text(item.ten, style: TextStyle(fontSize: 20)),
//         subtitle: Text(""),
//         trailing: Text(item.gia.toString()),
//       );
// }



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
                  label: 'github',
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
