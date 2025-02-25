import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sopra_aqui/models/device.dart';

class DeviceRepository {
  static Future<List<DeviceModel>> getDevices() async {
    List<DeviceModel> devices = [];

    try {
      List<BluetoothDevice> btDevices =
          await FlutterBluetoothSerial.instance.getBondedDevices();

      for (final btDevice in btDevices) {
        devices
            .add(DeviceModel(address: btDevice.address, name: btDevice.name ?? 'Sem nome'));
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Erro ao buscar os dispositivos', backgroundColor: Colors.red); 
      print('Houve um problema!');
    }

    return devices;
  }
}
