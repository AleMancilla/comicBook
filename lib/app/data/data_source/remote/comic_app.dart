import 'package:commic_app/app/data/helpers/http.dart';
import 'package:commic_app/app/data/helpers/http_method.dart';

class ComicApi {
  final Http _http;
  final String apiKey = 'c7bba7d10592a7eb353591f1e43c01492a0c9b6f';

  ComicApi(this._http);

  getListComic() async {
    final result = await _http.request(
      '/api/issues/?api_key=$apiKey&format=json',
      method: HttpMethod.get,
    );
    print('result data runtype ${result.data.runtimeType}');
    print('result error ${result.error}');
    print('result statusCode ${result.statusCode}');
    print('result data ${result.data}');

    // if(result.error != null ){
    //   return
    // }
  }
}
