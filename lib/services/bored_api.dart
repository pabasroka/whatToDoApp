import 'package:http/http.dart';
import 'dart:convert';

class BoredAPI {
  late double? accessibility; // value from 0.0 to 1.0
  late String? type;
  late int? participants; // 1-5
  late double? price; // 0.0 - 1.0
  late String activity; // description of the queried activity

  BoredAPI(
      {required this.accessibility,
      required this.type,
      required this.participants,
      required this.price});

  Future<void> getActivity() async {
    try {
      String baseUri = 'http://www.boredapi.com/api/activity';
      String paramUri = '';
      print(accessibility);
      print(type);
      print(participants);
      print(price);
      if (accessibility == null && price == null && participants == null && type == 'all') {
        paramUri += '?participants=1';
      } else {
        paramUri += '?';
        if (type != 'all') {
          paramUri += 'type=$type&';
        }
        if (price != null) {
          paramUri += 'price=$price&';
        }
        if (accessibility != null) {
          paramUri += 'accessibility=$accessibility&';
        }
        if (participants != null) {
          paramUri += 'participants=$participants&';
        }
      }

      print(baseUri);
      print(paramUri);
      // Response response = await get(Uri.parse(
      //     'http://www.boredapi.com/api/activity?type=$type&participants=$participants&price=$price&accessibility=$accessibility'));
      Response response = await get(Uri.parse(baseUri + paramUri));
      Map data = jsonDecode(response.body);
      activity = data['activity'];
    } catch (e) {
      activity = "could not get activity data";
    }
  }
}

// BoredAPI test = BoredAPI(accessibility: 0.0, type: 'xd', participants: 2, price: 0.4);