import 'dart:ui';

import 'package:commic_app/app/data/data_source/remote/comic_app.dart';
import 'package:commic_app/app/data/helpers/http.dart';
import 'package:commic_app/app/data/provider/comic_provider.dart';
import 'package:commic_app/app/data/repositories_impl/comic_repository_imp.dart';
import 'package:commic_app/app/domain/models/comic_model_response.dart' as cmr;
import 'package:commic_app/app/domain/repositories/comic_repository.dart';
import 'package:commic_app/app/ui/atomic/molecule/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsComic extends StatefulWidget {
  final cmr.Comic comic;
  const DetailsComic({Key? key, required this.comic}) : super(key: key);

  @override
  State<DetailsComic> createState() => _DetailsComicState();
}

class _DetailsComicState extends State<DetailsComic> {
  late final http;
  late ComicProvider comicProvider;

  late final ComicRepository comic;
  bool listModeView = true;

  @override
  void initState() {
    print(' --> ${widget.comic.apiDetailUrl!}');
    http = Http(baseUrl: widget.comic.apiDetailUrl!);
    comic = ComicRepositoryImp(ComicApi(http));
    comicProvider = Provider.of<ComicProvider>(context, listen: false);
    chargeDataListComic();
    super.initState();
  }

  void chargeDataListComic() async {
    comicProvider.listComicDetails = await comic.comicsDetails;
  }

  @override
  void didChangeDependencies() {
    comicProvider = Provider.of<ComicProvider>(context, listen: true);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    comicProvider.listComicDetails = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
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
        body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              ClipRRect(
                child: Container(
                  width: size.width,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage('${widget.comic.image!.smallUrl}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.white.withOpacity(0.0)),
                    ),
                  ),
                ),
              ),
              ClipRRect(
                child: Container(
                  width: size.width,
                  height: 200,
                  color: Colors.black38,
                  // child: BackdropFilter(
                  //   filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  //   child: Container(
                  //     decoration:
                  //         BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  //   ),
                  // ),
                ),
              ),
              listBody(size),
              // Positioned(
              //   top: 330,
              //   child: SingleChildScrollView(
              //     child: Column(
              //       children: [
              //         _listGroup(
              //           size,
              //           'Character',
              //           comicProvider.listComicDetails!.characterCredits!
              //               .map((data) => Wrap(
              //                     children: [
              //                       _itemPerson(data.apiDetailUrl.toString(),
              //                           data.name.toString(), size)
              //                     ],
              //                   ))
              //               .toList(),
              //         ),
              //         _listGroup(
              //           size,
              //           'Character',
              //           comicProvider.listComicDetails!.characterCredits!
              //               .map((data) => Wrap(
              //                     children: [
              //                       _itemPerson(data.apiDetailUrl.toString(),
              //                           data.name.toString(), size)
              //                     ],
              //                   ))
              //               .toList(),
              //         ),
              //         _listGroup(
              //           size,
              //           'Character',
              //           comicProvider.listComicDetails!.characterCredits!
              //               .map((data) => Wrap(
              //                     children: [
              //                       _itemPerson(data.apiDetailUrl.toString(),
              //                           data.name.toString(), size)
              //                     ],
              //                   ))
              //               .toList(),
              //         ),
              //         _listGroup(
              //           size,
              //           'Character',
              //           comicProvider.listComicDetails!.characterCredits!
              //               .map((data) => Wrap(
              //                     children: [
              //                       _itemPerson(data.apiDetailUrl.toString(),
              //                           data.name.toString(), size)
              //                     ],
              //                   ))
              //               .toList(),
              //         ),
              //         _listGroup(
              //           size,
              //           'Character',
              //           comicProvider.listComicDetails!.characterCredits!
              //               .map((data) => Wrap(
              //                     children: [
              //                       _itemPerson(data.apiDetailUrl.toString(),
              //                           data.name.toString(), size)
              //                     ],
              //                   ))
              //               .toList(),
              //         ),
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
        // Column(
        //   children: [
        //     _heroImage(),
        //     _details(),
        //   ],
        // ),
      ),
    );
  }

  Container listBody(Size size) {
    return Container(
      // height: size.height + 200,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        // height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 150,
                    height: 230,
                    child: _heroImage(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, left: 30),
                    child: SizedBox(
                      height: 230,
                      child: Column(
                        children: [
                          Expanded(child: Container()),
                          SizedBox(
                            // color: Colors.red,
                            width: size.width - 220,
                            child: Text(
                              widget.comic.volume!.name.toString(),
                              style: const TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            width: size.width - 220,
                            child: Text(
                              '# ' + widget.comic.issueNumber.toString(),
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              _listResponse(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _listResponse(Size size) {
    try {
      return Column(
        children: [
          _listGroup(
            size,
            'Character',
            comicProvider.listComicDetails!.characterCredits!
                .map((data) => Wrap(
                      children: [
                        _itemPerson(data.apiDetailUrl.toString(),
                            data.name.toString(), size)
                      ],
                    ))
                .toList(),
          ),
          _listGroup(
            size,
            'Teams',
            comicProvider.listComicDetails!.teamCredits!
                .map((data) => Wrap(
                      children: [
                        _itemPerson(data.apiDetailUrl.toString(),
                            data.name.toString(), size)
                      ],
                    ))
                .toList(),
          ),
        ],
      );
    } catch (e) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  Hero _heroImage() {
    return Hero(
      tag: widget.comic.id.toString(),
      child: FadeInImage(
        placeholder: const AssetImage('assets/images/loading/loading-bar.gif'),
        image: NetworkImage('${widget.comic.image!.smallUrl}'),
      ),
    );
  }

  // Widget _details() {
  //   if (comicProvider.listComicDetails != null) {
  //     return Text(comicProvider.listComicDetails!.volume!.name.toString());
  //   } else {
  //     return CircularProgressIndicator();
  //   }
  // }

  Widget _listGroup(Size size, String title, List<Widget> listWidget) {
    try {
      return Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            width: size.width,
            child: Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Container(
            width: size.width - 100,
            height: 5,
            color: Colors.grey,
          ),
          Wrap(
            children: listWidget,
          ),
        ],
      );
    } catch (e) {
      return const Center(child: CircularProgressIndicator());
    }
  }

  _itemPerson(String image, String name, Size size) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: size.width / 2 - 20,
      child: Row(
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: Image.asset('assets/images/loading/loading_black.gif'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: const TextStyle(color: Colors.green),
            ),
          )
        ],
      ),
    );
  }
}
