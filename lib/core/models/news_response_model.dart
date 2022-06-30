import 'package:getx_news_api/core/models/article.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_response_model.g.dart';

@JsonSerializable()
class NewsReponse {
  NewsReponse();

  @JsonKey(name: "status")
  late String status;

  @JsonKey(name: "totalResults")
  late int totalResults;

  @JsonKey(name: "articles")
  late List<Article> articles;

  factory NewsReponse.fromJson(Map<String, dynamic> json) =>
      _$NewsReponseFromJson(json);

  /// Connect the generated [_$NewsReponseToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$NewsReponseToJson(this);
}
