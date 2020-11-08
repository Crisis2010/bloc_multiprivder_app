import 'package:bloc/bloc.dart';

class LogBlocObserver extends BlocObserver {
  LogBlocObserver() : super();

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    print('event');
    print(event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('transition');
    print(transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stacktrace) {
    super.onError(cubit, error, stacktrace);
    print('error');
    print(error);
  }
}
