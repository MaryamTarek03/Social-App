import 'package:flutter/material.dart';

class ImageLoading extends StatelessWidget {
  final ImageChunkEvent loadingProgress;
  const ImageLoading({
    super.key,
    required this.loadingProgress,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).colorScheme.primary,
        value: loadingProgress.expectedTotalBytes != null
            ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
            : null,
      ),
    );
  }
}