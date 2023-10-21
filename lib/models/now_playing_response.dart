import 'dart:convert';
import 'package:peliculas_20233/models/models.dart';

// Clase que representa la respuesta de la API para las películas que se están reproduciendo actualmente
class NowPlayingResponse {
  Dates
      dates; // Objeto Dates que contiene las fechas máxima y mínima de las películas
  int page; // Número de página actual
  List<Movie>
      results; // Lista de películas que se están reproduciendo actualmente
  int totalPages; // Número total de páginas disponibles
  int totalResults; // Número total de resultados disponibles

  // Constructor de la clase NowPlayingResponse
  NowPlayingResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  // Factoría para crear una instancia de NowPlayingResponse desde un JSON crudo
  factory NowPlayingResponse.fromRawJson(String str) =>
      NowPlayingResponse.fromJson(json.decode(str));

  // Factoría para crear una instancia de NowPlayingResponse desde un mapa JSON
  factory NowPlayingResponse.fromJson(Map<String, dynamic> json) =>
      NowPlayingResponse(
        dates: Dates.fromJson(
            json["dates"]), // Parsea el objeto Dates desde el JSON
        page: json["page"], // Obtiene el número de página del JSON
        results: List<Movie>.from(json["results"].map((x) =>
            Movie.fromJson(x))), // Parsea la lista de películas desde el JSON
        totalPages:
            json["total_pages"], // Obtiene el número total de páginas del JSON
        totalResults: json[
            "total_results"], // Obtiene el número total de resultados del JSON
      );
}

// Clase que representa las fechas máxima y mínima de las películas que se están reproduciendo actualmente
class Dates {
  DateTime maximum; // Fecha máxima
  DateTime minimum; // Fecha mínima

  // Constructor de la clase Dates
  Dates({
    required this.maximum,
    required this.minimum,
  });

  // Factoría para crear una instancia de Dates desde un JSON crudo
  factory Dates.fromRawJson(String str) => Dates.fromJson(json.decode(str));

  // Método para convertir el objeto Dates a un JSON crudo
  String toRawJson() => json.encode(toJson());

  // Factoría para crear una instancia de Dates desde un mapa JSON
  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(
            json["maximum"]), // Parsea la fecha máxima desde el JSON
        minimum: DateTime.parse(
            json["minimum"]), // Parsea la fecha mínima desde el JSON
      );

  // Método para convertir el objeto Dates a un mapa JSON
  Map<String, dynamic> toJson() => {
        "maximum":
            "${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}",
      };
}
