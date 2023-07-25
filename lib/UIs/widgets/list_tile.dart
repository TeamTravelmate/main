import 'package:flutter/material.dart';
import 'package:main/Domain/models/user.dart';

Widget buildListTile(BuildContext context, User friend) {
  return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(friend.avatar),
      ),
      title: Text(friend.name),
      subtitle: Text(friend.email),
      trailing: IconButton(
          icon: const Icon(Icons.chat),
          onPressed: () {
          }));
}
