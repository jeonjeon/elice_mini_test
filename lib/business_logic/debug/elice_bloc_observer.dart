import 'package:flutter_bloc/flutter_bloc.dart';

// 앱 전반에 걸친 bloc 디버그를 위한 옵저버 클래스
class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    print('onCreate ::: $bloc');
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    print('onClose ::: $bloc');
    super.onClose(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError ::: $stackTrace');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print('onTransition ::: $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    print('onChange ::: $change');
    super.onChange(bloc, change);
  }
}
