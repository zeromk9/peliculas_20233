import 'dart:convert';

// Definición de la clase Movie
class Movie {
  bool adult; // Indica si la película es para adultos o no
  String backdropPath; // Ruta del fondo de la película
  List<int> genreIds; // Lista de IDs de géneros asociados a la película
  int id; // ID único de la película
  String originalLanguage; // Idioma original de la película
  String originalTitle; // Título original de la película
  String overview; // Descripción general de la película
  double popularity; // Popularidad de la película
  String posterPath; // Ruta del póster de la película
  DateTime releaseDate; // Fecha de lanzamiento de la película
  String title; // Título de la película
  bool video; // Indica si la película tiene video o no
  double voteAverage; // Promedio de votos para la película
  int voteCount; // Cantidad total de votos para la película

  // Constructor de la clase Movie
  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  // Método para obtener la URL completa del póster de la película
  get fullPosterImg {
    if (this.posterPath != null) {
      return 'https://image.tmdb.org/t/p/w500${this.posterPath}';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  get fullBackDropPath {
    if (this.backdropPath != null) {
      return 'https://image.tmdb.org/t/p/w500${this.backdropPath}';
    }
    return 'https://i.stack.imgur.com/GNhxO.png';
  }

  // Factoría para crear una instancia de Movie desde un JSON crudo
  factory Movie.fromRawJson(String str) => Movie.fromJson(json.decode(str));

  // Factoría para crear una instancia de Movie desde un mapa JSON
  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );
}
