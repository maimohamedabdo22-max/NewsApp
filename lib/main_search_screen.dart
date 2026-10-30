import 'package:flutter/material.dart';

import 'package:newsapp/search_result_screen.dart';

class MainSearchScreen extends StatelessWidget {
   MainSearchScreen({super.key});
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 56, horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                onFieldSubmitted: (value) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SearchResultScreen(query: value),
                    ),
                  );
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.clear();
                    },

                    child: Icon(Icons.cancel),
                  ),
                  filled: true,
                  fillColor: Color(0xffF0EFF0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xffCCCCCC)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Color(0xff0088ff)),
                  ),
                  hintText: "search",
                ),
              ),
            ),

            TextButton(
              onPressed: () {
                controller.clear();
              },
              child: Text("Cancel"),
            ),
          ],
        ),
      ),
    );
  }
}
