import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroments {


  static String get baseUrl {
    return dotenv.env['API_URL']!;
  }

  static String get apiKey {
    return dotenv.env['X_RapidAPI_Key']!;
  }

  static String get host {
    return dotenv.env['X_RapidAPI_Host']!;
  }
}
