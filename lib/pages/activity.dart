import 'package:flutter/material.dart';
import 'package:what_to_do/services/bored_api.dart';

class Activity extends StatefulWidget {
  // final double? price;
  // final double? accessibility;
  // final int? participants;
  // final String? type;
  final String? activity;
  // const Activity({Key? key, this.price, this.accessibility, this.participants, this.type}) : super(key: key);
  const Activity({Key? key, this.activity}) : super(key: key);

  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {

  // late BoredAPI activity = BoredAPI(accessibility: widget.accessibility, type: widget.type, participants: widget.participants, price: widget.price);
  //
  // void getActivity() async {
  //   await activity.getActivity();
  //   print(activity.activity);
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   getActivity();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(
              children: <Widget>[
                Text('${widget.activity}'),
                ElevatedButton(
                  onPressed: () {
                    // getActivity();
                    Navigator.pop(context);
                  },
                  child: Text('wroc'),
                ),
              ],
            )
      ),
    ));
  }
}
