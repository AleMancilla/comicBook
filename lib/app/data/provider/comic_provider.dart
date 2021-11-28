import 'package:commic_app/app/domain/models/comic_details.dart';
import 'package:commic_app/app/domain/models/comic_model_response.dart';
import 'package:flutter/cupertino.dart';

class ComicProvider with ChangeNotifier {
  List<Comic>? _listComicProvider;

  List<Comic>? get listComicProvider => _listComicProvider;
  set listComicProvider(List<Comic>? list) {
    _listComicProvider = list ?? [];
    notifyListeners();
  }

  ComicDetails? _listComicDetails;

  ComicDetails? get listComicDetails => _listComicDetails;
  set listComicDetails(ComicDetails? data) {
    _listComicDetails = data;
    notifyListeners();
  }
}
