import 'package:flutter/material.dart';
import 'package:test5/Screens/card_page.dart';

class MyCard extends StatelessWidget {
  final String str;
  final String img;
  final String category;

  const MyCard(
      {super.key,
      required this.str,
      required this.img,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 15),
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CardPage(
                category: category,
                str: str, search: '',
              ), // Ensure BuisnessPage is imported correctly.
            ),
          ),
          child: Container(
            child: Center(
              child: Text(
                str,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            width: 180,
            height: 110,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      img,
                    ))),
          ),
        ));
  }
}
