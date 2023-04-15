import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class ModelViewerWidget extends StatelessWidget {
  const ModelViewerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModelViewer(
      src: 'assets/Heart.glb',
      alt: "A 3D model of a heart",
      ar: true,
      autoRotate: true,
      cameraControls: true,
    );
  }
}
