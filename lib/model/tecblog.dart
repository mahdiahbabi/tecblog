import 'package:tecblog/component/my_string.dart';

import '../component/constanturl.dart';

class ArticleModel {
  String? id;
  String? title;
  String? image;
  String? cat_id;
  String? cat_name;
  String? author;
  String? view;
  String? status;
  String? created_at;

  ArticleModel({
    required this.id,
    required this.title,
     this.image,
    required this.cat_id,
    required this.cat_name,
    required this.author,
    required this.view,
    required this.status,
    required this.created_at,
  });

  ArticleModel.fromjson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = ConstantUrl.baseUrl+element["image"];
    cat_id = element["cat_id"];
    cat_name = element["cat_name"];
    author = element["author"];
    view = element["view"];
    status = element["status"];
    created_at = element["created_at"];
  }
}

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? cat_name;
  String? author;
  String? view;
  String? status;
  String? created_at;

  PodcastModel({
    required this.id,
    required this.title,
    required this.cat_name,
    required this.author,
    required this.view,
    required this.status,
    required this.created_at,
  });

  PodcastModel.fromjson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    poster = ConstantUrl.baseUrl+element["poster"];
    cat_name = element["cat_name"];
    author = element["author"];
    view = element["view"];
    status = element["status"];
    created_at = element["created_at"];
  }
}

class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({
    required this.id,
    required this.title,
    required this.image,
  });

  PosterModel.fromjson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = element["image"];
  }
}

class TagsModel{
  String? id;
  String? title;


  TagsModel({
    required this.id,
    required this.title,
  });

  TagsModel.fromjson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];

  }
}
