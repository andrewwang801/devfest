import 'package:devfest_demo/utils/devfest.dart';
import 'index.dart';

abstract class ConfigEvent {
  Future<ConfigState> applyAsync({required ConfigBloc bloc});
}

class DarkModeEvent extends ConfigEvent {
  final bool darkOn;
  DarkModeEvent(this.darkOn);

  @override
  Future<ConfigState> applyAsync({required bloc}) async {
    try {
      bloc.darkModeOn = darkOn;
      Devfest.prefs.setBool(Devfest.darkModePref, darkOn);
      return InConfigState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return new ErrorConfigState(_.toString());
    }
  }
}
  
class LoadConfigEvent extends ConfigEvent {
  @override
  Future<ConfigState> applyAsync({required ConfigBloc bloc}) async {
    try {
      await Future.delayed(new Duration(seconds: 2));
      return InConfigState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return ErrorConfigState(_.toString());
    }
  }
}