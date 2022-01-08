import 'package:aiapp/camera-filter.dart';
import 'package:aiapp/camera.dart';
import 'package:aiapp/camerakit.dart';
import 'package:aiapp/camerapage.dart';
import 'package:aiapp/filter.dart';
import 'package:aiapp/posedetection.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ElevatedButton(
          child: Text("pose"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PoseDetectionPage()),
            );
          },
        ),
        actions: [
          ElevatedButton(
            child: Text("filter"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Filter_page()),
              );
            },
          )
        ],
      ),
      body: Camkit(),
    );
  }
}
