import 'package:elice_mini_test/business_logic/cubit/app_navigation_cubit.dart';
import 'package:elice_mini_test/presentation/screen/course_list_screen.dart';
import 'package:elice_mini_test/presentation/screen/main_screen.dart';
import 'package:elice_mini_test/presentation/screen/webview_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class AppNavigator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var navigationState = context
        .select((AppNavigationCubit navigationCubit) => navigationCubit.state);
    return Navigator(
      pages: [
        MaterialPage(child: MainScreen()),
        if (navigationState is AppNavigationCourseListState)
          MaterialPage(child: CourseListScreen()),
        if (navigationState is AppNavigationWebViewState)
          MaterialPage(child: WebViewScreen(url: navigationState.url)),
      ],
      onPopPage: (route, result) {
        context.read<AppNavigationCubit>().backToMainScreen();
        return route.didPop(result);
      },
    );
  }
}
