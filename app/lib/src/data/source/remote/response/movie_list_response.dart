import 'package:bloc_pattern/src/data/model/item_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_list_response.g.dart';

@JsonSerializable()
class MovieListResponse {
  int page;
  int totalResults;
  int totalPages;
  List<ItemModel> results = [];

  MovieListResponse(
      this.page, this.totalResults, this.totalPages, this.results);

  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MovieListResponseToJson(this);
}
