import 'package:flutter/material.dart';
class CircularProgress extends StatefulWidget {
  const CircularProgress({Key? key}) : super(key: key);

  @override
  _CircularProgressState createState() => _CircularProgressState();
}

class _CircularProgressState extends State<CircularProgress> {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 10,
      backgroundColor: Colors.yellowAccent,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
    );
  }
}
