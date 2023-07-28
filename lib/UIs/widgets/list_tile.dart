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
            Navigator.of(context).push(chatPageRoute(friend));
          }));
}

Widget buildFollowerTile(BuildContext context, User follower) {
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
      ));
}

Widget buildFollowingTile(BuildContext context, User following) {
  return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(following.avatar),
      ),
      title: Text(following.name),
      subtitle: Text(following.email),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          buttonWidget(
            labelText: 'Unfollow',
            onPressed: () {
              //TODO: implement unfollow
            },
            width: 90,
            height: 30,
            fontSize: 13,
            path: 'unfollow',
          ),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(chatPageRoute(following));
              },
              icon: const Icon(Icons.chat)),
        ],
      ));
}

//tile for chat list
//shows the friend's avatar, name, and latest message
Widget buildChatTile(BuildContext context, User friend) {
  return ListTile(
    leading: CircleAvatar(
      backgroundImage: NetworkImage(friend.avatar),
    ),
    title: Text(friend.name),
    subtitle: Text('Latest message'),
    trailing: Text(TimeOfDay.now().format(context)),
    onTap: () {
      Navigator.of(context).push(chatPageRoute(friend));
    },
  );
}

chatPageRoute(User friend) {
  return MaterialPageRoute(
    builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(friend.name),
        ),
        body: const Center(
          child: Text('Chat messages'),
        ),
      );
    },
  );
}
