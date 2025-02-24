import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class AppHelper {
  static Future<void> requestAllPermissions() async {
    try {
      var status = await Permission.bluetooth.status;
      if (status.isDenied) {
        await Permission.bluetooth.request();
      }
    } catch (e) {

      Fluttertoast.showToast(msg: 'Erro ao solicitar as permissões', backgroundColor: Colors.red); 
      print(e.toString());
    }
  }
}
