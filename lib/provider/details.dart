// import 'package:flutter/material.dart';
// import 'package:untitled/formgridview.dart';
//
// class ChiTiet extends StatefulWidget {
//   Fruit? fr;
//
//      ChiTiet({Key? key, this.fr}) : super(key: key);
//
//   @override
//   _ChiTietState createState() => _ChiTietState();
// }
//
// class _ChiTietState extends State<ChiTiet> {
//   Fruit? oldFr, newFr;
//   String labelButton = "Thêm";
//   bool add = true;
//   TextEditingController ten = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("${labelButton} sản phẩm"),
//       ),
//     )
//     body: Column(
//       children: [
//         TextField(
//           controller: ten,
//         ),
//         Row(mainAxisAlignment: MainAxisAlignment.end,
//       children:[
//         ElevatedButton(onPressed: (){
//
//         },)]
//         )
//       ],
//     );
//   }
//
//
//   void them(){
//     newFr = Fruit(ten: ten.text, gia: gia, url: url)
//   }
//   void capnhat(){}
//
//   void initstate(){
//     super.initState();
//     oldFr = widget.fr;
//     if(oldFr!= null){
//       add = false;
//       labelButton = "Cập nhật";
//       ten.text = oldFr!.ten;
//     }
//   }
// }
