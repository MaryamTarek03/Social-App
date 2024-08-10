import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:connect_social_app/data/app_data.dart';
import 'package:connect_social_app/data/models/app_models.dart';
import 'package:connect_social_app/data/models/post_model.dart';
import 'package:connect_social_app/presentation/widgets/common_text.dart';
import 'package:connect_social_app/presentation/widgets/post_mini_button.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatelessWidget {
  final PostModel post;
  const CommentScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CommonText(
          text: 'Post Details',
          fontSize: 20,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            PostCard(post: post),
            const CommentInputField(),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return CommentTile(comment: comments[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CommentTile extends StatelessWidget {
  final Comment comment;

  const CommentTile({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(comment.avatarUrl),
            radius: 25,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Card(
              shadowColor: Theme.of(context).colorScheme.outline,
              color: Theme.of(context).colorScheme.onBackground,
              surfaceTintColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonText(text: comment.name),
                    const SizedBox(height: 8),
                    CommonText(text: comment.content),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CommonText(
                              text: comment.time,
                              color:
                                  Theme.of(context).colorScheme.outlineVariant,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.favorite_border,
                              color:
                                  Theme.of(context).colorScheme.outlineVariant,
                            ),
                            const SizedBox(width: 5),
                            CommonText(
                              text: comment.likes.toString(),
                              color:
                                  Theme.of(context).colorScheme.outlineVariant,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.post});
  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Numbers.paddingMedium),
      child: Card(
        shadowColor: Theme.of(context).colorScheme.outline,
        color: Theme.of(context).colorScheme.onBackground,
        surfaceTintColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(Numbers.paddingMedium),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    // backgroundImage: AssetImage('link'),
                    radius: 25,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(text: 'Dan Walker'),
                        const SizedBox(height: 2),
                        CommonText(
                          text: post.date,
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.outlineVariant,
                        ),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 16),
                      textStyle:
                          const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    child: CommonText(
                      text: 'Follow',
                    ),
                  ),
                  const Icon(Icons.more_vert),
                ],
              ),
              const SizedBox(height: 30),
              CommonText(text: post.body),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PostMiniButton(
                    icon: const Icon(Icons.favorite_border),
                    text: post.likesNumber.toString(),
                    onPressed: () {},
                  ),
                  PostMiniButton(
                    icon: const Icon(Icons.chat_bubble_outline),
                    text: post.commentsNumber.toString(),
                    onPressed: () {},
                  ),
                  const Spacer(),
                  CommonText(
                    text: post.commentsNumber.toString(),
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  CommonText(
                    text: ' comments',
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ],
              ),
              const Divider(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PostMiniButton(
                    icon: const Icon(Icons.thumb_up_off_alt),
                    text: 'Like',
                    onPressed: () {},
                  ),
                  PostMiniButton(
                    icon: const Icon(Icons.comment_outlined),
                    text: 'Comment',
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CommentInputField extends StatelessWidget {
  const CommentInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.grey.shade50,
      child: Row(
        children: [
          const CircleAvatar(
            // backgroundImage: NetworkImage('link'), // Profile image
            radius: 20,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the input field
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.grey.shade200, width: 1),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add a comment...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.emoji_emotions_outlined),
                    onPressed: () {
                      _showEmojiPicker(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showEmojiPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 250, // Height of the emoji picker
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.emoji_emotions),
                title: const Text('SMILEYS & PEOPLE'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              // Add more emoji picker items here
            ],
          ),
        );
      },
    );
  }
}
