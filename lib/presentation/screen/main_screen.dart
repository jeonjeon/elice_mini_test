import 'package:elice_mini_test/business_logic/cubit/bottom_navigation_cubit.dart';
import 'package:elice_mini_test/business_logic/cubit/main_course_list_cubit.dart';
import 'package:elice_mini_test/presentation/screen/widget/main_qr_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widget/main_course_list.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar(context),
      body: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (_, state) {
          if (state.index == 0) {
            context.read<MainCourseListCubit>().getMainCourseList();
            return MainCourseList();
          }
          return MainQRScanner();
        },
      ),
      bottomNavigationBar: mainBottomNavigationBar(context),
    );
  }

  AppBar mainAppBar(BuildContext context) {
    return AppBar(
      elevation: .2,
      backgroundColor: Color(0xffffffff),
      centerTitle: true,
      title: Container(
        width: 375,
        height: 667,
        child: Image.asset('assets/images/elicelogo.png'),
      ),
      actions: [
        IconButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('alarm button is clicked'),
                duration: Duration(milliseconds: 500),
              ),
            );
          },
          icon: Image.asset('assets/images/notification.png'),
        ),
      ],
    );
  }

  BottomNavigationBar mainBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        if (index == 0) {
          context.read<BottomNavigationCubit>().changePage(index);
          return;
        }
        if (index == 1) {
          context.read<BottomNavigationCubit>().changePage(index);
          return;
        }
      },
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Image.asset('assets/images/icon_home.png')),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Image.asset('assets/images/icon_home_activated.png'),
          ),
        ),
        BottomNavigationBarItem(
          label: 'QR',
          icon: Padding(
              padding: EdgeInsets.only(bottom: 5.0),
              child: Image.asset('assets/images/icon_camera.png')),
          activeIcon: Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Image.asset('assets/images/icon_camera.png'),
          ),
        ),
      ],
      selectedItemColor: Color(0xff524aa1),
      selectedFontSize: 10.0,
      selectedLabelStyle: GoogleFonts.roboto(fontWeight: FontWeight.w700),
      currentIndex:
          context.select((BottomNavigationCubit cubit) => cubit.state.index),
    );
  }
}
