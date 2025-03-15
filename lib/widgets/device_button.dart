import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sopra_aqui/models/device.dart';
import 'package:sopra_aqui/pages/device.dart';
import 'package:sopra_aqui/providers/main.dart';
import 'package:sopra_aqui/themes/colors.dart';

class DeviceButton extends StatefulWidget {
  const DeviceButton({super.key, required this.device});

  final DeviceModel device;

  @override
  State<DeviceButton> createState() => _DeviceButtonState();
}

class _DeviceButtonState extends State<DeviceButton> {
  bool _isConnecting = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {

        if (_isConnecting) return;
        setState(() {
          _isConnecting = true;
        });

        final isConnected =
            await context.read<MainProvider>().connectDevice(widget.device);

        setState(() {
          _isConnecting = false;
        });

        if (isConnected) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => DevicePage()));
        }
        else{
          Fluttertoast.showToast(msg: 'Não foi possível conectar ao ${widget.device.name}', 
          backgroundColor: Colors.red);
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  AppColors.primary,
                  AppColors.primaryDark,
                ])),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(30)),
              child: Image.asset(
                'assets/images/iot.png',
                width: 20,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              widget.device.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.white),
            ),
            Expanded(child: Container()),
            Opacity(
              opacity: 0.3,
              child: Image.asset(
                _isConnecting
                    ? 'assets/images/load.gif'
                    : 'assets/images/arrow-right.png',
                width: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
