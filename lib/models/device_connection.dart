import 'package:sopra_aqui/models/alcohol_test.dart';
import 'package:sopra_aqui/models/device.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';

class DeviceConnection {
  final DeviceModel device;
  late BluetoothConnection connection;
  AlcoholTest? currentTest;
  final List<AlcoholTest> history = [];
  bool isConnected = false;

  DeviceConnection({required this.device});

  Future<bool> connectDevice() async {
    try {
      final con = await BluetoothConnection.toAddress(device.address);

      if (connection.isConnected) {
        isConnected = true;
        connection = con;
        return true;
      }
    } catch (e) {
      print('Houve um problema!');
    }
    return false;
  }
}
