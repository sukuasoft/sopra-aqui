import 'package:flutter/material.dart';
import 'package:sopra_aqui/helpers/date_helper.dart';
import 'package:sopra_aqui/models/alcohol_test.dart';
import 'package:sopra_aqui/themes/colors.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({super.key, required this.alcoholTest});

  final AlcoholTest alcoholTest;

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text('${alcoholTest.value.toStringAsFixed(2)} g/dL',style: TextStyle(
          fontSize: 12,
        ),),
        Expanded(child: Container()),
        Text(DateHelper.tempoDecorrido(alcoholTest.date), style: TextStyle(
          color: AppColors.grayDark, 
          fontSize: 12,

        ),),
      ],
    );
  }
}