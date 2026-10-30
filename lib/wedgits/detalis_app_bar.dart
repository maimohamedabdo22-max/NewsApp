import 'package:flutter/material.dart';
import 'package:newsapp/wedgits/CirclrIcons.dart';

class DetalisAppBar extends StatelessWidget  implements PreferredSizeWidget{
  const DetalisAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 50,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: CircleIcons(icon: Icons.arrow_back_ios_new_rounded),
      ),
      title: Text(
        "News Detalis",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [CircleIcons(icon: Icons.bookmark_border_rounded)],
    );
  }

  @override
 
  Size get preferredSize =>Size.fromHeight(56) ;
}
