import 'package:elice_mini_test/business_logic/bloc/course_list_bloc.dart';
import 'package:elice_mini_test/data/model/course_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazy_loading_list/lazy_loading_list.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class FilteredCourseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseListBloc, CourseListState>(
      builder: (_, state) {
        if (state is CourseListInitialState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CourseListErrorState) {
          return Center(
            child: Text('인터넷 연결 상태를 확인해 주세요.'),
          );
        }

        if (state is CourseListSuccessState && state.courseList.isNotEmpty) {
          return LiquidPullToRefresh(
            color: Color(0xff202044),
            springAnimationDurationInMilliseconds: 400,
            onRefresh: () async {
              context
                  .read<CourseListBloc>()
                  .add(CourseListInitialEvent(courseType: state.courseType));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              width: 375,
              decoration: new BoxDecoration(
                color: Color(0xfff6f7f8),
              ),
              child: ListView.separated(
                itemCount: state.courseList.length,
                padding: EdgeInsets.symmetric(vertical: 15.0),
                scrollDirection: Axis.vertical,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 15.0,
                  );
                },
                itemBuilder: (_, int index) {
                  int maxCount = state.course_count;
                  CourseModel course = state.courseList[index];
                  return LazyLoadingList(
                    hasMore: maxCount > state.courseList.length,
                    index: index,
                    loadMore: () async {
                      print(state.courseList.length);
                      context.read<CourseListBloc>().add(
                          CourseListLoadMoreEvent(
                              courseType: state.courseType));
                    },
                    child: MaterialButton(
                      height: 120.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      elevation: 0.0,
                      color: Colors.white,
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${course.title} course clicked!'),
                            duration: Duration(milliseconds: 500),
                          ),
                        );
                      },
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              width: 88,
                              height: 88,
                              decoration: new BoxDecoration(
                                color: Color(0xfff0f0f0),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Image.network(
                                course.logo_file_url,
                                errorBuilder: (_, __, ___) => Container(),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Flexible(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  course.title,
                                  style: GoogleFonts.roboto(
                                    color: Color(0xff000000),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0,
                                  ),
                                  softWrap: true,
                                ),
                                Text(
                                  course.fullname,
                                  style: GoogleFonts.roboto(
                                    color: Color(0xff7e7e7e),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    letterSpacing: 0,
                                  ),
                                ),
                                SizedBox(
                                  height: 5.0,
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
                    ),
                  );
                },
              ),
            ),
          );
        }
        return Center(
          child: Text('해당하는 강의가 없습니다.'),
        );
      },
    );
  }
}
