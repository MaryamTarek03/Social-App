import 'package:flutter/material.dart';

class ListButtonModel {
  final Widget title;
  final Widget icon;
  ListButtonModel({
    required this.title,
    required this.icon,
  });
}

class NotificationItem {
  final String imageUrl;
  final String name;
  final String action;
  final String target;
  final String time;
  final IconData icon;

  NotificationItem({
    required this.imageUrl,
    required this.name,
    required this.action,
    required this.target,
    required this.time,
    required this.icon,
  });
}


class Comment {
  final String name;
  final String content;
  final String avatarUrl;
  final String time;
  final int likes;
  final bool isResponse;

  Comment({
    required this.name,
    required this.content,
    required this.avatarUrl,
    required this.time,
    required this.likes,
    required this.isResponse,
  });
}