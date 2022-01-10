import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String Location = '';
  String time = '';
  String flag = '';
  String url = '';
  bool isDayTime = true;

  WorldTime(
      {required this.Location,
      required this.flag,
      this.time = "",
      required this.url});

  Future<void> getTime() async {
    try {
      //geting time from world time api
      Response response =
          await get(Uri.parse('http://worldtimeapi.org/api/$url'));
      Map data = jsonDecode(response.body);
      //print(data);
      String datetime = data['datetime'];
      String offsetString = data['utc_offset'];
      List offset = offsetString.split(":").map((e) => int.parse(e)).toList();
      // print(offset);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: (offset[0]), minutes: (offset[1])));
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('error found:$e');
      time = 'could not find the time data';
    }
  }
}
