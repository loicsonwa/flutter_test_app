import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver{

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    debugPrint('\n=============> Active Bloc :');
    debugPrint('Bloc: ${bloc.runtimeType} \nEvent launched : $event');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print(error);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('\n=============> Transitions :');
    debugPrint('Current State : ${transition.currentState}');
    debugPrint('Event : ${transition.event}');
    debugPrint('Next State : ${transition.nextState}');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    debugPrint('\n=============> Changes :');
    debugPrint('Current State : ${change.currentState}');
    debugPrint('Next State : ${change.nextState}\n');
  }
}