import 'package:commic_app/app/domain/models/comic_model_response.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class ComicWidgetItem extends StatelessWidget {
  final Comic comic;
  final bool isListModeView;
  final Function onTap;
  ComicWidgetItem({
    Key? key,
    required this.comic,
    this.isListModeView = true,
    required this.onTap,
  }) : super(key: key);

  final BorderRadius borderWidget = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderWidget,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(-2, -2),
              blurRadius: 5,
            )
          ],
        ),
        child: ClipRRect(
          borderRadius: borderWidget,
          child: Material(
            child: InkWell(
              onTap: () {
                onTap();
              },
              child: Ink(
                // margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: borderWidget,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(-2, -2),
                      blurRadius: 5,
                    )
                  ],
                ),
                child: ClipRRect(
                  borderRadius: borderWidget,
                  child: isListModeView ? _itemRow() : _itemColumn(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _itemRow() {
    return Row(
      children: [
        SizedBox(
          width: 130,
          child: _fadeInImage(),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              "${comic.name ?? comic.volume!.name ?? 'REALLY NO DATA'} - #${comic.issueNumber}",
            ),
            subtitle: Text(Jiffy(comic.dateAdded).yMMMMd),
          ),
        ),
      ],
    );
  }

  Widget _fadeInImage() {
    return Hero(
      tag: comic.id.toString(),
      child: FadeInImage(
        placeholder: const AssetImage('assets/images/loading/loading-bar.gif'),
        image: NetworkImage('${comic.image!.smallUrl}'),
      ),
    );
  }

  Widget _itemColumn() {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          SizedBox(
            width: 150,
            child: _fadeInImage(),
          ),
          Center(
            child: ListTile(
              title: Text(
                "${comic.name ?? comic.volume!.name ?? 'REALLY NO DATA'} - #${comic.issueNumber}",
              ),
              subtitle: Text(Jiffy(comic.dateAdded).yMMMMd),
            ),
          ),
        ],
      ),
    );
  }
}
