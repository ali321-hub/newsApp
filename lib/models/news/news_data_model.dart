import 'dart:convert';
class NewsDataModel {
  Source? source;
  String? author;
  String? name;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsDataModel(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  NewsDataModel.fromJson(Map<String, dynamic> jsonNews) {
    
    source =
        jsonNews['source'] != null ? new Source.fromJson(jsonNews['source']) : null;
    author = jsonNews['author'];
    title = jsonNews['title'];
    description = jsonNews['description'];
    url = jsonNews['url'];
    urlToImage = jsonNews['urlToImage'];
    publishedAt = jsonNews['publishedAt'];
    name = jsonNews['name'];
    content = jsonNews['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.source != null) {
      data['source'] = this.source!.toJson();
    }
    data['author'] = this.author;
    data['title'] = this.title;
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlToImage'] = this.urlToImage;
    data['publishedAt'] = this.publishedAt;
    data['content'] = this.content;
    return data;
  }
}
class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}