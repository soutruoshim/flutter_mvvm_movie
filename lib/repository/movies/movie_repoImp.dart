import 'package:flutter_mvvm_movie/models/movieslist/movie.dart';
import 'package:flutter_mvvm_movie/repository/movies/movie_repo.dart';

import '../../data/remote/network/api_end_points.dart';
import '../../data/remote/network/base_api_service.dart';
import '../../data/remote/network/network_api_service.dart';

class MovieRepoImpl implements MovieRepo{
  BaseApiService _apiService = NetworkApiService();
  @override
  Future<MoviesMain?> getMoviesList() async {
    try {
      dynamic response = await _apiService.getResponse(
          ApiEndPoints().getMovies);
      print("MARAJ $response");
      final jsonData = MoviesMain.fromJson(response);
      return jsonData;
    } catch (e) {
      throw e;
      print("MARAJ-E $e}");
    }
  }
}