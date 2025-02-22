import 'package:flutter/material.dart';
import 'package:sopra_aqui/models/device.dart';
import 'package:sopra_aqui/themes/colors.dart';
import 'package:sopra_aqui/widgets/app_layout.dart';
import 'package:sopra_aqui/widgets/device_button.dart';


class DevicesPage extends StatelessWidget {

  DevicesPage({super.key});
  
  final List<DeviceModel> devices = [

    DeviceModel(address: '', name: 'DEVICE 1'),
    DeviceModel(address: '', name: 'DEVICE 2')
  ];

  @override
  Widget build(BuildContext context) {
    return AppLayout(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Dispositivos disponíveis'),
        Divider(
          color: AppColors.gray,
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      height: 15,
                    ),
                itemCount: devices.length,
                itemBuilder: (context, index) =>
                    DeviceButton(device: devices[index])))
      ],
    ));
  }
}
