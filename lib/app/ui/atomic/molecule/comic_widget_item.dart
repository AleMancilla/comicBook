import 'package:commic_app/app/domain/models/comic_model_response.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class ComicWidgetItem extends StatelessWidget {
  final Comic comic;
  ComicWidgetItem({
    Key? key,
    required this.comic,
  }) : super(key: key);

  final BorderRadius borderWidget = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderWidget,
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(-2, -2),
              blurRadius: 5,
            )
          ]),
      child: ClipRRect(
        borderRadius: borderWidget,
        child: _itemRow(),
      ),
    );
  }

  Row _itemRow() {
    return Row(
      children: [
        SizedBox(
          width: 130,
          child: FadeInImage(
            placeholder:
                const AssetImage('assets/images/loading/loading-bar.gif'),
            image: NetworkImage('${comic.image!.smallUrl}'),
          ),
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
}
