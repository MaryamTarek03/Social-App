import 'package:connect_social_app/data/models/list_button_model.dart';
import 'package:connect_social_app/presentation/widgets/material_button.dart';
import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {
  final Function() onPressed;

  const ListButton({
    super.key,
    required this.listButton,
    required this.onPressed,
  });

  final ListButtonModel listButton;

  @override
  Widget build(BuildContext context) {
    return MyMaterialButton(
      onPressed: onPressed,
      child: ListTile(
        title: listButton.title,
        leading: listButton.icon,
      ),
    );
  }
}
