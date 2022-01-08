import 'package:aiapp/camera.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class filcam extends StatefulWidget {
  @override
  filcamState createState() => filcamState();
}

class filcamState extends State<filcam> {
  dynamic _scanResults;
  late CameraController _camera;

  bool _isDetecting = false;
  CameraLensDirection _direction = CameraLensDirection.back;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<CameraDescription> _getCamera(CameraLensDirection dir) async {
    return await availableCameras().then(
      (List<CameraDescription> cameras) => cameras.firstWhere(
        (CameraDescription camera) => camera.lensDirection == dir,
      ),
    );
  }

  void _initializeCamera() async {
    _camera = CameraController(
      await _getCamera(_direction),
      defaultTargetPlatform == TargetPlatform.android
          ? ResolutionPreset.low
          : ResolutionPreset.medium,
    );
    await _camera.initialize();
    _camera.startImageStream((CameraImage image) {
      print("done");
      print(image);

      if (_isDetecting) return;
      _isDetecting = true;
      CameraPreview(_camera);
      print(image);

      // print("done");
      try {
        // print("do ne");
        CameraPreview(_camera);
        // NetworkImage(image);
        print(image);
        // await doSomethingWith(image)
      } catch (e) {
        // await handleExepction(e)
      } finally {
        _isDetecting = false;
      }
    });
  }

  Widget build(BuildContext context) {
    return Text("${_isDetecting}");
  }
}
