import 'package:hive_flutter/hive_flutter.dart';
part 'article.g.dart';

@HiveType(typeId: 0)
class News {
  @HiveField(0)
  String? status;
  @HiveField(1)
  int? totalResults;
  // int? totalPages;
  @HiveField(2)
  List<Articles>? articles;
  // Support? support;

  News({
    this.status,
    // this.perPage,
    this.totalResults,
    // this.totalPages,
    this.articles,
    // this.support
  });

  News.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    // perPage = json['per_page'];
    totalResults = json['totalResults'];
    // totalPages = json['total_pages'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles!.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    // data['per_page'] = this.perPage;
    data['totalResults'] = this.totalResults;
    // data['total_pages'] = this.totalPages;
    if (this.articles != null) {
      data['articles'] = this.articles!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

@HiveType(typeId: 1)
class Articles {
  // int? id;
  @HiveField(0)
  String? author;
  @HiveField(1)
  String? url;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? description;
  @HiveField(4)
  String? urlToImage;
  @HiveField(5)
  String? content;
  @HiveField(6)
  Source? source;
  @HiveField(7)
  DateTime? publishedAt;

  Articles(
      {
      // this.id,
      this.author,
      this.title,
      this.description,
      this.urlToImage,
      this.source,
      this.content,
      this.publishedAt,
      this.url});

  Articles.fromJson(Map<String, dynamic> json) {
    // id = json['id'];
    author = json['author'];
    url = json['url'];

    title = json['title'];
    description = json['description'];
    urlToImage = json['urlToImage'];
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    content = json['content'];
    publishedAt = DateTime.parse(json['publishedAt']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> articles = new Map<String, dynamic>();
    // articles['id'] = this.id;
    articles['author'] = this.author;
    articles['url'] = this.url;
    articles['title'] = this.title;
    articles['description'] = this.description;
    articles['urlToImage'] = this.urlToImage;
    if (this.source != null) {
      articles['source'] = this.source!.toJson();
    }
    articles['content'] = this.content;
    articles['publishedAt'] = this.publishedAt!.toIso8601String();
    return articles;
  }
}

@HiveType(typeId: 2)
class Source {
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> source = new Map<String, dynamic>();
    source['id'] = this.id;
    source['name'] = this.name;
    return source;
  }
}
