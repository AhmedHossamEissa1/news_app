import 'package:flutter/material.dart';

class myCircilarIndicator extends StatelessWidget {
  const myCircilarIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
            child: Center(
              child: SizedBox(
                width: 75,
                height: 75,
                child: CircularProgressIndicator(
                  strokeWidth:
                      5.0, // Optional, adjust the thickness of the circle
                ),
              ),
            ),
          );
  }
}