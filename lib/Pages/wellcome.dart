import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterbloc/Pages/myHomepage.dart';
import 'package:flutterbloc/bloc/wellcome/wellbloc.dart';
import 'package:flutterbloc/bloc/wellcome/wellcome_event.dart';
import 'package:flutterbloc/bloc/wellcome/wellcome_state.dart';

class Wellcome extends StatefulWidget {
  const Wellcome({super.key});

  @override
  State<Wellcome> createState() => _WellcomeState();
}

class _WellcomeState extends State<Wellcome> {
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
          backgroundColor: Colors.white,
          body: BlocBuilder<Wellbloc, WellcomeState>(
            builder: (context, state) {
              return Container(
                margin: EdgeInsets.only(top: 34.h),
                width: 375.w,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView(
                      controller: controller,
                      onPageChanged: (index) {
                        state.page = index;
                        BlocProvider.of<Wellbloc>(context).add(WellcomeEvent());
                      },
                      children: [
                        _pages(
                            1,
                            context,
                            "First see Learning",
                            "Forget about a for  of  paper all knowledge in on learinig",
                            'next',
                            'assets/images/learn2.png'),
                        _pages(
                            2,
                            context,
                            "Connnect with Everone",
                            "Always keep touch with your tutor & friend. let's get connected",
                            'next',
                            'assets/images/learn2.png'),
                        _pages(
                            3,
                            context,
                            "Alaways Fasineted Learning",
                            "Anywhere,anytime,the time is your discretion so study whenever you want",
                            'get started',
                            'assets/images/learn2.png'),
                      ],
                    ),
                    Positioned(
                        bottom: 70.h,
                        child: DotsIndicator(
                          position: state.page.toDouble(),
                          dotsCount: 3,
                          mainAxisAlignment: MainAxisAlignment.center,
                          decorator: const DotsDecorator(
                            color: Colors.grey,
                            activeColor: Colors.blue,
                            size: Size.square(8.0),
                            activeSize: Size.square(10.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3))),
                          ),
                        ))
                  ],
                ),
              );
            },
          )),
    );
  }

  Widget _pages(int index, BuildContext context, String title, String subtitle,
      String Buttonname, String imagepath) {
    return Column(
      children: [
        SizedBox(
            width: 345.w,
            height: 345.h,
            child: Image.asset(
              imagepath,
            )),
        Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold),
        ),
        Container(
          width: 375.w,
          padding: EdgeInsets.only(left: 30.w, right: 30.w),
          child: Text(
            subtitle,
            style: TextStyle(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.5),
                fontSize: 12.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeIn,
              );
            } else {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Myhomepage()));
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 90.h, left: 25.w, right: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: Offset(0, 1),
                    spreadRadius: 1,
                    blurRadius: 2,
                  )
                ]),
            child: Center(
              child: Text(
                Buttonname,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    );
  }
}
