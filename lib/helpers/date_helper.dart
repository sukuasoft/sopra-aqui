class DateHelper {
  static String tempoDecorrido(DateTime dateTime) {
  Duration difference = DateTime.now().difference(dateTime);

  if (difference.inSeconds < 60) {
    return "${difference.inSeconds} s";
  } else if (difference.inMinutes < 60) {
    return "${difference.inMinutes} min";
  } else if (difference.inHours < 24) {
    return "${difference.inHours} h";
  } else if (difference.inDays == 1) {
    return "ontem";
  } else if (difference.inDays < 7) {
    return "${difference.inDays} dia(s)";
  } else if (difference.inDays < 30) {
    return "${difference.inDays ~/ 7} sem";
  } else if (difference.inDays < 365) {
    return "${difference.inDays ~/ 30} mes(es)";
  } else {
    return "${difference.inDays ~/ 365} ano(s)";
  }
}


}