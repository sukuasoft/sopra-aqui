import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sopra_aqui/providers/main.dart';
import 'package:sopra_aqui/themes/colors.dart';
import 'package:sopra_aqui/widgets/app_layout.dart';
import 'package:sopra_aqui/widgets/device_button.dart';


class DevicesPage extends StatelessWidget {

  const DevicesPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return AppLayout(
      actionRefreshButton: () async{
        await context.read<MainProvider>().fetchDevices();
      },
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Dispositivos disponíveis'),
        Divider(
          color: AppColors.gray,
        ),
        SizedBox(height: 10,),

        Consumer<MainProvider>(builder: (context, provider, child) {

          if (provider.devices.isEmpty) {
return Text('* Sem nenhum dispositivo',
          style: TextStyle(
            color: AppColors.grayDark, 
            fontSize: 10
          ),);
          }
       return   Expanded(
            child: 
           ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                      height: 15,
                    ),
                itemCount: provider.devices.length,
                itemBuilder: (context, index) =>
                    DeviceButton(device: provider.devices[index])),);})
      ],
    ));
  }
}
