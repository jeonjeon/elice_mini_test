import 'package:elice_mini_test/business_logic/bloc/course_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class FilteredCourseList extends StatefulWidget {
  @override
  _FilteredCourseListState createState() => _FilteredCourseListState();
}

class _FilteredCourseListState extends State<FilteredCourseList> {
  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;

  @override
  void initState() {
    _scrollController.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {}
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseListBloc, CourseListState>(
      builder: (_, state) {
        if (state is CourseListInitial) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CourseListError) {
          return Center(
            child: Text('인터넷 연결 상태를 확인해 주세요.'),
          );
        }

        if (state is CourseListSuccess && state.courseList.isNotEmpty) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            width: 375,
            decoration: new BoxDecoration(
              color: Color(0xfff6f7f8),
            ),
            child: ListView.separated(
              itemCount: 10,
              padding: EdgeInsets.symmetric(vertical: 15.0),
              scrollDirection: Axis.vertical,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 15.0,
                );
              },
              itemBuilder: (_, int index) {
                return MaterialButton(
                  height: 120.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  elevation: 0.0,
                  color: Colors.white,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'id: ${state.courseList[index].id} course clicked!'),
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
                              state.courseList[index].logo_file_url),
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
                              state.courseList[index].title,
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
                              state.courseList[index].fullname,
                              style: TextStyle(
                                fontFamily: 'Roboto',
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
                );
              },
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
