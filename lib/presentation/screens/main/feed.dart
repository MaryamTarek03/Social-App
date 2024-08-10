import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:connect_social_app/data/models/post_model.dart';
import 'package:connect_social_app/presentation/screens/post_page.dart';
import 'package:connect_social_app/presentation/widgets/post.dart';
import 'package:flutter/material.dart';
import 'dart:math';

List months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

PostModel generateRandomPost() {
  final random = Random();
  DateTime randomDate = DateTime.now().subtract(
    Duration(
      days: random.nextInt(365),
      hours: random.nextInt(24),
      minutes: random.nextInt(60),
    ),
  );
  String time = (randomDate.hour % 12 == randomDate.hour) ? 'AM' : 'PM';
  String date =
      '${randomDate.day} ${months[randomDate.month - 1]} ${randomDate.year} • ${randomDate.hour % 12}:${randomDate.minute} $time';
  return PostModel(
    postID: random.nextInt(1000),
    userID: random.nextInt(100),
    likesNumber: random.nextInt(1000),
    commentsNumber: random.nextInt(1000),
    postImage: 'https://example.com/image${random.nextInt(100)}.jpg',
    body: 'This is a random post body ${random.nextInt(1000)}',
    date: date,
  );
}

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Numbers.paddingMedium),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          PostModel randomPost = generateRandomPost();
          return Padding(
            padding: const EdgeInsets.only(top: Numbers.paddingLarge),
            child: InkWell(
              borderRadius: BorderRadius.circular(Numbers.radiusMedium),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CommentScreen(
                    post: randomPost,
                  ),
                ),
              ),
              child: Post(post: randomPost,),
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}
