import 'dart:typed_data';

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

  void listen(String data) {

    List<String> dados = data.split(':');

    String key = dados[0];
    String value = dados[1];

    if (key == 'test') {
      double valueTest = double.parse(value);

      final test = AlcoholTest(value: valueTest, date: DateTime.now());
      currentTest = test;
      history.insert(0, test);
    }
  }

  Future<void> sendData(String data) async {
    data = data.trim();
    try {
      connection.output.add(Uint8List.fromList(data.codeUnits));

      await connection.output.allSent;

      print('Dados enviados sucesso!');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> connect() async {
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

  Future<bool> disconnect() async {
    try {
      await connection.close();
      isConnected = false;
      return true;
    } catch (e) {
      print('Houve um problema!');
    }
    return false;
  }
}
