import 'package:flutter/material.dart';
import 'package:sopra_aqui/models/device.dart';
import 'package:sopra_aqui/pages/device.dart';
import 'package:sopra_aqui/themes/colors.dart';

class DeviceButton extends StatelessWidget {
  const DeviceButton({super.key, required this.device});

  final DeviceModel device;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){
      Navigator.of(context).push(MaterialPageRoute(builder: 
      (context)=>DevicePage()));

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
       ])

      ),
      child: Row(children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(color: Colors.black, 
        borderRadius: BorderRadius.circular(30)
          )
          , child: Image.asset('assets/images/iot.png', width: 20,),), 


SizedBox(width: 10,), 
          Text(device.name, style: TextStyle(
            fontWeight: FontWeight.bold, 
            fontSize: 14, 
            color: Colors.white
          ),), 
          Expanded(child: Container()), 
        Opacity(opacity: 0.3, child:   Image.asset('assets/images/arrow-right.png', width: 20,),)
      ],),
    ),);
  }
}