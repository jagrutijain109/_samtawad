// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your widget name, define your parameter, and then add the
// boilerplate code using the green button on the right!
import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

// Custom imports
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:audioplayers/audioplayers.dart';

class AlarmWidgetssong extends StatefulWidget {
  final double width;
  final double height;

  const AlarmWidgetssong({
    Key? key,
    this.width = 350,
    this.height = 500,
  }) : super(key: key);

  @override
  _AlarmWidgetState createState() => _AlarmWidgetState();
}

class _AlarmWidgetState extends State<AlarmWidgetssong> {
  final TextEditingController _titleController = TextEditingController();
  DateTime? _selectedTime;
  String? _selectedSongName;
  String? _selectedSongUrl;
  List<Map<String, String>> _availableSongs = [];

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final AudioPlayer _player = AudioPlayer();

  String? _uid;

  @override
  void initState() {
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    _uid = user?.uid;

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final initSettings = InitializationSettings(android: android);
    flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (payload) {
        _playAlarm(); // Auto-play when notification is tapped
      },
    );

    _loadSongs();
  }

  // Future<void> _loadSongs() async {
  //   final snapshot =
  //       await FirebaseFirestore.instance.collection('alarms').get();

  //   final songs = snapshot.docs.map((doc) {
  //     final data = doc.data();
  //     return {
  //       'name': data['song_name'] ?? '',
  //       'url': data['song_url'] ?? '',
  //     };
  //   }).toList();

  //   setState(() => _availableSongs = songs);
  // }

  Future<void> _loadSongs() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('alarms').get();

    final songs = snapshot.docs.map<Map<String, String>>((doc) {
      final data = doc.data();
      return {
        'name': data['song_name']?.toString() ?? '',
        'url': data['song_url']?.toString() ?? '',
      };
    }).toList();

    setState(() => _availableSongs = songs);
  }

  Future<void> _scheduleNotification(
      String docId, String title, DateTime time) async {
    const androidDetails = AndroidNotificationDetails(
      'alarm_channel',
      'Alarm Channel',
      channelDescription: 'Alarm Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );
    final details = NotificationDetails(android: androidDetails);
    await flutterLocalNotificationsPlugin.zonedSchedule(
      docId.hashCode,
      'Alarm: $title',
      'Tap to stop alarm.',
      tz.TZDateTime.from(time, tz.local),
      details,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: 'alarms',
    );
  }

  Future<void> _saveAlarm() async {
    if (_selectedTime == null ||
        _titleController.text.isEmpty ||
        _uid == null ||
        _selectedSongUrl == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("कृपया सभी फ़ील्ड भरें (शीर्षक, समय, और गीत)।"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final docRef =
        await FirebaseFirestore.instance.collection('alarm_collection').add({
      'title': _titleController.text,
      'alarm_time': _selectedTime,
      'is_active': true,
      'userid': _uid,
      'song_name': _selectedSongName,
      'song_url': _selectedSongUrl,
    });

    await _scheduleNotification(
        docRef.id, _titleController.text, _selectedTime!);

    _titleController.clear();
    setState(() {
      _selectedTime = null;
      _selectedSongName = null;
      _selectedSongUrl = null;
    });
  }

  Future<void> _playAlarm() async {
    if (_selectedSongUrl != null) {
      await _player.setReleaseMode(ReleaseMode.loop);
      await _player.play(UrlSource(_selectedSongUrl!));
    }
  }

  Future<void> _stopAlarm() async {
    await _player.stop();
  }

  @override
  Widget build(BuildContext context) {
    if (_uid == null) {
      return const Center(child: Text('कृपया अलार्म देखने के लिए लॉगिन करें।'));
    }

    return Container(
      width: widget.width,
      height: widget.height,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'अलार्म शीर्षक'),
            ),
            const SizedBox(height: 8),

            /// Dropdown to choose song
            DropdownButton<String>(
              isExpanded: true,
              hint: const Text("अलार्म गीत चुनें"),
              value: _selectedSongName,
              items: _availableSongs.map((song) {
                return DropdownMenuItem<String>(
                  value: song['name'],
                  child: Text(song['name'] ?? ''),
                  onTap: () {
                    _selectedSongUrl = song['url'];
                  },
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedSongName = value;
                });
              },
            ),

            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedTime != null
                        ? DateFormat.jm().format(_selectedTime!)
                        : 'समय चुनें',
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (picked != null) {
                      final now = DateTime.now();
                      setState(() => _selectedTime = DateTime(
                            now.year,
                            now.month,
                            now.day,
                            picked.hour,
                            picked.minute,
                          ));
                    }
                  },
                  child: const Text('समय चुनें'),
                ),
                ElevatedButton(
                  onPressed: _saveAlarm,
                  child: const Text('अलार्म सेट करें'),
                ),
              ],
            ),

            const Divider(),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('alarm_collection')
                  .where('userid', isEqualTo: _uid)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("Error: ${snapshot.error}"));
                }
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final docs = snapshot.data!.docs;
                if (docs.isEmpty) {
                  return const Center(child: Text("कोई अलार्म नहीं मिला।"));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;
                    final alarmTime =
                        (data['alarm_time'] as Timestamp).toDate();
                    final title = data['title'] ?? 'Alarm';
                    final songName = data['song_name'] ?? '';

                    return ListTile(
                      title: Text(title),
                      subtitle: Text(
                        "${DateFormat.yMd().add_jm().format(alarmTime)}\nगीत: $songName",
                      ),
                      // trailing: IconButton(
                      //   icon: const Icon(Icons.stop),
                      //   onPressed: _stopAlarm,
                      // ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
