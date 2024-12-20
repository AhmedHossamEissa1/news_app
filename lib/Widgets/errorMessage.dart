import 'package:flutter/material.dart';

class errorMessage extends StatelessWidget {
  const errorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
                children: [
                  Text(
                    "Oops, There is an error",
                    style: TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10), // Add some space between texts
                  Text(
                    "Try later please",
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}