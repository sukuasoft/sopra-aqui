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

  DeviceConnection?  get deviceConnected {
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

  Future<void> fetchDevices()async {
    await AppHelper.requestAllPermissions();
    devices = await DeviceRepository.getDevices();

  }

  Future<bool> connectDevice(DeviceModel device)async{
    final connection=  DeviceConnection(device: device);
   await connection.connectDevice();

    if (!connection.isConnected) return false;

    _deviceConnected = connection;
    notifyListeners();
    return true;
  }
}
