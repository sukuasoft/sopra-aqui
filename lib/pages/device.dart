import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sopra_aqui/helpers/alcohol_test_helper.dart';
import 'package:sopra_aqui/models/alcohol_test.dart';
import 'package:sopra_aqui/providers/main.dart';
import 'package:sopra_aqui/themes/colors.dart';
import 'package:sopra_aqui/widgets/app_layout.dart';
import 'package:sopra_aqui/widgets/button_test.dart';
import 'package:sopra_aqui/widgets/history_item.dart';

class DevicePage extends StatelessWidget {
  const DevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceConnected = context.watch<MainProvider>().deviceConnected!;
    final resultTest = AlcoholTestHelper.getResultAlcoholTest(
        deviceConnected.currentTest?.value);

    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) async {
         if (didPop) return;
          context.read<MainProvider>().disconnectDevice();
            context.read<MainProvider>().testingAlcohol=false;
      
          Navigator.of(context).pop();
        },
        child: AppLayout(
            actionRefreshButton: () async {
              final provider = context.read<MainProvider>();
              if (!provider.deviceConnected!.isConnected) {
                await provider.reconnectDevice();
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      deviceConnected.device.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(child: Container()),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                          color: deviceConnected.isConnected
                              ? AppColors.green
                              : AppColors.red,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      deviceConnected.isConnected
                          ? 'Conectado'
                          : 'Desconectado',
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
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Stack(
                          children: [
                            SizedBox(
                                width: double.infinity,
                                height: double.infinity,
                                child: CircularProgressIndicator(
                                    strokeCap: StrokeCap.round,
                                    strokeWidth: 10,
                                    backgroundColor: resultTest ==
                                            AlcoholTestResult.seguro
                                        ? AppColors.greenLight
                                        : (resultTest ==
                                                AlcoholTestResult.alerta
                                            ? AppColors.yellowLight
                                            : (resultTest ==
                                                    AlcoholTestResult.perigoso
                                                ? AppColors.redLight
                                                : AppColors.gray)),
                                    color: resultTest ==
                                            AlcoholTestResult.seguro
                                        ? AppColors.green
                                        : (resultTest ==
                                                AlcoholTestResult.alerta
                                            ? AppColors.yellow
                                            : (resultTest ==
                                                    AlcoholTestResult.perigoso
                                                ? AppColors.red
                                                : AppColors.grayDark)),
                                    value:
                                        (deviceConnected.currentTest?.value ??
                                                0.03) *
                                            10)),
                            Center(
                              child: Text(deviceConnected.currentTest == null
                                  ? '-'
                                  : '${deviceConnected.currentTest!.value.toStringAsFixed(2)} g/dL'),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        resultTest == AlcoholTestResult.seguro
                            ? "Seguro"
                            : (resultTest == AlcoholTestResult.alerta
                                ? "Alerta"
                                : (resultTest == AlcoholTestResult.perigoso
                                    ? "Perigoso"
                                    : "Sem dado")),
                        style: TextStyle(
                            color: resultTest == AlcoholTestResult.seguro
                                ? AppColors.green
                                : (resultTest == AlcoholTestResult.alerta
                                    ? AppColors.yellow
                                    : (resultTest == AlcoholTestResult.perigoso
                                        ? AppColors.red
                                        : AppColors.grayDark))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ButtonTest()
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                    child: Container(
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
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Histórico',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        color: AppColors.gray,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) => HistoryItem(
                                    alcoholTest: deviceConnected.history[index],
                                  ),
                              separatorBuilder: (context, index) => Divider(
                                    color: AppColors.grayLight,
                                  ),
                              itemCount: deviceConnected.history.length))
                    ],
                  ),
                ))
              ],
            )));
  }
}
