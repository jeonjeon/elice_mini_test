import 'package:elice_mini_test/business_logic/bloc/course_list_bloc.dart';
import 'package:elice_mini_test/business_logic/cubit/app_navigation_cubit.dart';
import 'package:elice_mini_test/business_logic/cubit/bottom_navigation_cubit.dart';
import 'package:elice_mini_test/business_logic/cubit/main_course_list_cubit.dart';
import 'package:elice_mini_test/data/repository/course_list_repository.dart';
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
  final CourseListRepository courseListRepository = CourseListRepository();
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
          BlocProvider<CourseListBloc>(
            create: (_) =>
                CourseListBloc(courseListRepository: courseListRepository),
          ),
          BlocProvider<MainCourseListCubit>(
            create: (_) =>
                MainCourseListCubit(courseListRepository: courseListRepository),
          ),
        ],
        child: AppNavigator(),
      ),
    );
  }
}
