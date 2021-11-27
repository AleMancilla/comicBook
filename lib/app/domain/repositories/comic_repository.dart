import 'package:commic_app/app/domain/models/comic_model_response.dart';

abstract class ComicRepository {
  Future<List<Comic>?> get listOfComics;
}
