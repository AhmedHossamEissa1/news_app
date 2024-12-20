import 'package:flutter/material.dart';
import 'package:test5/Widgets/HorizontalListView.dart';
import 'package:test5/Widgets/logic_VeticalPosts.dart';
import 'package:test5/Widgets/myAppBar.dart';

class homePage extends StatelessWidget {
  final String search;
  const homePage({super.key, required this.search});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0), // Adjust the height as needed
        child: MyAppBar(), // Pass the search value if needed
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 110, // Set the height for the horizontal list
              child: HorizontalListView(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
                top: 20, left: 12, right: 12), // Add padding here
            sliver: logic_VeticalPosts(
              search: search, // Pass the search value
              category: "general",
            ),
          ),
        ],
      ),
    );
  }
}