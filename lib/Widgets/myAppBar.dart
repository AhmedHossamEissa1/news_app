import 'package:flutter/material.dart';
import 'package:test5/Screens/home_page.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "News",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text(
                "Cloud",
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          SizedBox(
              width: 20), // Add some space between the text and search field
          Expanded(
            child: TextField(
              onSubmitted: (value) {
                // Use Navigator.push to navigate to the homePage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => homePage(search: value),
                  ),
                );
              },
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                ),
                hintText: "search..",
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey, width: 1.5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}