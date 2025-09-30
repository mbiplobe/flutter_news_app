import 'package:news_app/src/models/source_model.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';


@JsonSerializable(explicitToJson: true)
class Article {
  Source? source;
  String? author;
  String? title;
  String? description;
  Uri? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;

  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

   factory Article.fromJson(Map<String, dynamic> json) =>_$ArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleToJson(this);

String getTime()
{
  final now = DateTime.now();
  return DateFormat('d MMM yyyy').format(now); 
}


}
  