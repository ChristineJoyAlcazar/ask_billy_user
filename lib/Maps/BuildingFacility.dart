import 'package:abigail_askbilly/Faqs/Faqshome.dart';
import 'package:abigail_askbilly/HomePage/Homepage.dart';
import 'package:abigail_askbilly/Maps/Mapshome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import '../Classes/Facility.dart';
import '../MenuBar.dart';
import 'mainBuilding.dart';

class BuildingFacility extends StatefulWidget {
  final String floor_number;
  final Facility facility;

  const BuildingFacility({required this.floor_number, required this.facility});
  @override
  State<BuildingFacility> createState() => _BuildingFacilityState();
}

class _BuildingFacilityState extends State<BuildingFacility> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  final titleStyle = TextStyle(fontSize: 6.h, color: HexColor('061e47'));
  final styleText = TextStyle(fontSize: 3.h, color: Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawerScrimColor: Colors.transparent,
        key: _scaffoldKey,
        drawer: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: menuBar(),
        ),
        body: Container(
          height: 100.h,
          width: 100.w,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(6),
                width: 100.w,
                height: 12.h,
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
                        height: 7.h,
                      ),
                      onTap: () {
                        _scaffoldKey.currentState?.openDrawer();
                      },
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Container(
                        padding: EdgeInsets.all(0.5.sp),
                        child: Text(
                          widget.floor_number,
                          style: GoogleFonts.montserrat(
                              textStyle: titleStyle,
                              fontWeight: FontWeight.bold),
                        )),
                    Container(
                      margin: EdgeInsets.only(left: 1.w, right: 1.w),
                      height: 5.h,
                      width: .4.w,
                      color: HexColor('061e47'),
                    ),
                    Container(
                        padding: EdgeInsets.all(0.5.sp),
                        child: Text(
                          widget.facility.facility_name,
                          style: GoogleFonts.montserrat(
                              textStyle: titleStyle,
                              fontWeight: FontWeight.bold),
                        )),
                    Expanded(
                      child: Container(),
                    ),
                    Image.asset('assets/logo.png'),
                  ],
                ),
              ), //TOPBAR
              Container(
                color: HexColor('af9f30'),
                height: 2.h,
                width: 100.w,
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
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10.w, top: 4.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white),
                      height: 75.h,
                      width: 80.w,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(children: [
                            Image.asset(
                              'assets/MapsPage/MainBuilding/My Video.gif',
                              width: 47.w,
                              fit: BoxFit.contain,
                            ),
                          ]),
                          Container(
                            height: 75.h,
                            width: .5.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                color: HexColor('af9f30')),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 37.h,
                                width: 32.5.w,
                                alignment: Alignment.center,
                                //margin: EdgeInsets.only(left: 2.sp),

                                child: Image.asset(
                                  'assets/MapsPage/MB.png',
                                  width: 67.w,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              Container(
                                height: 1.h,
                                width: 32.5.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: HexColor('af9f30')),
                              ),
                              Container(
                                height: 37.h,
                                width: 32.5.w,
                                alignment: Alignment.center,
                                // margin: EdgeInsets.only(left: 2.sp),
                                padding: EdgeInsets.all(2.sp),

                                child: Text(
                                  widget.facility.facility_description,
                                  style: GoogleFonts.montserrat(
                                      textStyle: styleText,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                        ],
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
                width: 100.w,
              ),
            ],
          ),
        ));
  }
}