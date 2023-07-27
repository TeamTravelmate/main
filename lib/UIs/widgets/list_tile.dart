import 'package:flutter/material.dart';
import 'package:main/Domain/models/user.dart';
import 'package:main/UIs/widgets/button_widget.dart';

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

Widget buildFollowerTile(BuildContext context, User follower){
  return ListTile(
    leading: CircleAvatar(
        backgroundImage: NetworkImage(follower.avatar),
      ),
      title: Text(follower.name),
      subtitle: Text(follower.email),
      trailing: buttonWidget(
        labelText: 'Follow Back',
        onPressed: () {},
        width: 90,
        height: 30,
        fontSize: 13,
        path: 'follow',
      )
  );
}
