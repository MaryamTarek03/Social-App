import 'package:connect_social_app/data/models/list_button_model.dart';
import 'package:connect_social_app/generated/l10n.dart';
import 'package:connect_social_app/presentation/widgets/common_text.dart';
import 'package:flutter/material.dart';

List<ListButtonModel> listButton = [
  ListButtonModel(
    title: Builder(builder: (context) {
      return CommonText(text: S.of(context).home);
    }),
    icon: const Icon(Icons.home),
  ),
  ListButtonModel(
    title: Builder(builder: (context) {
      return CommonText(text: S.of(context).profile);
    }),
    icon: const Icon(Icons.person),
  ),
  ListButtonModel(
    title: Builder(builder: (context) {
      return CommonText(text: S.of(context).friends);
    }),
    icon: const Icon(Icons.favorite),
  ),
  ListButtonModel(
    title: Builder(builder: (context) {
      return CommonText(text: S.of(context).settings);
    }),
    icon: const Icon(Icons.settings),
  ),
  ListButtonModel(
    title: Builder(builder: (context) {
      return CommonText(text: S.of(context).signOut);
    }),
    icon: const Icon(Icons.logout_outlined),
  ),
];
