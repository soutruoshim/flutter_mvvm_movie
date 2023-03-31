import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_movie/data/remote/response/api_response.dart';
import 'package:flutter_mvvm_movie/repository/movies/movie_repoImp.dart';

import '../../models/movieslist/movie.dart';

class MoviesListVM extends ChangeNotifier{
   final _myRepo = MovieRepoImpl();

   ApiResponse<MoviesMain> movieMain = ApiResponse.loading();

   void _setMovieMain(ApiResponse<MoviesMain> response) {
      print("MARAJ :: $response");
      movieMain = response;
      notifyListeners();
   }

   Future<void> fetchMovies() async {
      _setMovieMain(ApiResponse.loading());
      _myRepo
          .getMoviesList()
          .then((value) => _setMovieMain(ApiResponse.completed(value)))
          .onError((error, stackTrace) => _setMovieMain(ApiResponse.error(error.toString())));
   }

}