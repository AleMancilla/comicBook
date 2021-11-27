import 'package:flutter/material.dart';

class TopBannerBody extends StatefulWidget {
  final Widget title;
  final Function(bool) changeState;
  const TopBannerBody(
      {Key? key,
      this.title = const Text('latest issues'),
      required this.changeState})
      : super(key: key);

  @override
  _TopBannerBodyState createState() => _TopBannerBodyState();
}

class _TopBannerBodyState extends State<TopBannerBody> {
  SelectViewMode selectViewMode = SelectViewMode.list;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      padding: EdgeInsets.only(top: 8, bottom: 8, left: 10),
      // color: Colors.red,
      child: Row(
        children: [
          Expanded(child: widget.title),
          _iconButton(
            Icons.list,
            'List',
            isList: true,
            selectView: SelectViewMode.list,
          ),
          _iconButton(
            Icons.grid_view_rounded,
            'Grid',
            isList: false,
            selectView: SelectViewMode.grid,
          ),
        ],
      ),
    );
  }

  Widget _iconButton(IconData _icon, String _data,
      {required bool isList, required SelectViewMode selectView}) {
    return InkWell(
      onTap: () {
        widget.changeState(isList);
        if (isList) {
          selectViewMode = SelectViewMode.list;
        } else {
          selectViewMode = SelectViewMode.grid;
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          children: [
            Icon(
              _icon,
              color: _colorSelected(selectView),
            ),
            Text(
              _data,
              style: TextStyle(color: _colorSelected(selectView)),
            )
          ],
        ),
      ),
    );
  }

  Color _colorSelected(SelectViewMode _selectView) {
    if (selectViewMode == _selectView) {
      return Colors.green;
    } else {
      return Colors.black;
    }
  }
}

enum SelectViewMode {
  list,
  grid,
}
