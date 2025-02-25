import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sopra_aqui/providers/main.dart';
import 'package:sopra_aqui/themes/colors.dart';

class ButtonTest extends StatelessWidget {
  const ButtonTest({super.key});

  void invokeTest (BuildContext context) async {
    final provider =   context.read<MainProvider>();
     provider.testingAlcohol=true;
     
    provider.deviceConnected?.sendData('test');

  }
  @override
  Widget build(BuildContext context) {

  
    return GestureDetector(
        onTap: (){
        if (  context.read<MainProvider>().testingAlcohol) return;
          invokeTest(context);
        },
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),

                color: context.watch<MainProvider>().testingAlcohol ? AppColors.grayDark :
                null, 
                gradient: context.watch<MainProvider>().testingAlcohol ? null :
                 LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppColors.primary,
                      AppColors.primaryDark,
                    ])), child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                      if (context.watch<MainProvider>().testingAlcohol)
                      ... [
                        Image.asset('assets/images/load.gif', width: 20,), 
                        SizedBox(width: 5,)
                      ],
                      Text(
                        context.watch<MainProvider>().testingAlcohol ?
                        'Testando' :
                        'Testar', style: TextStyle(
                      color: Colors.white
                    ),)
                    ],),));
  }
}
