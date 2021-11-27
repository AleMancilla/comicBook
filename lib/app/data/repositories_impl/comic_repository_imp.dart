import 'package:commic_app/app/data/data_source/remote/comic_app.dart';
import 'package:commic_app/app/domain/repositories/comic_repository.dart';

class ComicRepositoryImp implements ComicRepository {
  final ComicApi _comicApi;
  ComicRepositoryImp(this._comicApi);

  @override
  Future get listOfComics {
    return _comicApi.getListComic();
  }
}
