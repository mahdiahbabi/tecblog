
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
    image = ConstantUrl.hostDlUrl + element["image"];
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
    poster = ConstantUrl.hostDlUrl+element["poster"];
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
     this.id,
     this.title,
     this.image,
  });

  PosterModel.fromjson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = ConstantUrl.hostDlUrl+element["image"];
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


class ArticleInfoModel{

  String? id ;
  String? title;
  String? content;
  String? image;
  String? cat_id;
  String? cat_name;
  String? author;
  String? view;
  String? status;
  String? created_at;
  bool?  isFavorite;



  ArticleInfoModel({
     this.id,
     this.title,
     this.content,
     this.image,
     this.cat_id,
     this.cat_name,
     this.author,
     this.view,
     this.status,
     this.created_at,
     this.isFavorite,


});

  ArticleInfoModel.fromjson(Map<String , dynamic> element){

    id = element['info']['id'];
    title = element['info']['title'];
    content = element['info']['content'];
    image = ConstantUrl.hostDlUrl+element['info']['image'];
    cat_id = element['info']['cat_id'];
    cat_name = element['info']['cat_name'];
    author = element['info']['author'];
    view = element['info']['view'];
    status = element['info']['status'];
    created_at = element['info']['created_at'];
   isFavorite = element['isFavorite'];

  }



}

class ArticleInfoRelated{
  String? related_id;
  String? related_title;
  String? related_image;
  String? related_cat_id;
  String? related_cat_name;
  String? related_author;
  String? related_view;
  String? related_status;
  String? related_created_at;


  ArticleInfoRelated({

    this.related_id,
    this.related_title,
    this.related_image,
    this.related_cat_id,
    this.related_cat_name,
    this.related_author,
    this.related_view,
    this.related_status,
    this.related_created_at,
});
  ArticleInfoRelated.fromjson(Map<String, dynamic> element){
    related_id = element['related']['id'];
    related_title = element['related']['title'];
    related_image = ConstantUrl.hostDlUrl+element['related']['image'];
    related_cat_id = element['related']['cat_id'];
    related_cat_name = element['related']['cat_name'];
    related_author = element['related']['author'];
    related_view = element['related']['view'];
    related_status = element['related']['status'];
    related_created_at = element['related']['created_at'];

  }
}

class ArticleInfoTags{
  String? tags_id;
  String? tags_title;


  ArticleInfoTags({

    this.tags_id,
    this.tags_title,
});
  ArticleInfoTags.fromjson(Map<String , dynamic> element){
    tags_id =element['tags']['id'];
    tags_title= element['tags']['title'];
  }

}
