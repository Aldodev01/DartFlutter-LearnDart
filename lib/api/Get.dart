import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Album>> fetchAlbums(http.Client client) async {
  final response = await client.get(
    Uri.parse('https://jsonplaceholder.typicode.com/albums'),
    headers: {
      HttpHeaders.acceptHeader: 'Basic your_api_token_here',
    },
  );

  if (response.statusCode == 200) {
    // Jika pemanggilan API berhasil, parse JSON
    List<dynamic> parsedJson = json.decode(response.body);
    return parsedJson.map((json) => Album.fromJson(json)).toList();
  } else {
    // Jika pemanggilan API tidak berhasil, lempar exception
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

void main() => runApp(const MyApp());

class AlbumList extends StatelessWidget {
  final List<Album> albums;

  AlbumList({required this.albums});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: albums.length,
      itemBuilder: (context, index) {
        return Card(
          color: Colors.primaries.first,
          child: Padding(
              padding:
                  EdgeInsetsDirectional.symmetric(vertical: 20, horizontal: 10),
              child: Text(
                'ID: ${albums[index].id} - UserID: ${albums[index].userId}',
                style: TextStyle(color: Colors.white),
              )),
          // title: Text(albums[index].title),
          // subtitle:
        );
      },
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<List<Album>> futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbums = fetchAlbums(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: FutureBuilder<List<Album>>(
          future: fetchAlbums(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? AlbumList(albums: snapshot.data!)
                : Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
