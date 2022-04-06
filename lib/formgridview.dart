import 'package:flutter/material.dart';
//import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const MyApp());
}

class Fruit {
  late String ten;
  late double gia;
  late String url;

  Fruit({required this.ten, required this.gia, required this.url});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Sử dụng Gridview'),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Fruit> frul = [
    Fruit(
        ten: "Xoài",
        gia: 1200,
        url:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVvXnn2zWO2Q6MkJv-RPBTQJCaVW0rdUY3CVh3eP1hSnkDOP6uVd0sQLle9GIBYJPLb4I&usqp=CAU'),
    Fruit(
        ten: "Chanh",
        gia: 1500,
        url:
        'https://images.unsplash.com/photo-1572635148818-ef6fd45eb394?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
    Fruit(
        ten: "Mận",
        gia: 1300,
        url:
        'https://images.unsplash.com/photo-1598182860315-5112e61ccf91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
    Fruit(
        ten: "Táo",
        gia: 1300,
        url:
        'http://media.istockphoto.com/photos/fresh-red-apples-on-white-background-picture-id183422512?k=6&m=183422512&s=612x612&w=0&h=BSvOL3aFruJVgjJ2pp_bfGFwUXFEm0KEkpeL4hBqZeE='),
    Fruit(
        ten: "Chanh",
        gia: 1300,
        url:
        'http://media.istockphoto.com/photos/fresh-red-apples-on-white-background-picture-id183422512?k=6&m=183422512&s=612x612&w=0&h=BSvOL3aFruJVgjJ2pp_bfGFwUXFEm0KEkpeL4hBqZeE='),
    Fruit(
        ten: "Mận",
        gia: 1300,
        url:
        'http://media.istockphoto.com/photos/fresh-red-apples-on-white-background-picture-id183422512?k=6&m=183422512&s=612x612&w=0&h=BSvOL3aFruJVgjJ2pp_bfGFwUXFEm0KEkpeL4hBqZeE='),
    Fruit(
        ten: "Mận",
        gia: 1300,
        url:
        'http://media.istockphoto.com/photos/fresh-red-apples-on-white-background-picture-id183422512?k=6&m=183422512&s=612x612&w=0&h=BSvOL3aFruJVgjJ2pp_bfGFwUXFEm0KEkpeL4hBqZeE='),
    Fruit(
        ten: "Mận",
        gia: 1300,
        url:
        'http://media.istockphoto.com/photos/fresh-red-apples-on-white-background-picture-id183422512?k=6&m=183422512&s=612x612&w=0&h=BSvOL3aFruJVgjJ2pp_bfGFwUXFEm0KEkpeL4hBqZeE='),

    Fruit(
        ten: "Đào",
        gia: 2300,
        url:
        'https://images.unsplash.com/photo-1642372849486-f88b963cb734?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80'),
    Fruit(
        ten: "Chuối",
        gia: 2000,
        url:
        'https://images.unsplash.com/photo-1571771894821-ce9b6c11b08e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Center(

        child: GridView.extent(
            padding:
            const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
            maxCrossAxisExtent: 250,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.8,
            children: frul
                .map((sp) => Card(
              elevation: 1,
              shadowColor: Colors.blue,
              child: Column(
                children: [

                  Image.network(
                    //250:250
                    sp.url,
                  ),
                  Text("${sp.ten}"),
                  Text(
                    "Giá: ${sp.gia}/kg",
                    style: const TextStyle(color: Colors.blue),
                  ),
                ],

              ),
            ))
                .toList()),
      ),

    );
  }
}