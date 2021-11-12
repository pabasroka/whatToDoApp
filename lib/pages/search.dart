import 'package:flutter/material.dart';
import 'package:what_to_do/pages/activity.dart';
import 'package:what_to_do/services/bored_api.dart';
import 'package:what_to_do/pages/loading.dart';

enum Types {
  all,
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
  Types type = Types.all;
  late String activity;
  bool isPrice = false;
  bool isParticipants = false;
  bool isAccessibility = false;

  void getActivity() async {
    double? accessibilityToApi = isAccessibility ? accessibility : null;
    String typeToApi = type.toString().substring(6);
    int? participantsToApi = isParticipants ? participants : null;
    double? priceToApi = isPrice ? price : null;

    BoredAPI activityApi = BoredAPI(
        accessibility: accessibilityToApi,
        type: typeToApi,
        participants: participantsToApi,
        price: priceToApi);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Loading(activityApi: activityApi),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[200],
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                    'SEARCH YOUR\n ACTIVITY',
                    style: TextStyle(
                      letterSpacing: 5.0,
                      fontFamily: 'GloriaHallelujah',
                      color: Colors.teal[900],
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        fillColor: MaterialStateColor.resolveWith((states) => Colors.teal),
                        value: isPrice,
                        onChanged: (bool? value) {
                          setState(() {
                            isPrice = value!;
                          });
                        },
                      ),
                      Text(
                        'Price: ',
                        style: TextStyle(
                          letterSpacing: 2.0,
                          fontFamily: 'GloriaHallelujah',
                          color: Colors.teal[900],
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                      Slider(
                        activeColor: Colors.teal[500],
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
                      Checkbox(
                        fillColor: MaterialStateColor.resolveWith((states) => Colors.teal),
                        value: isAccessibility,
                        onChanged: (bool? value) {
                          setState(() {
                            isAccessibility = value!;
                          });
                        },
                      ),
                      Text(
                        'Accessibility: ',
                        style: TextStyle(
                          letterSpacing: 2.0,
                          fontFamily: 'GloriaHallelujah',
                          color: Colors.teal[900],
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                      ),
                      Slider(
                        activeColor: Colors.teal[500],
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
                      Checkbox(
                        fillColor: MaterialStateColor.resolveWith((states) => Colors.teal),
                        value: isParticipants,
                        onChanged: (bool? value) {
                          setState(() {
                            isParticipants = value!;
                          });
                        },
                      ),
                      Text(
                        'Participants: $participants',
                        style: TextStyle(
                          letterSpacing: 2.0,
                          fontFamily: 'GloriaHallelujah',
                          color: Colors.teal[900],
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                        ),
                        onPressed: () {
                          setState(() {
                            if (participants >= 1 && participants < 5) {
                              participants++;
                            }
                          });
                        },
                        child: const Text(
                          '+',
                          style: TextStyle(
                            fontFamily: 'GloriaHallelujah',
                            color: Colors.white70,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                        ),
                        onPressed: () {
                          setState(() {
                            if (participants > 1 && participants <= 5) {
                              participants--;
                            }
                          });
                        },
                        child: const Text(
                          '-',
                          style: TextStyle(
                            fontFamily: 'GloriaHallelujah',
                            color: Colors.white70,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Type: ',
                        style: TextStyle(
                          letterSpacing: 2.0,
                          fontFamily: 'GloriaHallelujah',
                          color: Colors.teal[900],
                          fontWeight: FontWeight.w600,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          title: Text(
                              'all',
                            style: TextStyle(
                              fontFamily: 'GloriaHallelujah',
                              color: Colors.teal[900],
                              fontSize: 15.0,
                            ),
                          ),
                          leading: Radio<Types>(
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.teal),
                            value: Types.all,
                            groupValue: type,
                            onChanged: (newType) {
                              setState(() {
                                type = newType!;
                              });
                            },
                          ),
                        ),
                      ),
                      // Text('cos tam'),
                      Expanded(
                        child: ListTile(
                          title: Text(
                              'recreational',
                            style: TextStyle(
                              fontFamily: 'GloriaHallelujah',
                              color: Colors.teal[900],
                              fontSize: 15.0,
                            ),
                          ),
                          leading: Radio<Types>(
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.teal),
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
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          title: Text(
                              'relaxation',
                            style: TextStyle(
                              fontFamily: 'GloriaHallelujah',
                              color: Colors.teal[900],
                              fontSize: 15.0,
                            ),
                          ),
                          leading: Radio<Types>(
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.teal),
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
                      Expanded(
                        child: ListTile(
                          title: Text(
                              'education',
                            style: TextStyle(
                              fontFamily: 'GloriaHallelujah',
                              color: Colors.teal[900],
                              fontSize: 15.0,
                            ),
                          ),
                          leading: Radio<Types>(
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.teal),
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
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          title: Text(
                              'busywork',
                            style: TextStyle(
                              fontFamily: 'GloriaHallelujah',
                              color: Colors.teal[900],
                              fontSize: 15.0,
                            ),
                          ),
                          leading: Radio<Types>(
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.teal),
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
                          title: Text(
                              'charity',
                            style: TextStyle(
                              fontFamily: 'GloriaHallelujah',
                              color: Colors.teal[900],
                              fontSize: 15.0,
                            ),
                          ),
                          leading: Radio<Types>(
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.teal),
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
                          title: Text(
                              'cooking',
                            style: TextStyle(
                              fontFamily: 'GloriaHallelujah',
                              color: Colors.teal[900],
                              fontSize: 15.0,
                            ),
                          ),
                          leading: Radio<Types>(
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.teal),
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
                          title: Text(
                              'music',
                            style: TextStyle(
                              fontFamily: 'GloriaHallelujah',
                              color: Colors.teal[900],
                              fontSize: 15.0,
                            ),
                          ),
                          leading: Radio<Types>(
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.teal),
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
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                              'diy',
                            style: TextStyle(
                              fontFamily: 'GloriaHallelujah',
                              color: Colors.teal[900],
                              fontSize: 15.0,
                            ),
                          ),
                          leading: Radio<Types>(
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.teal),
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
                      Expanded(
                        child: ListTile(
                          title: Text(
                              'social',
                            style: TextStyle(
                              fontFamily: 'GloriaHallelujah',
                              color: Colors.teal[900],
                              fontSize: 15.0,
                            ),
                          ),
                          leading: Radio<Types>(
                            fillColor: MaterialStateColor.resolveWith((states) => Colors.teal),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: const <Widget>[
                              Icon(
                                Icons.arrow_back,
                                color: Colors.white70,
                              ),
                              Text(
                                'INFO',
                                style: TextStyle(
                                  letterSpacing: 2.0,
                                  fontFamily: 'GloriaHallelujah',
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          )),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                        ),
                          onPressed: () {
                            getActivity();
                          },
                          child: Row(
                            children: const <Widget>[
                              Icon(
                                Icons.search,
                                color: Colors.white70,
                              ),
                              Text(
                                'SEARCH',
                                style: TextStyle(
                                  letterSpacing: 2.0,
                                  fontFamily: 'GloriaHallelujah',
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w600,
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
          ),
        ));
  }
}
