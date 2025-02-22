import 'package:flutter/material.dart';
import 'package:sopra_aqui/themes/colors.dart';

class ButtonTest extends StatelessWidget {
  const ButtonTest({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (){

        },
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      AppColors.primary,
                      AppColors.primaryDark,
                    ])), child: Text('Testar', style: TextStyle(
                      color: Colors.white
                    ),),));
  }
}
