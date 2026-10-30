import 'package:flutter/material.dart';
import 'package:newsapp/model/article_model.dart';

import 'package:newsapp/wedgits/detalis_app_bar.dart';

class DetaliesScreen extends StatelessWidget {
  const DetaliesScreen({super.key, required this.model});

  final ArticleModel model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAF9F9),
      appBar:DetalisAppBar() ,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(20),
              child: Image.network(
                model.image ??
                    "https://th.bing.com/th/id/OIP.Cbepn0SAKri0wBo1AqAoUwHaHa?w=138&h=180&c=7&r=0&o=7&dpr=1.3&pid=1.7&rm=3",
                    errorBuilder: (context, error, stackTrace) {
                                      return Icon(
                                        Icons.image,
                                        color: Colors.red,
                                      );
                                    },
              ),
            ),
            SizedBox(height: 4),
            Text(
              model.auther ?? "auther",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight(600)),
            ),
            SizedBox(height: 6),

            Text(
              model.data ?? "date",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight(600)),
            ),
            SizedBox(height: 10),
            Text(
              model.description ?? "description",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight(600)),
            ),
            SizedBox(height: 35),
            Text(
              model.con ?? "Content",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight(500)),
            ),
          ],
        ),
      ),
    );
  }
}
