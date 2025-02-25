import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sopra_aqui/helpers/app_helper.dart';
import 'package:sopra_aqui/models/device.dart';
import 'package:sopra_aqui/models/device_connection.dart';
import 'package:sopra_aqui/repositories/device.dart';

class MainProvider extends ChangeNotifier {
  List<DeviceModel> _devices = [];

  set devices(List<DeviceModel> value) {
    _devices = value;
    notifyListeners();
  }

  List<DeviceModel> get devices {
    return _devices;
  }

  DeviceConnection? _deviceConnected;

  DeviceConnection? get deviceConnected {
    return _deviceConnected;
  }

  bool _isRefreshing = false;

  set isRefreshing(bool value) {
    _isRefreshing = value;
    notifyListeners();
  }

  bool get isRefreshing {
    return _isRefreshing;
  }

  bool _testingAlcohol = false;

  set testingAlcohol(bool value) {
    _testingAlcohol = value;
    notifyListeners();
  }

  bool get testingAlcohol {
    return _testingAlcohol;
  }

  Future<void> fetchDevices() async {
    await AppHelper.requestAllPermissions();
    devices = await DeviceRepository.getDevices();
  }

  void listenDevice(Uint8List data) {
    String receivedData = String.fromCharCodes(data);
    if (receivedData.startsWith('test:')) {
      testingAlcohol = false;
    }

    _deviceConnected!.listen(receivedData);
    notifyListeners();
  }

  Future<bool> disconnectDevice() async {
    if (_deviceConnected == null) return false;

    final result = await _deviceConnected!.disconnect();
    if (!result) return false;
    notifyListeners();
    return true;
  }

  Future<bool> reconnectDevice() async {
    if (_deviceConnected == null) return false;

    final result = await _deviceConnected!.connect();
    if (!result) return false;
    notifyListeners();
    return true;
  }

  Future<bool> connectDevice(DeviceModel device) async {
    final connection = DeviceConnection(device: device);
    await connection.connect();

    //teste
    await Future.delayed(Duration(seconds: 3));

    if (!connection.isConnected) return false;

    _deviceConnected = connection;
    // _deviceConnected!.connection.input!.listen(listenDevice);
    notifyListeners();
    return true;
  }
}
