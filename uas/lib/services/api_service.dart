import 'dart:convert';
import 'package:http/http.dart';
import 'package:uas/model/article_model.dart';

class ApiService{
  final endPointurl = "https://newsapi.org/v2/everything?q=Apple&from=2021-05-22&sortBy=popularity&apiKey=API_KEY";

  Future<List<Article>> getArticle() async {
    Response res = await get(endPointurl);

    if (res.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(res.body);

      List<dynamic> body = json['article'];

      List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();
      return articles;
    }else{
      throw("can't get the Articles");
    }
  }
}