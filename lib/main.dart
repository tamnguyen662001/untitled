import 'package:flutter/material.dart';
import 'package:untitled/gridview.dart';
import 'package:untitled/home.dart';
import 'package:untitled/input.dart';
import 'package:untitled/listview.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bài Tập Flutter _ Lập trình Android'),
          centerTitle: true,
        ),
        body: homepage(),
      ),
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  List<String> images = [
    "asset/image/2.jpg",
    "asset/image/2.jpg",
    "asset/image/2.jpg",
    "asset/image/2.jpg"
  ];

  var i = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            child: Image(
              image: AssetImage(images[i],),
              fit: BoxFit.cover,
            ),
            height: 400,
            width: double.infinity,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.arrow_left_sharp),
                iconSize: 100,
                color: Colors.blue,
                onPressed: (){
                  setState(() {
                    // i > 0
                    //     ? i--
                    //     : i = images.length - 1;

                    if(i > 0)
                      i--;
                    else
                      i = images.length - 1;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.arrow_right),
                iconSize: 100,
                color: Colors.blue,
                onPressed: (){
                  setState(() {
                    // i < images.length - 1
                    //     ? i++
                    //     : i = 0;

                    if(i < images.length - 1)
                      i++;
                    else
                      i = 0;

                  });
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

/*Image.network(lits[i])
gọi lại hàm setState() để vẽ lại giao diện*/