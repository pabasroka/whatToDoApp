import 'package:flutter/material.dart';
import 'package:what_to_do/pages/activity.dart';
import 'package:what_to_do/services/bored_api.dart';

enum Types {
  recreational,
  relaxation,
  education,
  social,
  diy,
  charity,
  cooking,
  music,
  busywork
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  double price = 0.0;
  double accessibility = 0.0;
  int participants = 1;
  Types type = Types.recreational;
  late String activity;

  void getActivity() async {
    BoredAPI activityApi = BoredAPI(
        accessibility: accessibility,
        type: type.toString().substring(6),
        participants: participants,
        price: price);
    await activityApi.getActivity();
    activity = activityApi.activity;
    print(activity);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Activity(activity: activity),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Center(
            child: Column(
              children: <Widget>[
                const Text(
                  'SEARCH\n YOUR\n ACTIVITY',
                  style: TextStyle(
                    letterSpacing: 1.0,
                    fontFamily: 'GloriaHallelujah',
                    color: Colors.pink,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: <Widget>[
                    const Text(
                      'Price: ',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        fontFamily: 'GloriaHallelujah',
                        color: Colors.pink,
                        fontSize: 20.0,
                      ),
                    ),
                    Slider(
                      value: price,
                      onChanged: (newPrice) {
                        setState(() {
                          price = newPrice;
                        });
                      },
                      divisions: 10,
                      label: '$price',
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Participants: $participants',
                      style: const TextStyle(
                        letterSpacing: 1.0,
                        fontFamily: 'GloriaHallelujah',
                        color: Colors.pink,
                        fontSize: 20.0,
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (participants >= 1 && participants < 5) {
                            participants++;
                          }
                        });
                      },
                      child: const Text('+'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (participants > 1 && participants <= 5) {
                            participants--;
                          }
                        });
                      },
                      child: const Text('-'),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    const Text(
                      'Accessibility: ',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        fontFamily: 'GloriaHallelujah',
                        color: Colors.pink,
                        fontSize: 20.0,
                      ),
                    ),
                    Slider(
                      value: accessibility,
                      onChanged: (newAccessibility) {
                        setState(() {
                          accessibility = newAccessibility;
                        });
                      },
                      divisions: 10,
                      label: '$accessibility',
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    // Text('cos tam'),
                    Expanded(
                      child: ListTile(
                        title: const Text('recreational'),
                        leading: Radio<Types>(
                          value: Types.recreational,
                          groupValue: type,
                          onChanged: (newType) {
                            setState(() {
                              type = newType!;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('relaxation'),
                        leading: Radio<Types>(
                          value: Types.relaxation,
                          groupValue: type,
                          onChanged: (newType) {
                            setState(() {
                              type = newType!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: const Text('education'),
                        leading: Radio<Types>(
                          value: Types.education,
                          groupValue: type,
                          onChanged: (newType) {
                            setState(() {
                              type = newType!;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('social'),
                        leading: Radio<Types>(
                          value: Types.social,
                          groupValue: type,
                          onChanged: (newType) {
                            setState(() {
                              type = newType!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: const Text('busywork'),
                        leading: Radio<Types>(
                          value: Types.busywork,
                          groupValue: type,
                          onChanged: (newType) {
                            setState(() {
                              type = newType!;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('charity'),
                        leading: Radio<Types>(
                          value: Types.charity,
                          groupValue: type,
                          onChanged: (newType) {
                            setState(() {
                              type = newType!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        title: const Text('cooking'),
                        leading: Radio<Types>(
                          value: Types.cooking,
                          groupValue: type,
                          onChanged: (newType) {
                            setState(() {
                              type = newType!;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('music'),
                        leading: Radio<Types>(
                          value: Types.music,
                          groupValue: type,
                          onChanged: (newType) {
                            setState(() {
                              type = newType!;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('diy'),
                        leading: Radio<Types>(
                          value: Types.diy,
                          groupValue: type,
                          onChanged: (newType) {
                            setState(() {
                              type = newType!;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.arrow_back,
                              color: Colors.pink,
                            ),
                            Text(
                              'INFO',
                              style: TextStyle(
                                letterSpacing: 1.0,
                                fontFamily: 'GloriaHallelujah',
                                color: Colors.pink,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        )),
                    ElevatedButton(
                        onPressed: () {
                          // print(price);
                          // print(participants);
                          // print(accessibility);
                          // print(type.toString().substring(6));
                          getActivity();
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //       builder: (context) => Activity(price: price, participants: participants, accessibility: accessibility, type: type.toString().substring(6)),
                          // builder: (context) => Activity(activity: activity),
                          // ),
                          // );
                        },
                        child: Row(
                          children: const <Widget>[
                            Icon(
                              Icons.search,
                              color: Colors.pink,
                            ),
                            Text(
                              'SEARCH',
                              style: TextStyle(
                                letterSpacing: 1.0,
                                fontFamily: 'GloriaHallelujah',
                                color: Colors.pink,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
