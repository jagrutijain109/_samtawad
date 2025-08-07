
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:share_plus/share_plus.dart';

Future<void> formatSatsangShareMessage(
  String? name,
  String? link,
  String? startDate,
  String? endDate,
  String? timing,
) async {
  final message = 'SatSang Name: ${name ?? 'null'}\n'
      'SatSang Link: ${link ?? 'null'}\n'
      'Start Date: ${startDate ?? 'null'}\n'
      'End Date: ${endDate ?? 'null'}\n'
      'Timing: ${timing ?? 'null'}';

  await Share.share(message); // This opens the native share dialog
}

// Future<void> formatSatsangShareMessage(
//   String name,
//   String link,
//   String startDate,
//   String endDate,
//   String timing,
// ) async {
//   final message =
//       'SatSang Name: $name\nSatSang Link: $link\nStart Date: $startDate\nEnd Date: $endDate\nTiming: $timing';

//   Share.share(message); // This opens the native share dialog
// }
