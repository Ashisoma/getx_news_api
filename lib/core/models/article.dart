import 'package:json_annotation/json_annotation.dart';

part 'article.g.dart';

@JsonSerializable()
class Article {
  Article();

  @JsonKey(name: "author")
  late String author;

  @JsonKey(name: "title")
  late String title;

  @JsonKey(name: "description")
  late String description;

  @JsonKey(name: "urlToImage")
  late String urlToImage;

  @JsonKey(name: "url")
  late String url;

  @JsonKey(name: "publishedAt")
  late String publishedAt;

  @JsonKey(name: "content")
  late String? content;

  // CONVERT STRING TO DATE
  DateTime get getPublishedAtDate => DateTime.parse(publishedAt.toString());

  // BOILER PLATE CODE
  /*

  add the part ''; at the top of the file as shown abive example
  add the below code and edit to your class name
  run in the terminal flutter pub run build_runner build 

  --==== this generated the .g.dart file for a model
  */

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);

  /// Connect the generated [_$ArticleToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ArticleToJson(this);
}
