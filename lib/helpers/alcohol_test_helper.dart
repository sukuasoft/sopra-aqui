import 'package:sopra_aqui/models/alcohol_test.dart';

class AlcoholTestHelper {
  static AlcoholTestResult getResultAlcoholTest(double? value){
    if (value == null) return AlcoholTestResult.none;

    if(value > 0.05){
      return AlcoholTestResult.perigoso;
    } else if(value > 0.02){
      return AlcoholTestResult.alerta;
    }
    else{
      return AlcoholTestResult.seguro;
    }

  }
}