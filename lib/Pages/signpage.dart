import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Signpage extends StatefulWidget {
  const Signpage({super.key});

  @override
  State<Signpage> createState() => _SignpageState();
}

class _SignpageState extends State<Signpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey.withOpacity(0.5),
            height: 1.0,
          ),
        ),
        centerTitle: true,
        title: Text(
          "LogIn",
          style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  reusebleIcons(context, "assets/icons/google.png"),
                  reusebleIcons(context, "assets/icons/apple.png"),
                  reusebleIcons(context, "assets/icons/fecebook.png")
                ],
              ),
            ),
            reusebleText(context, "Or use your email account to login"),
            SizedBox(
              height: 80.h,
            ),
            Column(
              
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                reusebleText(context, "email"),
                reusableTextField(
                    Icons.person_2_outlined, ' please enter email', 'email'),
                reusebleText(context, "Password"),
                reusableTextField(
                    Icons.lock, ' please enter password', "password"),
                    forgetpaword(),
                    reusableButton("login", "Login"),
                    reusableButton('register', 'Register')
              ],
            )
          ],
        ),
      ),
    ));
  }

  Widget reusebleIcons(BuildContext context, stringIcons) {
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 40.h,
        width: 40.w,
        child: Image.asset(stringIcons),
      ),
    );
  }

  Widget reusebleText(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.only(left: 10.h),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.grey.withOpacity(0.3),
            fontSize: 16.sp,
            fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget reusableTextField(IconData prefixIcon, String hintline, String type) {
    return Container(
        width: 320.w,
        height: 50.h,
         margin: EdgeInsets.only(left: 10.h),
        child: TextField(
          autocorrect: false,
          obscureText: type == 'password' ? true : false,
          keyboardType: TextInputType.multiline,
          cursorHeight: 1.h,
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            hintText: hintline,
            hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.3),
                fontSize: 16.sp,
                fontWeight: FontWeight.normal),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
        ));
  }

  Widget forgetpaword() {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 260.w,
        height: 40.h,
      
        margin: EdgeInsets.only(left: 25.h,right: 25.h),
        child: Text(
          'Forget password?',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14.sp,
              decoration: TextDecoration.underline, decorationColor: Colors.black),
        ),
      ),
    );
  }

  Widget reusableButton(String buttonType, String text) {
    return Container(
      
      width: 325.h,
      height: 50.w,
      margin: EdgeInsets.only(top: buttonType == "login" ? 40.h : 20.h,
      left: 25.w,right: 25.w),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15.r),
          color: buttonType== 'login'?Colors.blue:Colors.grey,
           boxShadow: [
        BoxShadow(
            blurRadius: 1,
            spreadRadius: 2,
            offset: Offset(0, 1),
            color: Colors.grey.withOpacity(0.1))
      ]),
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: Colors.black),
      )),
    );
  }
}
