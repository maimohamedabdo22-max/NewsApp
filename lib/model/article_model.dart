class ArticleModel {
  String? auther;
  String? titel;
  String? description;
  String? image;
  String? data;
  String? con;

  ArticleModel({
    this.auther,
    this.data,
    this.description,
    this.image,
    this.titel,
    this.con,
  });
  ArticleModel.fromJson(Map<String, dynamic> json) {
    auther = json['author'];
    image = json['urlToImage'];
    titel = json['title'];
    description = json['description'];
    data = json['publishedAt'];
    con = json['content'];
  }
}
