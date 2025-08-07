// Automatic FlutterFlow imports
import '/backend/backend.dart';

import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';

// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import 'package:share_plus/share_plus.dart';

import 'package:share_plus/share_plus.dart';

Future<void> formatSatsangShareWithMap(
  String? name,
  String? address,
  String? startDate,
  String? endDate,
  LatLng? location,
) async {
  final lat = location?.latitude;
  final lng = location?.longitude;
  final locationUrl = (lat != null && lng != null)
      ? 'https://www.google.com/maps/search/?api=1&query=$lat,$lng'
      : 'null';

  final message = 'SatSang Name: ${name ?? 'null'}\n'
      'Address: ${address ?? 'null'}\n'
      'Start Date: ${startDate ?? 'null'}\n'
      'End Date: ${endDate ?? 'null'}\n'
      'Location: $locationUrl';

  await Share.share(message);
}

// Future<void> formatSatsangShareWithMap(
//   String name,
//   String address,
//   String startDate,
//   String endDate,
//   LatLng location,
// ) async {
//   final lat = location.latitude;
//   final lng = location.longitude;
//   final locationUrl =
//       'https://www.google.com/maps/search/?api=1&query=$lat,$lng';

//   final message = 'SatSang Name: $name\n'
//       'Address: $address\n'
//       'Start Date: $startDate\n'
//       'End Date: $endDate\n'
//       'Location: $locationUrl';

//   await Share.share(message); // ✅ STILL the correct usage!
// }
