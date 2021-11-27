import 'package:commic_app/app/data/helpers/http.dart';
import 'package:commic_app/app/data/helpers/http_method.dart';
import 'package:commic_app/app/domain/models/comic_model_response.dart';

class ComicApi {
  final Http _http;
  final String apiKey = 'c7bba7d10592a7eb353591f1e43c01492a0c9b6f';

  ComicApi(this._http);

  Future<List<Comic>?> getListComic() async {
    final result = await _http.request<List<Comic>?>(
      '/api/issues/?api_key=$apiKey&format=json',
      method: HttpMethod.get,
      parser: (data) {
        return ComicModelResponse.fromMap(data).results;
      },
    );
    // print('result data runtype ${result.data.runtimeType}');
    // print('result error ${result.error?.data}');
    // print('result statusCode ${result.statusCode}');
    // print('result data ${result.data}');
    return result.data;
  }
}
