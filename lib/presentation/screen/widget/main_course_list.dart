import 'package:elice_mini_test/core/constants/course_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainCourseList extends StatelessWidget {
  const MainCourseList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xfff5f6f7),
        ),
        child: Column(
          children: [
            courseTitleBar(CourseType.RECOMMENDED_COURSE),
            courseList(),
            courseTitleBar(CourseType.FREE_COURSE),
            courseList(),
          ],
        ),
      ),
    );
  }

  Container courseList() {
    return Container(
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
              print('clicked');
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
                        child: Text('dasdsad'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          "캐글 문제 풀이로 배우는 데이터 분석",
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
                        "유준배 선생님",
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
    );
  }

  Padding courseTitleBar(CourseType courseType) {
    return Padding(
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
            onPressed: () {},
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
    );
  }
}
