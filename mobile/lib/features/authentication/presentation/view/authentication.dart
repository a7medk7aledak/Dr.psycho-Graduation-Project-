import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/const/image_app.dart';
class Authentication extends StatelessWidget {
  const Authentication({super.key});
  // static const id = '/splash';

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    double getWidth(double width) => screenWidth * (width / 392.72727272727275);
    double getHeight(double height) =>
        screenHeight * (height / 777.4545454545455);

    // Reusable button widget
    Widget buildElevatedButton({
      required String title,
      required VoidCallback onPressed,
    }) {
      return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(getWidth(300), getHeight(50)),
          backgroundColor: primaryColor,
          elevation: 5,
          shadowColor: Colors.black,
        ),
        child: Text(
          title,
          style: TextStyle(color: secoundryColor, fontSize: getWidth(16)),
        ),
      );
    }

    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/SplashScreen.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            children: [
              // App Title
              Text(
                'Vitapsyche',
                style: TextStyle(
                  fontSize: 30.sp,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              // App Logo
              Image.asset(
                logoApp,
                height: 170,
                width: 170,
              ),
              // Subtitle
              Text(
                'The journey to healing \nstarts here...',
                style: TextStyle(
                    color: mainBlueColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.h,
              ),
              // Buttons
              buildElevatedButton(
                title: 'Sign in',
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.signinScreen),
              ),
              SizedBox(
                height: 20.h,
              ),
              buildElevatedButton(
                title: 'Sign up',
                onPressed: () =>
                    Navigator.of(context).pushNamed(AppRoutes.signupScreen),
              ),
              // Divider with "or"
              Padding(
                padding: EdgeInsets.symmetric(vertical: getHeight(20.0)),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: getWidth(50),
                        endIndent: getWidth(10),
                      ),
                    ),
                    Text(
                      "or",
                      style:
                          TextStyle(color: Colors.grey, fontSize: getWidth(16)),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        indent: getWidth(10),
                        endIndent: getWidth(50),
                      ),
                    ),
                  ],
                ),
              ),
              // Guest Mode Button
              buildElevatedButton(
                title: 'Continue as Guest',
                onPressed: () {
                  // AuthService.logout();
                  Navigator.of(context).pushNamed(AppRoutes.mainNavigationScreen);
                },
              ),
              // Language Selector
              Padding(
                padding: EdgeInsets.only(top: getHeight(30)),
                child: SizedBox(
                  width: getWidth(150),
                  child: Center(
                    child: OutlinedButton(
                      onPressed: () {
                        // Handle language change
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: primaryColor, width: 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // English Flag
                          Image.asset(
                            'assets/images/download__1_-removebg-preview.png',
                            width: getWidth(24),
                            height: getHeight(24),
                          ),
                          SizedBox(width: getWidth(8)),

                          Text(
                            'English',
                            style: TextStyle(
                                color: primaryColor, fontSize: getWidth(14)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
