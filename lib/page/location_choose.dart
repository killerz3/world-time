import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class location extends StatefulWidget {
  @override
  _locationState createState() => _locationState();
}

class _locationState extends State<location> {
  List<WorldTime> locations = [
    WorldTime(Location: 'Kolkata', flag: 'india.png', url: "Asia/Kolkata"),
    WorldTime(url: 'Europe/London', Location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', Location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', Location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', Location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', Location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', Location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', Location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', Location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.Location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].Location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
                tileColor: Colors.grey[600],
              ),
            ),
          );
        },
      ),
    );
  }
}
