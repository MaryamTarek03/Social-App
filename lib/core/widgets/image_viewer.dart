import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageViewerPage extends StatelessWidget {
  final String image;

  final TransformationController _transformationController =
      TransformationController();
  late TapDownDetails _doubleTapDetails;

  ImageViewerPage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onDoubleTapDown: (tapDownDetails) => _doubleTapDetails = tapDownDetails,
        onDoubleTap: () {
          if (_transformationController.value != Matrix4.identity()) {
            _transformationController.value = Matrix4.identity();
          } else {
            final position = _doubleTapDetails.localPosition;
            _transformationController.value = Matrix4.identity()
              ..translate(-position.dx * 2, -position.dy * 2)
              ..scale(3.0);
          }
        },
        child: InteractiveViewer(
          maxScale: 10,
          minScale: 1,
          transformationController: _transformationController,
          boundaryMargin: const EdgeInsets.all(double.infinity),
          child: Center(child: Image.network(image)),
        ),
      ),
    );
  }
}
