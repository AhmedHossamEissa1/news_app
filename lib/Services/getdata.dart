import 'package:dio/dio.dart';
import 'package:test5/Classes/Post.dart';

class GetData {
  List<dynamic> articles = [];
  final Dio dio;
  List<Postt> myposts = [];

  GetData({required this.dio});

  Future<List<Postt>> GetNews(String category) async {
    try {
      Response? response;

      // Perform the API request based on the category

      response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=6c48534e81ee40f98aec52f00dbcb6b6&category=$category');

      // Ensure that the response is a valid JSON object
      if (response != null && response.data is Map<String, dynamic>) {
        Map<String, dynamic> jsonData = response.data;

         articles = jsonData['articles'];

        for (var article in articles) {
          if (article['urlToImage'] == null) {
            continue;
          }
          Postt post = Postt.fromjson(article);
          myposts.add(post);
        }
      }

      return myposts;
    } catch (e) {
      print("Error occurred: $e");
      return [];
    }
  }

Future<List<Postt>> postsOfSpecificWord(String word) async {
  // Convert the search word to lowercase for case-insensitive comparison
  String searchWord = word.toLowerCase();

  // Create a list to store posts that match the search word
  List<Postt> filteredPosts = [];

  for (var post in myposts) {
    // Convert the title (str1) to lowercase for case-insensitive comparison
    String title = post.str1.toLowerCase();

    // Check if the search word is contained in the title
    if (title.contains(searchWord)) {
      filteredPosts.add(post);
    }
  }

  // Return the list of filtered posts
  return filteredPosts;
}

}
