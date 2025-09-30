import 'package:news_app/src/models/article_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_response_model.g.dart';

@JsonSerializable(explicitToJson: true)
class NewsApiResonse {
  String? status;
  int? totalResults;
  List<Article>? articles;

  NewsApiResonse({
     this.status,
   this.totalResults,
    this.articles,
  });

    factory NewsApiResonse.fromJson(Map<String, dynamic> json) =>_$NewsApiResonseFromJson(json);

  Map<String, dynamic> toJson() => _$NewsApiResonseToJson(this);


  
}

