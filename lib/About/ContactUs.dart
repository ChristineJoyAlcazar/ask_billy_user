import 'package:abigail_askbilly/About/Abouthome.dart';
import 'package:abigail_askbilly/About/Admission.dart';
import 'package:abigail_askbilly/About/Scholarship.dart';
import 'package:abigail_askbilly/Maps/Mapshome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';

import '../LandingPage/Landingpage.dart';
import '../MenuBar.dart';

class contactUs extends StatefulWidget {
  @override
  State<contactUs> createState() => _contactUsState();
}

class _contactUsState extends State<contactUs> {
  var size, height, width;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  final titleStyle = TextStyle(color: HexColor('061e47'));
  final btnStyle = TextStyle(color: Colors.white);
  final textTitleStyle = TextStyle(color: HexColor('061e47'));
  final contentStyle = TextStyle(color: HexColor('061e47'));
  @override
  Widget build(BuildContext context) {
    // getting the size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
        drawerScrimColor: Colors.transparent,
        key: _scaffoldKey,
        drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: menuBar(),
        ),
        body: Container(
          height: 100.h,
          width: width,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(6),
                width: width,
                height: 8.h,
                decoration: BoxDecoration(
                  color: HexColor('dee7f0'),
                  image: DecorationImage(
                    image: AssetImage('assets/paws.gif'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Image.asset(
                        'assets/BurgerMenu.png',
                        height: 4.h,
                      ),
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Text(
                      'About NU',
                      style: GoogleFonts.montserrat(
                          textStyle: titleStyle,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.sp),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Image.asset(
                      'assets/logo.png',
                      height: 7.h,
                    ),
                  ],
                ),
              ), //TOPBAR

              Container(
                color: HexColor('af9f30'),
                height: 2.h,
                width: width,
              ),

              Expanded(
                child: Stack(
                  children: [
                    Container(
                      height: 100.h,
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      decoration: BoxDecoration(
                        color: HexColor('dee7f0'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10.w, top: 3.h),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => aboutHome()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                primary: HexColor('af9f30'),
                                elevation: 5,
                                // padding: EdgeInsets.symmetric(
                                //     vertical: 2.h, horizontal: 7.w),
                              ),
                              icon: Icon(
                                Icons.info_outline,
                                size: 4.h,
                              ),
                              label: Text(
                                'About NU',
                                style: GoogleFonts.montserrat(
                                    textStyle: btnStyle,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.5.w,
                          ),
                          Container(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Scholarship()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                primary: HexColor('af9f30'),
                                elevation: 5,
                                // padding: EdgeInsets.symmetric(
                                //     vertical: 2.h, horizontal: 7.w),
                              ),
                              icon: Icon(
                                Icons.school,
                                size: 4.h,
                              ),
                              label: Text(
                                'Scholarship',
                                style: GoogleFonts.montserrat(
                                    textStyle: btnStyle,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.5.w,
                          ),
                          Container(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Admission()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                primary: HexColor('af9f30'),
                                elevation: 5,
                                // padding: EdgeInsets.symmetric(
                                //     vertical: 2.h, horizontal: 7.w),
                              ),
                              icon: Icon(
                                Icons.perm_contact_cal,
                                size: 4.h,
                              ),
                              label: Text(
                                'Admission',
                                style: GoogleFonts.montserrat(
                                    textStyle: btnStyle,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10.sp),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 2.5.w,
                          ),
                          Container(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => contactUs()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                primary: HexColor('061e47'),
                                elevation: 5,
                                // padding: EdgeInsets.symmetric(
                                //     vertical: 2.h, horizontal: 7.w),
                              ),
                              icon: Icon(
                                Icons.call,
                                size: 4.h,
                              ),
                              label: Text(
                                'Contact Us',
                                style: GoogleFonts.montserrat(
                                    textStyle: btnStyle,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 65.h,
                      width: width / 1.3,
                      margin:
                          EdgeInsets.only(left: 10.w, top: 10.h, bottom: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [],
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      margin: EdgeInsets.only(bottom: 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/BackBtn.png',
                          height: 10.h,
                          width: 10.w,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: HexColor('061e47'),
                height: 2.h,
                width: width,
              ),
            ],
          ),
        ));
  }
}
