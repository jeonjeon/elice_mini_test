import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:elice_mini_test/core/constants/course_type.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:string_validator/string_validator.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
part 'app_navigation_state.dart';

class AppNavigationCubit extends Cubit<AppNavigationState> {
  AppNavigationCubit() : super(AppNavigationMainState());

  void goToCourseListScreen(CourseType courseType) =>
      emit(AppNavigationCourseListState(courseType: courseType));

  void backToMainScreen() => emit(AppNavigationMainState());

  void goToWebViewScreen(String url) {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    if (isBase64(url)) {
      Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
      url = stringToBase64Url.decode(url);
    }
    emit(AppNavigationWebViewState(url: url));
  }
}
