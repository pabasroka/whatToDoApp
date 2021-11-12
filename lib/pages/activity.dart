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
        backgroundColor: Colors.teal[200],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Text(
                    'Your activity:\n\n ${widget.activity}',
                  style: TextStyle(
                    letterSpacing: 2.0,
                    fontFamily: 'GloriaHallelujah',
                    color: Colors.teal[900],
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                  ),
                ),
                const SizedBox(height: 150.0),
                Center(
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.teal),
                    ),
                    onPressed: () {
                      // getActivity();
                      var nav = Navigator.of(context);
                      nav.pop();
                      nav.pop();
                      // Navigator.pop(context);
                    },
                    child: const Text(
                      'Find again',
                      style: TextStyle(
                        letterSpacing: 2.0,
                        fontFamily: 'GloriaHallelujah',
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
