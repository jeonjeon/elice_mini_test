import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilteredCourseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            onPressed: () {},
            child: Flex(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              direction: Axis.horizontal,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                      width: 88,
                      height: 88,
                      decoration: new BoxDecoration(
                          borderRadius: BorderRadius.circular(4))),
                ),
                Flexible(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "캐글 문제 풀이로 배우는 데이터 분석",
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
                        "유준배 선생님",
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
}
