import 'package:flutter/material.dart';
import 'package:test5/Widgets/appBarCards.dart';
import 'package:test5/Widgets/logic_VeticalPosts.dart';

class CardPage extends StatelessWidget {
  final String search;
  final String str;
  final String category;
  const CardPage({super.key, required this.str, required this.category, required this.search});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Adjust the height as needed
        child: Appbarcards(
          str: str,
        ),
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.only(
                top: 20, left: 12, right: 12), // Add padding here
            sliver: logic_VeticalPosts(
              search: search,
              category: category,
            ),
            
          ),
        ],
      ),
    );
  }
}
