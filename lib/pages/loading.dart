import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:what_to_do/services/bored_api.dart';

import 'activity.dart';

class Loading extends StatefulWidget {

  final BoredAPI activityApi;

  const Loading({Key? key, required this.activityApi}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  late String activity;

  void getActivity() async {
    await widget.activityApi.getActivity();
    activity = widget.activityApi.activity;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Activity(activity: activity),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getActivity();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[500],
      body: const Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
