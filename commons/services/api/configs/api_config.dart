import 'package:commons/services/api/constants/service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static final String scheme = dotenv.env['apiScheme']!;
  static final String host = dotenv.env['apiHost']!;
  static final int port = int.tryParse(dotenv.env['apiPort']!) ?? 443;
  static final String version = dotenv.env['apiVersion']!;
  static final int? userApiPort = int.tryParse(dotenv.get('userApiPort', fallback: ""));
  static final int? coreApiPort = int.tryParse(dotenv.get('coreApiPort', fallback: ""));
  static final int? notifierApiPort = int.tryParse(dotenv.get('notifierApiPort', fallback: ""));
  static final String userApiPrefix = dotenv.env['userApiPrefix']!;
  static final String coreApiPrefix = dotenv.env['coreApiPrefix']!;
  static final String notifierApiPrefix = dotenv.env['notifierApiPrefix']!;
  static final String userApiSuffix = dotenv.env['userApiSuffix']!;
  static final String coreApiSuffix = dotenv.env['coreApiSuffix']!;
  static final String notifierApiSuffix = dotenv.env['notifierApiSuffix']!;

  static int getPort(Service service) {
    switch (service) {
      case Service.user:
        return userApiPort ?? port;
      case Service.core:
        return coreApiPort ?? port;
      case Service.notifier:
        return notifierApiPort ?? port;
    }
  }

  static String getPrefix(Service service) {
    switch (service) {
      case Service.user:
        return userApiPrefix;
      case Service.core:
        return coreApiPrefix;
      case Service.notifier:
        return notifierApiPrefix;
    }
  }

  static String getSuffix(Service service) {
    switch (service) {
      case Service.user:
        return userApiSuffix;
      case Service.core:
        return coreApiSuffix;
      case Service.notifier:
        return notifierApiSuffix;
    }
  }
}
