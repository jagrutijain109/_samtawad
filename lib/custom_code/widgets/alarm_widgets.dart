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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:timezone/timezone.dart' as tz;

class AlarmWidgets extends StatefulWidget {
  final double width;
  final double height;

  const AlarmWidgets({
    Key? key,
    this.width = 350,
    this.height = 500,
  }) : super(key: key);

  @override
  _AlarmWidgetState createState() => _AlarmWidgetState();
}

class _AlarmWidgetState extends State<AlarmWidgets> {
  final TextEditingController _titleController = TextEditingController();
  DateTime? _selectedTime;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  String? _uid;

  @override
  void initState() {
    super.initState();

    // Get current user ID
    final user = FirebaseAuth.instance.currentUser;
    _uid = user?.uid;

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final initSettings = InitializationSettings(android: android);
    flutterLocalNotificationsPlugin.initialize(initSettings);
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
      'Your alarm is ringing!',
      tz.TZDateTime.from(time, tz.local),
      details,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  Future<void> _saveAlarm() async {
    if (_selectedTime == null ||
        _titleController.text.isEmpty ||
        _uid == null) {
      return;
    }

    final docRef =
        await FirebaseFirestore.instance.collection('alarm_collection').add({
      'title': _titleController.text,
      'alarm_time': _selectedTime,
      'is_active': false,
      'userid': _uid,
    });

    await _scheduleNotification(
        docRef.id, _titleController.text, _selectedTime!);

    _titleController.clear();
    setState(() => _selectedTime = null);
  }

  @override
  Widget build(BuildContext context) {
    if (_uid == null) {
      return const Center(child: Text('Please log in to view alarms.'));
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
              decoration: const InputDecoration(labelText: 'Alarm Title'),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedTime != null
                        ? DateFormat.jm().format(_selectedTime!)
                        : 'Select Time',
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
                  child: const Text('Pick Time'),
                ),
                ElevatedButton(
                  onPressed: _saveAlarm,
                  child: const Text('Set Alarm'),
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
                  return const Center(child: Text("No alarms found."));
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

                    return ListTile(
                      title: Text(title),
                      subtitle:
                          Text(DateFormat.yMd().add_jm().format(alarmTime)),
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

  // @override
  // Widget build(BuildContext context) {
  //   if (_uid == null) {
  //     return const Center(child: Text('Please log in to view alarms.'));
  //   }

  //   return Container(
  //     width: widget.width,
  //     height: widget.height,
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(12),
  //       color: Colors.white,
  //       boxShadow: const [
  //         BoxShadow(
  //           color: Colors.black12,
  //           blurRadius: 6,
  //           offset: Offset(0, 2),
  //         ),
  //       ],
  //     ),
  //     child: Column(
  //       children: [
  //         TextField(
  //           controller: _titleController,
  //           decoration: const InputDecoration(labelText: 'Alarm Title'),
  //         ),
  //         Row(
  //           children: [
  //             Expanded(
  //               child: Text(
  //                 _selectedTime != null
  //                     ? DateFormat.jm().format(_selectedTime!)
  //                     : 'Select Time',
  //               ),
  //             ),
  //             TextButton(
  //               onPressed: () async {
  //                 final picked = await showTimePicker(
  //                   context: context,
  //                   initialTime: TimeOfDay.now(),
  //                 );
  //                 if (picked != null) {
  //                   final now = DateTime.now();
  //                   setState(() => _selectedTime = DateTime(
  //                         now.year,
  //                         now.month,
  //                         now.day,
  //                         picked.hour,
  //                         picked.minute,
  //                       ));
  //                 }
  //               },
  //               child: const Text('Pick Time'),
  //             ),
  //             ElevatedButton(
  //               onPressed: _saveAlarm,
  //               child: const Text('Set Alarm'),
  //             )
  //           ],
  //         ),
  //         const Divider(),
  //         Expanded(
  //           child: StreamBuilder<QuerySnapshot>(
  //             stream: FirebaseFirestore.instance
  //                 .collection('alarm_collection')
  //                 .where('userid', isEqualTo: _uid)
  //                 .snapshots(),
  //             builder: (context, snapshot) {
  //               if (snapshot.hasError) {
  //                 return Center(child: Text("Error: ${snapshot.error}"));
  //               }
  //               if (!snapshot.hasData) {
  //                 return const Center(child: CircularProgressIndicator());
  //               }
  //               final docs = snapshot.data!.docs;
  //               if (docs.isEmpty) {
  //                 return const Center(child: Text("No alarms found."));
  //               }
  //               return ListView.builder(
  //                 itemCount: docs.length,
  //                 itemBuilder: (context, index) {
  //                   final data = docs[index].data() as Map<String, dynamic>;
  //                   final alarmTime =
  //                       (data['alarm_time'] as Timestamp).toDate();
  //                   final title = data['title'] ?? 'Alarm';

  //                   return ListTile(
  //                     title: Text(title),
  //                     subtitle:
  //                         Text(DateFormat.yMd().add_jm().format(alarmTime)),
  //                   );
  //                 },
  //               );
  //             },
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
