
enum AlcoholTestResult {
  seguro,alerta, perigoso, 
}

class AlcoholTest {
  final double value;
  final DateTime date;

  const AlcoholTest({required this.value, required this.date});
}