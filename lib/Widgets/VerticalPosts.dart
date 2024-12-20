import 'package:flutter/material.dart';
import 'package:test5/Classes/Post.dart';
import 'package:test5/Widgets/MyPost.dart';


class VerticalPosts extends StatelessWidget {
  final List<Postt> myposts;
  const VerticalPosts({super.key, required this.myposts});



  @override
  Widget build(BuildContext context) {
    return  SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: myposts.length,
              (context, index) {
                return MyPost(
                  img: myposts[index].img !,
                      // 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930',
                  str1: myposts[index].str1,
                  str2: myposts[index].str2 ?? '',
                  url:myposts[index].url  ,
                );
              },
            ),
          );
  }
}
