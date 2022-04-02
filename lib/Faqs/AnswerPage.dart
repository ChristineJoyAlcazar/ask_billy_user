import 'package:abigail_askbilly/Faqs/Faqshome.dart';
import 'package:abigail_askbilly/HomePage/Homepage.dart';
import 'package:abigail_askbilly/LoadingPage/Loadingpage.dart';
import 'package:abigail_askbilly/Maps/Mapshome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../MenuBar.dart';
import '../Classes/Office.dart';
import '../Classes/Question.dart';
import 'package:video_player/video_player.dart';

class AnswerPage extends StatefulWidget {
  final Question question;
  final Office office;
  final String officeName;
  final int index;
  AnswerPage(
      {required this.question,
      required this.officeName,
      required this.index,
      required this.office});

  @override
  State<AnswerPage> createState() => _AnswerPageState();
}

enum TtsState { playing, stopped, paused, continued }

class _AnswerPageState extends State<AnswerPage> {
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  final titleStyle = TextStyle(fontSize: 6.h, color: HexColor('061e47'));
  final styleText = TextStyle(fontSize: 2.2.h, color: HexColor('061e47'));
  final answerText = TextStyle(fontSize: 4.h, color: HexColor('061e47'));
  late FlutterTts flutterTts;
  late VideoPlayerController _controller;
  TtsState ttsState = TtsState.playing;

  Future _speak(String question) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(-2);
    await flutterTts.speak(question);
  }

  @override
  void initState() {
    _controller = VideoPlayerController.network('assets/Untitled.mp4');
    _controller.setLooping(true);
    _controller.addListener(() {});
    _controller.initialize().then((_) => setState(() {}));

    initTts();
    _speak(widget.question.answer);

    super.initState();
  }

  initTts() {
    flutterTts = FlutterTts();
    _setAwaitOptions();

    flutterTts.setStartHandler(() {
      setState(() {
        print("Playing");
        _controller.play();
        ttsState = TtsState.playing;
      });
    });

    flutterTts.setCompletionHandler(() {
      setState(() {
        _controller.setLooping(false);
        _controller.pause();
        ttsState = TtsState.stopped;
      });
    });

    flutterTts.setCancelHandler(() {
      setState(() {
        _controller.setLooping(false);
        _controller.pause();
        ttsState = TtsState.stopped;
      });
    });

  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts.pause();
    flutterTts.stop();
    _controller.pause();
  }

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
                  Expanded(
                    child: Text(
                      widget.officeName,
                      style: GoogleFonts.montserrat(
                          textStyle: titleStyle, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 10.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          widget.office.location,
                          style: GoogleFonts.montserrat(
                              textStyle: styleText,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.office.office_hours,
                          style: GoogleFonts.montserrat(
                              textStyle: styleText,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.office.office_email,
                          style: GoogleFonts.montserrat(
                              textStyle: styleText,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
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
                    decoration: BoxDecoration(
                      color: HexColor('dee7f0'),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    // padding: EdgeInsets.only(right: 10.sp, bottom: 10.sp),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.sp,
                        ),
                        _question(widget.question.question),
                        Container(
                          height: 45.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 55.h,
                                width: 30.w,
                                color: Colors.white,
                                alignment: Alignment.center,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                      ),
                                      VideoPlayer(_controller)
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 60.h,
                                width: .5.w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: HexColor('af9f30')),
                              ),
                              Container(
                                height: 55.h,
                                width: 45.w,
                                color: Colors.white,           alignment: Alignment.center,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        widget.question.answer,
                                        style: GoogleFonts.montserrat(
                                            textStyle: answerText,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
      ),
    );
  }

  Widget _question(String question) {
    return Container(
      margin: EdgeInsets.only(bottom: 3.h, left: 10.w, right: 10.w),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ButtonStyle(
          shape: MaterialStateProperty.resolveWith(
            (states) => RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.0),
            ),
          ),
          textStyle: MaterialStateProperty.resolveWith(
            (states) => TextStyle(fontSize: 6.sp, color: Colors.white),
          ),
          elevation: MaterialStateProperty.resolveWith((states) => 5.0),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) {
                return HexColor('061e47');
              }
              return HexColor('af9f30');
            },
          ),
        ),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Text(
            widget.question.question,
          ),
        ),
      ),
    );
  }
}