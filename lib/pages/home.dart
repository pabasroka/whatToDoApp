import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:what_to_do/pages/search.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 100.0, 30.0, 0.0),
          child: Center(
            child: Column(
              children: [
                Text(
                  '`What to do APP`\n lets you find an interesting activity\n\n '
                      'You can choose an activity based on:'
                      '\n -> type,\n -> price,\n -> number of participants,\n -> accessibility',
                  style: TextStyle(
                    color: Colors.teal[900],
                    fontFamily: 'GloriaHallelujah',
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 120.0),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Search()),
                      );
                      // Navigator.pushReplacementNamed(context, '/search');
                    },
                    child: const Text(
                      'Get started',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20.0,
                        letterSpacing: 2.0,
                        fontFamily: 'GloriaHallelujah',
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.teal),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
