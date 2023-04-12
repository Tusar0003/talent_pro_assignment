import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:talent_pro_assignment/model/result.dart';
import 'package:talent_pro_assignment/utils/strings.dart';

class HomeRepository {

  late ValueChanged<Result> _onSetComplete;
  late ValueChanged<Result> _onDataFetch;

  setUserInfo(
      String userId,
      String? userName,
      String? mobileNumber,
      String? address,
      ValueChanged<Result> onSetComplete
  ) async {
    _onSetComplete = onSetComplete;
    DatabaseReference ref = FirebaseDatabase.instance.ref('users/$userId');

    await ref.set({
      "userName": userName,
      "mobileNumber": mobileNumber,
      "address": {
        "line1": address
      }
    }).then((value) => {
      _onSetComplete(
        Result(true, 'Data updated successfully.', null)
      )
    }).catchError((onError) {
      print(onError);
      _onSetComplete(
          Result(false, Strings.errorMessage, null)
      );
    });
  }

  getUserInfo(String userId, ValueChanged<Result> onDataFetch) async {
    _onDataFetch = onDataFetch;
    DatabaseReference starCountRef = FirebaseDatabase.instance.ref();

    starCountRef.child('users/$userId').onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;

      if (data != null) {
        _onDataFetch(
            Result(true, null, data)
        );
      } else {
        _onDataFetch(
            Result(false, 'No data found!', null)
        );
      }
    }).onError((handleError) {
      print(handleError);
     _onDataFetch(
       Result(false, Strings.errorMessage, null)
     );
    });
  }

  logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}