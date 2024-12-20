class Postt {
  final String? img;
  final String str1;
  final String? str2;
  final String url;
  Postt(
      {required this.img,
      required this.str1,
      required this.str2,
      required this.url});

  factory Postt.fromjson(json) {
    return Postt(
        img: json['urlToImage'],
        str1: json['title'],
        str2: json['description'],
        url: json['url']);
  }
}
