import 'package:elice_mini_test/business_logic/cubit/app_navigation_cubit.dart';
import 'package:elice_mini_test/business_logic/cubit/bottom_navigation_cubit.dart';
import 'package:elice_mini_test/presentation/navigator/AppNavigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/debug/elice_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<BottomNavigationCubit>(
            create: (_) => BottomNavigationCubit(),
          ),
          BlocProvider<AppNavigationCubit>(
            create: (_) => AppNavigationCubit(),
          ),
        ],
        child: AppNavigator(),
      ),
    );
  }
}
