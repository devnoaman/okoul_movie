class Api {
  /// TODO this apiKey should be secured useing like [secure_storage]
  static String apiKey = '73a9d56dba416467350ef91b6ffc820f';
  static String publicUrl = "https://api.themoviedb.org/3";
  static String resprcePath = "https://image.tmdb.org/t/p/w500";
  static String testing = "http://localhost:6000";
  static String baseUrl = publicUrl;
  static String trending = "/trending";
  static String nowPlaying = "/now_playing";
  static String movie = "/movie";
  static String day = "/day";
  static String reviews = "/reviews";
  static String similar = "/similar";
  static String upcoming = "/movie/upcoming";

  static String trendingMoviesday = "$trending$movie$day";
  static String nowPlayingMovies = "$movie$nowPlaying";
}
