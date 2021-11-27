import 'package:commic_app/app/domain/models/comic_model_response.dart';
import 'package:flutter/cupertino.dart';

class ComicProvider with ChangeNotifier {
  List<Comic>? _listComicProvider;

  List<Comic>? get listComicProvider => _listComicProvider;
  set listComicProvider(List<Comic>? list) {
    _listComicProvider = list ?? [];
    notifyListeners();
  }
}
