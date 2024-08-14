import 'package:connect_social_app/data/models/app_models.dart';
import 'package:connect_social_app/generated/l10n.dart';
import 'package:connect_social_app/presentation/widgets/custom/common_text.dart';
import 'package:flutter/material.dart';

List<ListButtonModel> listButton = [
  ListButtonModel(
    title: Builder(builder: (context) {
      return VibeText(text: S.of(context).home);
    }),
    icon: const Icon(Icons.home),
  ),
  ListButtonModel(
    title: Builder(builder: (context) {
      return VibeText(text: S.of(context).profile);
    }),
    icon: const Icon(Icons.person),
  ),
  ListButtonModel(
    title: Builder(builder: (context) {
      return VibeText(text: S.of(context).friends);
    }),
    icon: const Icon(Icons.favorite),
  ),
  ListButtonModel(
    title: Builder(builder: (context) {
      return VibeText(text: S.of(context).settings);
    }),
    icon: const Icon(Icons.settings),
  ),
  ListButtonModel(
    title: Builder(builder: (context) {
      return VibeText(text: S.of(context).signOut);
    }),
    icon: const Icon(Icons.logout_outlined),
  ),
];

final List<NotificationItem> notifications = [
  NotificationItem(
    imageUrl: ' ',
    name: 'David Kim',
    action: 'commented on',
    target: 'your post',
    time: '30 minutes ago',
    icon: Icons.mode_comment_outlined,
  ),
  NotificationItem(
    imageUrl: ' ',
    name: 'Daniel Wellington',
    action: 'liked',
    target: 'your profile',
    time: '43 minutes ago',
    icon: Icons.favorite_border_outlined,
  ),
  NotificationItem(
    imageUrl: ' ',
    name: 'Stella Bergmann',
    action: 'shared a',
    target: 'New video on your wall',
    time: 'Yesterday',
    icon: Icons.video_library_outlined,
  ),
  NotificationItem(
    imageUrl: ' ',
    name: 'Elise Walker',
    action: 'shared an',
    target: 'Image with you an 2 other people',
    time: '2 days ago',
    icon: Icons.image_outlined,
  ),
  NotificationItem(
    imageUrl: ' ',
    name: 'Daniel Wellington',
    action: 'liked',
    target: 'your profile',
    time: '43 minutes ago',
    icon: Icons.favorite_border_outlined,
  ),
  NotificationItem(
    imageUrl: ' ',
    name: 'David Kim',
    action: 'commented on',
    target: 'your post',
    time: '30 minutes ago',
    icon: Icons.mode_comment_outlined,
  ),
  NotificationItem(
    imageUrl: ' ',
    name: 'Elise Walker',
    action: 'shared an',
    target: 'Image with you an 2 other people',
    time: '2 days ago',
    icon: Icons.image_outlined,
  ),
  NotificationItem(
    imageUrl: ' ',
    name: 'Daniel Wellington',
    action: 'liked',
    target: 'your profile',
    time: '43 minutes ago',
    icon: Icons.favorite_border_outlined,
  ),
];

final List<Comment> comments = List.generate(
  10,
  (index) => index % 2 == 0
      ? Comment(
          name: 'Dan Walker',
          content:
              'Lorem ipsum dolor sit amet Lorem ipsum dolor sit amet, consectetur adipiscing, consectetur adipiscing elit. Proin ornare magna eros.',
          avatarUrl: 'link',
          time: '28m',
          likes: 2,
          isResponse: false,
        )
      : Comment(
          name: 'David Kim',
          content:
              'Lorem ipsum dolor sit amet, consectetur adipiscing Lorem ipsum dolor sit amet, consectetur adipiscing.',
          avatarUrl: 'link',
          time: '15m',
          likes: 0,
          isResponse: true,
        ),
);
