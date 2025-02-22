import 'package:flutter/material.dart';
import 'package:sopra_aqui/themes/colors.dart';
import 'package:sopra_aqui/widgets/app_layout.dart';
import 'package:sopra_aqui/widgets/button_test.dart';
import 'package:sopra_aqui/widgets/history_item.dart';

class DevicePage extends StatelessWidget {
  const DevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Device',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(child: Container()),
            Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(12)),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Conectado',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
        Divider(
          color: AppColors.gray,
        ),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                'Nível de Álcool',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ), 

             SizedBox(height: 100,
             width: 100,
             child:  Stack(children: [
                SizedBox(width: double.infinity,
                height: double.infinity,
                child: CircularProgressIndicator(
                  strokeCap: StrokeCap.round,
                  strokeWidth: 10,
                  backgroundColor: AppColors.greenLight,
                  color: AppColors.green,
                  value: 0.3,
                )),
                Center(child: Text('0.02 g/dL'),)
              ],),), 

              SizedBox(height: 15,), 
              Text('Seguro', style: TextStyle(color: AppColors.green),), 

              SizedBox(height: 20,), 
              ButtonTest()
              

            ],
          ),
        ),

        SizedBox(height: 20,), 

        Expanded(child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
         decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.1),
                    offset: Offset(2, 2), 
                    blurRadius: 2, 
                  )
          ]
         ),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,children: [
           Text(
              'Histórico',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
              Divider(
          color: AppColors.gray,
        ),
       SizedBox(height: 10,), 
        Expanded(child: ListView.separated(
          itemBuilder: (context, index) => HistoryItem(), 
        separatorBuilder: (context, index) => Divider(color: AppColors.grayLight,), itemCount: 2))
         ],),
        ))

      ],
    ));
  }
}
