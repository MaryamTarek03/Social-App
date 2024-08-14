import 'package:connect_social_app/data/models/post_model.dart';
import 'package:connect_social_app/presentation/widgets/custom/common_text.dart';
import 'package:flutter/material.dart';

class PostHeader extends StatelessWidget {
  final String name;

  const PostHeader({
    super.key,
    required this.post,
    required this.name,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      leading: const CircleAvatar(),
      title: VibeText(text: name),
      subtitle: VibeText(
        text: post.date,
        fontSize: 12,
        color: Theme.of(context).colorScheme.outlineVariant,
      ),
      trailing: const Icon(Icons.more_vert_rounded),
    );
  }
}
