import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:untitled/Photo.dart';
import 'package:untitled/PhotoList.dart';
import 'package:http/http.dart' as http;

class PhotoPage extends StatefulWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}





class _PhotoPageState extends State<PhotoPage> {
  late Future<List<Photo>> photos;

  Future<List<Photo>> fetchPhotos() async{
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));if(response.statusCode==200)
    {
      List<Photo> photos;
      var list = json.decode(response.body) as List;
      photos = list.map((item) => Photo.fromJson(item)).toList();return photos;
    }
    else{
      print("Không tải được Album");
      throw Exception("Khong tai duoc Album");
    }
  }
  @override
  void initState(){
    super.initState();
    photos = fetchPhotos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image JSON"),
      ),
      body: FutureBuilder<List<Photo>>(
        future: photos,
        builder: (context, snapshot){
          if(snapshot.hasError) {
            print("Error");
            return Text("Erorr");
          }
          return snapshot.hasData
              ? PhotoList(photos: snapshot.data!)
              : const Center(
            child: CircularProgressIndicator(),
          );

        },

      ),
    );
  }
}





