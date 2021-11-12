import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getSampleActivityData() async {
    //TODO: Delete Future.delayd, add sample activity api request
    await Future.delayed(Duration(seconds: 0), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void initState() {
    super.initState();
    getSampleActivityData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
