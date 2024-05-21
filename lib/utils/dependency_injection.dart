import 'package:devfest_demo/network/MockClient.dart';
import 'package:devfest_demo/network/index.dart';

enum Flavor { MOCK, REST, FIREBASE}

enum DataMode { DART, JSON }

class Injector {
  static final Injector _singleton = new Injector._internal();
  static Flavor? _flavor;
  static DataMode? _dataMode;

  static void configure(Flavor flavor, DataMode dataMode) {
    _flavor = flavor;
    _dataMode = dataMode;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  IClient get currentClient {
    switch (_flavor) {
      // case Flavor.MOCK:
      // case Flavor.FIREBASE:
      case Flavor.REST:
        return RestClient();
      default:
        return MockClient();
    }
  }
  
  DataMode get currentDataMode {
    switch (_dataMode) {
      case DataMode.DART:
        return DataMode.DART;
      case DataMode.JSON:
        return DataMode.JSON;
      default:
        return DataMode.DART;
    }
  }
}