import 'package:flutter/material.dart';
import 'package:test5/Classes/Card.dart';
import 'package:test5/Widgets/MyCard.dart';

class HorizontalListView extends StatelessWidget {
  final List<Cardd> mycards = const [
    Cardd(str: "Business", img: 'assets/business.jpg', category: "business"),
    Cardd(str: "Health", img: 'assets/health1.jpg', category: "health"),
    Cardd(str: "Science", img: 'assets/science.avif', category: "science"),
    Cardd(str: "Sports", img: 'assets/spor.jpeg', category: 'sports'),
    Cardd(
        str: "Technology",
        img: 'assets/technology.jpeg',
        category: 'technology'),
  ];
  const HorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: mycards.length,
        itemBuilder: (context, index) {
          return MyCard(
            str: mycards[index].str,
            img: mycards[index].img,
            category: mycards[index].category,
          );
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
