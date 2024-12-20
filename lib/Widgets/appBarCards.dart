import 'package:flutter/material.dart';
import 'package:test5/Screens/card_page.dart';

class Appbarcards extends StatelessWidget {
  const Appbarcards({super.key, required this.str});
  final String str;

  @override
  Widget build(BuildContext context) {
    return AppBar(
       leading: IconButton(
            icon: Icon(Icons.arrow_back), // The back arrow icon
            onPressed: () {
              Navigator.pop(context); // Navigates back to the previous page (homepage)
            },),
      title: DefaultTextStyle(
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust layout
          children: [
            // First part: title
            Row(
              children: [
                Text(
                  str,
                  style: const TextStyle(color: Colors.black),
                ),
                const Text(
                  "News",
                  style: TextStyle(color: Colors.orange),
                ),
              ],
            ),
            const SizedBox(width: 10), // Space between text and TextField

            // Second part: Search TextField
            Expanded(
              // Expands the TextField to take up available width
              child: TextField(
                onSubmitted: (value) {
                  // Use Navigator.push to navigate to the CardPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          CardPage(str: str, category: str, search: value),
                    ),
                  );
                },
                decoration: InputDecoration(
                  suffixIcon: const Icon(
                    Icons.search,
                  ),
                  hintText: "search..",
                  hintStyle: const TextStyle(color: Colors.grey),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: Colors.grey, width: 1.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white, // Optional: Set AppBar background color
    );
  }
}
