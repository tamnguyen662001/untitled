import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

// Future<http.Response> fetchPhotos(http.Client client) async {
//   return client.get('https://jsonplaceholder.typicode.com/photos');
// }


// List<Photo> parsePhotos(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//
//   return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
// }



class Photo {

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  Photo({required this.albumId, required this.id, required this.title, required this.url, required this.thumbnailUrl});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }
}
