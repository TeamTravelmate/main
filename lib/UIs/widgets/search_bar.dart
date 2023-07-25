import 'package:flutter/material.dart';

Widget buildSearchBar(BuildContext context, TextEditingController controller, Function filterFriends) {

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      textInputAction: TextInputAction.search,
      controller: controller,
      onChanged: (value) {
        filterFriends(value);
      },
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    ),
  );
}