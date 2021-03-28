import 'package:elice_mini_test/business_logic/cubit/app_navigation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget/filterd_course_list.dart';

class CourseListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff202044),
        brightness: Brightness.dark,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            context.read<AppNavigationCubit>().backToMainScreen();
          },
        ),
        centerTitle: true,
        title: Text("무료 과목",
            style: GoogleFonts.roboto(
              color: Color(0xffffffff),
              fontSize: 16,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              letterSpacing: 0,
            )),
      ),
      body: FilteredCourseList(),
    );
  }
}
