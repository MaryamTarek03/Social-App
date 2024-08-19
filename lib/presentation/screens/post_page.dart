import 'package:connect_social_app/core/config/constants/numbers.dart';
import 'package:connect_social_app/core/config/constants/text_style.dart';
import 'package:connect_social_app/data/app_data.dart';
import 'package:connect_social_app/data/models/app_models.dart';
import 'package:connect_social_app/data/models/post_model.dart';
import 'package:connect_social_app/generated/l10n.dart';
import 'package:connect_social_app/presentation/widgets/custom/common_text.dart';
import 'package:connect_social_app/presentation/widgets/custom/image_loading.dart';
import 'package:connect_social_app/presentation/widgets/ui/image_viewer.dart';
import 'package:connect_social_app/presentation/widgets/post_mini_button.dart';
import 'package:connect_social_app/presentation/widgets/ui/post_header.dart';
import 'package:connect_social_app/core/utils/responsive.dart';
import 'package:flutter/material.dart';

class CommentScreen extends StatelessWidget {
  final PostModel post;
  const CommentScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: postAppBar(context),
        body: Responsive.isMobile(context)
            ? PostMainBody(post: post)
            : PostMainBody(post: post));
  }

  AppBar postAppBar(BuildContext context) {
    return AppBar(
      title: VibeText(
        text: S.of(context).postDetails,
        fontSize: Numbers.appBarTitleSize,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
    );
  }
}

class PostMainBody extends StatelessWidget {
  const PostMainBody({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                if (post.postImage != null && Responsive.isMobile(context))
                  PostImage(post: post),
                PostCard(post: post),
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
        ),
        const CommentInputField(),
      ],
    );
  }
}

class PostImage extends StatelessWidget {
  const PostImage({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ImageViewerPage(image: post.postImage!),
        ),
      ),
      child: Image.network(
        post.postImage!,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return SizedBox(
            height: 150,
            width: double.infinity,
            child: ImageLoading(loadingProgress: loadingProgress),
          );
        },
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
                    VibeText(text: comment.name),
                    const SizedBox(height: 8),
                    VibeText(text: comment.content),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            VibeText(
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
                            VibeText(
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
              PostHeader(post: post, name: 'Dan Walker'),
              const SizedBox(height: 30),
              VibeText(text: post.body),
              const SizedBox(height: 30),
              const Divider(height: 5),
              const SizedBox(height: Numbers.paddingSmall),
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
                  VibeText(
                    text: post.commentsNumber.toString(),
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                  VibeText(
                    text: ' ${S.of(context).comment}',
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     PostMiniButton(
              //       icon: const Icon(Icons.thumb_up_off_alt),
              //       text: 'Like',
              //       onPressed: () {},
              //     ),
              //     PostMiniButton(
              //       icon: const Icon(Icons.comment_outlined),
              //       text: 'Comment',
              //       onPressed: () {},
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class PostUserData extends StatelessWidget {
  const PostUserData({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              VibeText(text: 'Dan Walker'),
              const SizedBox(height: 2),
              VibeText(
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
            side:
                BorderSide(color: Theme.of(context).colorScheme.outlineVariant),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Numbers.radiusMedium),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: Numbers.paddingMedium),
            textStyle: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          child: VibeText(
            text: S.of(context).follow,
          ),
        ),
        const Icon(Icons.more_vert),
      ],
    );
  }
}

class CommentInputField extends StatelessWidget {
  const CommentInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Numbers.paddingMedium),
      color: Theme.of(context).colorScheme.background,
      child: Row(
        children: [
          const CircleAvatar(
            // backgroundImage: NetworkImage('link'), // Profile image
            radius: 25,
          ),
          const SizedBox(
            width: 8,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color of the input field
                borderRadius: BorderRadius.circular(Numbers.radiusLarge),
                // border: Border.all(color: Colors.grey.shade200, width: 1),
              ),
              child: Row(
                children: [
                  IconButton(
                    splashColor: Colors.black,
                    icon: Icon(
                      Icons.emoji_emotions_outlined,
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                    onPressed: () {
                      _showEmojiPicker(context);
                    },
                  ),
                  Expanded(
                    child: TextField(
                      style: englishStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: S.of(context).postCommentHintText,
                        hintStyle: Localizations.localeOf(context) ==
                                const Locale('en')
                            ? englishStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .outlineVariant)
                            : arabicStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .outlineVariant),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.all(Numbers.paddingMedium),
                      ),
                    ),
                  ),
                  IconButton(
                    splashColor: Colors.black,
                    color: Colors.black,
                    icon: Icon(
                      Icons.send,
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                    onPressed: () {},
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
