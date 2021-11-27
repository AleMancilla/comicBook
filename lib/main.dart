import 'package:commic_app/app/data/data_source/remote/comic_app.dart';
import 'package:commic_app/app/data/helpers/http.dart';
import 'package:commic_app/app/data/repositories_impl/comic_repository_imp.dart';
import 'package:commic_app/app/domain/repositories/comic_repository.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final http = Http(baseUrl: 'https://comicvine.gamespot.com');

  late final ComicRepository comic;

  @override
  void initState() {
    comic = ComicRepositoryImp(ComicApi(http));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            //https://comicvine.gamespot.com/api/issues/?api_key=6f7e42c1a04a1903ca5c2a635e441781e12a537b&format=json
            comic.listOfComics;
          },
        ),
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
