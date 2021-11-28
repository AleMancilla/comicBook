import 'package:commic_app/app/data/data_source/remote/comic_app.dart';
import 'package:commic_app/app/data/helpers/http.dart';
import 'package:commic_app/app/data/provider/comic_provider.dart';
import 'package:commic_app/app/data/repositories_impl/comic_repository_imp.dart';
import 'package:commic_app/app/domain/models/comic_model_response.dart' as cmr;
import 'package:commic_app/app/domain/repositories/comic_repository.dart';
import 'package:commic_app/app/ui/atomic/molecule/app_bar_widget.dart';
import 'package:commic_app/app/ui/atomic/molecule/comic_widget_item.dart';
import 'package:commic_app/app/ui/atomic/molecule/top_banner_body.dart';
import 'package:commic_app/app/ui/pages/details_comic.dart';
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
  bool listModeView = true;

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
      home: SafeArea(
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size(
              double.infinity,
              50,
            ),
            child: AppBarWidget(
              title: 'ComicBook',
            ),
          ),
          body: Column(
            children: [
              TopBannerBody(
                title: const Text('Latest Issues'),
                changeState: (isList) {
                  listModeView = isList;
                  setState(() {});
                },
              ),
              Expanded(child: bodyPage()),
            ],
          ),
        ),
      ),
    );
  }

  Widget bodyPage() {
    if (comicProvider.listComicProvider != null) {
      if (listModeView) {
        return listComicView();
      } else {
        return gridComicView();
      }
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

  Widget gridComicView() {
    try {
      return Center(
        child: SingleChildScrollView(
          child: Wrap(
            children: comicProvider.listComicProvider!
                .map((comic) => _itemListComic(comic, isListView: false))
                .toList(),
          ),
        ),
      );
    } catch (e) {
      return Center(child: Text('Error: $e'));
    }
  }

  Widget _itemListComic(cmr.Comic comic, {bool isListView = true}) {
    return Builder(builder: (context) {
      return ComicWidgetItem(
        comic: comic,
        isListModeView: isListView,
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => DetailsComic(
                  comic: comic,
                ),
              ));
        },
      );
    });
  }
}
