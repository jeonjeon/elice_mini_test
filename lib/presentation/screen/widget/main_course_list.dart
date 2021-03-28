import 'package:elice_mini_test/business_logic/bloc/course_list_bloc.dart';
import 'package:elice_mini_test/business_logic/cubit/app_navigation_cubit.dart';
import 'package:elice_mini_test/business_logic/cubit/main_course_list_cubit.dart';
import 'package:elice_mini_test/core/constants/course_type.dart';
import 'package:elice_mini_test/data/model/course_model.dart';
import 'package:elice_mini_test/data/model/main_course_list_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCourseList extends StatelessWidget {
  const MainCourseList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _state = context.select((MainCourseListCubit cubit) => cubit.state);
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfff5f6f7),
        ),
        child: Column(
          children: [
            if (_state is MainCourseListInitial)
              Center(
                child: CircularProgressIndicator(),
              ),
            if (_state is MainCourseListError)
              Center(
                child: Text('인터넷 연결 상태를 확인해주세요.'),
              ),
            if (_state is MainCourseListSuccess &&
                _state.mainCourseListModel.recommendedCourseList.isNotEmpty)
              courseList(context, CourseType.RECOMMENDED_COURSE,
                  _state.mainCourseListModel.recommendedCourseList),
            if (_state is MainCourseListSuccess &&
                _state.mainCourseListModel.freeCourseList.isNotEmpty)
              courseList(context, CourseType.FREE_COURSE,
                  _state.mainCourseListModel.freeCourseList),
          ],
        ),
      ),
    );
  }

  Column courseList(BuildContext context, CourseType courseType,
      List<CourseModel> courseList) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                courseType == CourseType.RECOMMENDED_COURSE ? '추천 과목' : '무료 과목',
                style: GoogleFonts.roboto(
                  color: Color(0xff000000),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,
                ),
              ),
              TextButton(
                onPressed: () {
                  context
                      .read<CourseListBloc>()
                      .add(CourseListFetch(courseType: courseType));
                  context
                      .read<AppNavigationCubit>()
                      .goToCourseListScreen(courseType);
                },
                child: Text(
                  "전체 보기",
                  style: GoogleFonts.roboto(
                    color: Color(0xff564ea9),
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            scrollDirection: Axis.horizontal,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 15.0,
              );
            },
            itemBuilder: (_, int index) {
              return MaterialButton(
                padding: EdgeInsets.all(0.0),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('${courseList[index].title} course clicked!'),
                      duration: Duration(milliseconds: 500),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      width: 160,
                      height: 136,
                      decoration: BoxDecoration(
                        color: Color(0xff938dd0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: new BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child:
                                Image.network(courseList[index].logo_file_url),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 14.0),
                            child: Text(
                              courseList[index].title,
                              style: GoogleFonts.roboto(
                                color: Color(0xffffffff),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      width: 160,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            courseList[index].fullname,
                            style: GoogleFonts.roboto(
                              color: Color(0xff797a7b),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              letterSpacing: 0,
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: 48,
                            height: 22,
                            decoration: new BoxDecoration(
                                color: Color(0xff0078b5),
                                borderRadius: BorderRadius.circular(2)),
                            child: Text(
                              "오프라인",
                              style: GoogleFonts.roboto(
                                color: Color(0xffffffff),
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
