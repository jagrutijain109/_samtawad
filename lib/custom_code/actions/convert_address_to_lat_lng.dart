// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:geocoding/geocoding.dart';
import 'package:samtawad_team/flutter_flow/lat_lng.dart'; // Replace `samtawad_team` with your actual FF project name

Future<LatLng?> convertAddressToLatLng(String address) async {
  try {
    print('📍 Geocoding address: $address');

    final locations = await locationFromAddress(address);
    print('📌 Found ${locations.length} location(s)');

    if (locations.isNotEmpty) {
      final loc = locations.first;
      print('✅ Latitude: ${loc.latitude}, Longitude: ${loc.longitude}');
      return LatLng(loc.latitude, loc.longitude);
    } else {
      print('⚠️ No coordinates found for this address');
    }
  } catch (e) {
    print('❌ Geocoding error: $e');
  }

  return null;
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
