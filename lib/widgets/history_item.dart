import 'package:flutter/material.dart';
import 'package:sopra_aqui/themes/colors.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text('0.02 g/dL',style: TextStyle(
          fontSize: 12,
        ),),
        Expanded(child: Container()),
        Text('10 min', style: TextStyle(
          color: AppColors.grayDark, 
          fontSize: 12,

        ),),
      ],
    );
  }
}