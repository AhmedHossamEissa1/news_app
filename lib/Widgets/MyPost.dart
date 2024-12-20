import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test5/Screens/webview_page.dart';

class MyPost extends StatelessWidget {
  final String img;
  final String str1;
  final String str2;
  final String url;

  const MyPost({
    super.key,
    required this.img,
    required this.str1,
    required this.str2,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () {
                // Navigate to a new page with WebView when the image is clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        WebViewPage(url: url), // Define your URL here
                  ),
                );
              },
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: img,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) =>
                      Image.asset('assets/null_image.jpg'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5, top: 5),
              child: Text(
                str1,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Text(
              str2,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.grey,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
