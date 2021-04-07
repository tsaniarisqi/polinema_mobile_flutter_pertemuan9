import 'dart:io';
import 'package:http/http.dart' as http;

class HttpService {
  final String apiKey = '38f0a7e14a33d28494e1a5be9d8db779';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=';

  Future<String> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      String response = result.body;
      return response;
    } else {
      print("Fail");
      return null;
    }
  }
}
