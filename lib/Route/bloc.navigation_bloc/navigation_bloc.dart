import 'package:bloc/bloc.dart';
import 'package:card_points/Screens/MisPuntos/MisPuntos.dart';


enum NavigationEvents {
  MisPuntosPageClickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  NavigationBloc(NavigationStates initialState) : super(initialState);

  @override
  MisPuntosPage get initialState => MisPuntosPage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.MisPuntosPageClickedEvent:
        yield MisPuntosPage();
        break;
    }
  }
}