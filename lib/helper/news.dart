import 'dart:convert';
import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;
// import 'package:news_app/secret.dart';

class News {

  List<ArticleModel> news = [];

  Future<void> getNews() async {
    var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&apiKey=614606cadc5b461c86f40a7b6f27a413");

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok')
      {
        jsonData['articles'].forEach((element)
            {
              if(element['urlToImage'] != null  && element['description'] != null)
                {
                  ArticleModel articleModel = ArticleModel(
                    title: element["title"],
                    author: element["author"],
                    description: element["description"],
                    url: element["url"],
                    urlToImage: element["urlToImage"],
                    content: element["content"]
                  );

                  news.add(articleModel);
                }
            });
      }


  }

}

class CategoryNewsClass {

  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {
    var url = Uri.parse("https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=614606cadc5b461c86f40a7b6f27a413");

    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok')
    {
      jsonData['articles'].forEach((element)
      {
        if(element['urlToImage'] != null  && element['description'] != null)
        {
          ArticleModel articleModel = ArticleModel(
              title: element["title"],
              author: element["author"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"]
          );

          news.add(articleModel);
        }
      });
    }


  }

}