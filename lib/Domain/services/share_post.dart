import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'dart:math';
import 'dart:convert';

String generateRandomString(int length) {
  var random = Random.secure();
  var values = List<int>.generate(length, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

void sharePost(String postId) async {
  final String postUrl = 'https://mytripapp.com/post/$postId'; // Replace with post url
  final String randomString = generateRandomString(32);
  final String shareableLink = 'http://localhost:3000/post/share/$randomString';

  // Share the shareable link
  Share.share(shareableLink);

  // Or open the shareable link in a web browser
  // ignore: deprecated_member_use
  if (await canLaunch(postUrl)) {
    // ignore: deprecated_member_use
    await launch(postUrl);
  } else {
    throw 'Could not launch $postUrl';
  }
}
