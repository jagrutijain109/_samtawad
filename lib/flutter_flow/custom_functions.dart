import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

int? subtractOne(int value) {
  return (value - 1);

//
}
List<DocumentReference> generateListOfUsersCopy(DocumentReference? authUser)
{
  if(authUser == null)
    return [];
  final adminUserRef = FirebaseFirestore.instance.collection('usercollection').doc('TH16eFQ5UvejgdAsdG78FypPWll2');
  return [authUser,adminUserRef];
}
List<DocumentReference> generateListOfUsers(
  DocumentReference? authUser,
  DocumentReference? otherUser,
)
{
  if (authUser != null && otherUser != null) {
    return [authUser, otherUser];
  }

  return [];
}

// List<DocumentReference> generateListOfUsersCopy(
//   DocumentReference? authUser,
//   DocumentReference? otherUser,
// ) {
//   if (authUser != null && otherUser != null) {
//     return [authUser, otherUser];
//   }
//
//   return [];
// }

List<String> generateListofNames(
  String authUsername,
  String otherUsername,
) {
  return [authUsername, otherUsername];
}

DocumentReference getOtherUserRef(
  List<DocumentReference> listOfUserRefs,
  DocumentReference authUserRef,
) {
  return authUserRef == listOfUserRefs?.first
      ? listOfUserRefs!.last
      : listOfUserRefs!.first;
}

String getOtherUsername(
  List<String> listofNames,
  String authUsername,
) {
  return authUsername == listofNames.first
      ? listofNames.last
      : listofNames.first;
}

List<String> getUniqueCategories(List<String> category) {
  return category.toSet().toList();
}
