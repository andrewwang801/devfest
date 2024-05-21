import 'package:bloc/bloc.dart';
import 'index.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {

  ConfigBloc(): super(UnConfigState());

  bool darkModeOn = false;

  @override
  Stream<ConfigState> mapEventToState(ConfigEvent event) async* {
    try {
        yield UnConfigState();
        yield await event.applyAsync(bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
    }
  }
}