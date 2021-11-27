import 'package:commic_app/app/data/data_source/remote/comic_app.dart';
import 'package:commic_app/app/data/helpers/http.dart';
import 'package:commic_app/app/data/provider/comic_provider.dart';
import 'package:commic_app/app/data/repositories_impl/comic_repository_imp.dart';
import 'package:commic_app/app/domain/models/comic_model_response.dart' as cmr;
import 'package:commic_app/app/domain/repositories/comic_repository.dart';
import 'package:commic_app/app/ui/atomic/molecule/comic_widget_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final http = Http(baseUrl: 'https://comicvine.gamespot.com');
  late ComicProvider comicProvider;

  late final ComicRepository comic;

  @override
  void initState() {
    comic = ComicRepositoryImp(ComicApi(http));
    comicProvider = Provider.of<ComicProvider>(context, listen: false);
    chargeDataListComic();
    super.initState();
  }

  void chargeDataListComic() async {
    comicProvider.listComicProvider = await comic.listOfComics;
  }

  @override
  void didChangeDependencies() {
    comicProvider = Provider.of<ComicProvider>(context, listen: true);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: bodyPage(),
      ),
    );
  }

  Widget bodyPage() {
    if (comicProvider.listComicProvider != null) {
      return listComicView();
    } else {
      return Center(
        child: Image.asset('assets/images/loading/loading-bar.gif'),
      );
    }
  }

  Widget listComicView() {
    try {
      return ListView.builder(
        itemCount: comicProvider.listComicProvider!.length,
        itemBuilder: (context, index) {
          return _itemListComic(comicProvider.listComicProvider![index]);
        },
      );
    } catch (e) {
      return Center(child: Text('Error: $e'));
    }
  }

  _itemListComic(cmr.Comic comic) {
    return ComicWidgetItem(
      comic: comic,
    );
  }
}
