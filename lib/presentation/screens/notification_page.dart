import 'package:connect_social_app/presentation/widgets/common_text.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CommonText(
        text: 'N O T I F I C A T I O N S',
        fontSize: 32,
      ),
    );
  }
}
