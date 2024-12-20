import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:test5/Classes/Post.dart';
import 'package:test5/Services/getdata.dart';
import 'package:test5/Widgets/VerticalPosts.dart';
import 'package:test5/Widgets/circileIndicaator.dart';
import 'package:test5/Widgets/errorMessage.dart';

class logic_VeticalPosts extends StatefulWidget {
  final String category;
  final String search; // Make search a required parameter

  // Constructor to accept the category and search keyword
  const logic_VeticalPosts({
    Key? key,
    required this.category,
    required this.search, // Make search required
  }) : super(key: key);

  @override
  State<logic_VeticalPosts> createState() => _logic_VeticalPostsState();
}

class _logic_VeticalPostsState extends State<logic_VeticalPosts> {
  late Future<List<Postt>> future; // Properly type the future

  @override
  void initState() {
    super.initState();
    // Access widget.category here
    future = GetData(dio: Dio()).GetNews(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Postt>>(
      future: future,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // Show loading indicator
          return myCircilarIndicator();
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          List<Postt> searchedlist = [];
          for (Postt post in snapshot.data!) {
            if (post.str1.contains(widget.search)) { // Use widget.search
              searchedlist.add(post);
            }
          }
          // Show posts if data is available
          return (searchedlist.isEmpty)
              ? VerticalPosts(myposts: snapshot.data!)
              : VerticalPosts(myposts: searchedlist);
        } else {
          // Show error message if no data is available or error occurs
          return errorMessage();
        }
      },
    );
  }
}
