import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sopra_aqui/helpers/app_helper.dart';
import 'package:sopra_aqui/pages/devices.dart';
import 'package:sopra_aqui/providers/main.dart';
import 'package:sopra_aqui/themes/colors.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () async{
      await AppHelper.requestAllPermissions();
      await context.read<MainProvider>().fetchDevices();

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
        return DevicesPage();
      }));
    });
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.black
        ),
        child: Column(children: [
          Expanded(child: Container()),
          Image.asset('assets/images/logo.png', width: 120,),
          SizedBox(height:20,), 
          Text('SOPRA AQUI', style: TextStyle(
            color: Colors.white, 
            fontWeight: FontWeight.bold, 
            fontSize: 20
          ),),  

          Expanded(child: Container()),
          Image.asset('assets/images/load.gif', width: 30,), 
          SizedBox(height: 40,)
        ],)
      ),
    );
  }
}