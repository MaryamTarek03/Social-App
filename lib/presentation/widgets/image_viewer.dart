import 'package:flutter/material.dart';

class ImageViewerPage extends StatelessWidget {
  final String image;

  const ImageViewerPage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InteractiveViewer(
        maxScale: 10,
        boundaryMargin: const EdgeInsets.all(double.infinity),
        child: Center(child: Image.network(image)),
      ),
    );
  }
}
