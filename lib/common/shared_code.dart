import 'package:flutter/material.dart';

class SharedCode {
  final BuildContext context;
  SharedCode(this.context);

  //Api constants
  static const String baseUrl = 'https://newsapi.org/v2/top-headlines';

  //Api keys
  static const String apiKeys = "0545fc4bc7d74cea879a1e627ac65745";
}
