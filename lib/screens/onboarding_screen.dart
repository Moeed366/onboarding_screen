import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../utilities/styles.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0.w),
      height: 8.0.h,
      width: isActive ? 24.0.w : 16.0.w,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Color(0xFF7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.4, 0.7, 0.9],
                colors: [
                  Color(0xFF3594DD),
                  Color(0xFF4563DB),
                  Color(0xFF5036D5),
                  Color(0xFF5B16D0),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 30.0.h),
              child: Stack(alignment: Alignment.center,
               // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Positioned(top: 10.h,right: 10.w,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => print('Skip'),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(bottom: 20.h,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _buildPageIndicator(),
                      ),
                    ),
                  ),
                  Container(
                    height: double.maxFinite,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/onboarding0.png',
                                  ),
                                  height: 300.0.h,
                                  width: 300.0.w,
                                ),
                              ),
                              SizedBox(height: 30.0.h),
                              Text(
                                'Connect people\naround the world',
                                style: kTitleStyle,
                              ),
                              SizedBox(height: 15.0.h),
                              Text(
                                'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                                style: kSubtitleStyle,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/onboarding1.png',
                                  ),
                                  height: 300.0.h,
                                  width: 300.0.w,
                                ),
                              ),
                              SizedBox(height: 30.0.h),
                              Text(
                                'Live your life smarter\nwith us!',
                                style: kTitleStyle,
                              ),
                              SizedBox(height: 15.0.h),
                              Text(
                                'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                                style: kSubtitleStyle,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/onboarding2.png',
                                  ),
                                  height: 300.0.h,
                                  width: 300.0.w,
                                ),
                              ),
                              SizedBox(height: 30.0.h),
                              Text(
                                'Get a new experience\nof imagination',
                                style: kTitleStyle,
                              ),
                              SizedBox(height: 15.0.h),
                              // Text(
                              //   'Lorem ipsum dolor sit amet, consect adipiscing elit, sed do eiusmod tempor incididunt ut labore et.',
                              //   style: kSubtitleStyle,
                              // ),
                              // SizedBox(height: 10.0.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),



                  _currentPage != _numPages - 1
                      ? Positioned(bottom: 0,right: 0,
                        child: Container(
                            child: TextButton(
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Next',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0.sp,
                                    ),
                                  ),
                                  SizedBox(width: 10.0.w),
                                  Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                    size: 30.0,
                                  ),
                                ],
                              ),
                            ),
                          ),
                      )
                      : Text(''),
                ],
              ),
            ),
          ),
        ),


        bottomSheet: _currentPage == _numPages - 1
            ?

        Container(color: Colors.transparent,
          height: 60.0.h,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 30.w,vertical: 15.h),
          child: Container(color: Colors.transparent,
            child: Ink(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xff00b09b), Color(0xff96c93d)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(28.0.r)
              ),
              child: Container(
                constraints: BoxConstraints(maxWidth: 280.0, minHeight: 52.0),
                alignment: Alignment.center,
                child: Text(
                  " Let's Go",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.w800,fontSize: 22.sp,
                      color: Colors.white
                  ),
                ),
              ),
            ),
          ),)




            : null,
      ),
    );
  }












}

