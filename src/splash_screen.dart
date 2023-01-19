import 'package:flutter/material.dart';
import 'package:bmi_calculator/bmi_calc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    navigateToLoginScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.width/2,
          bottom: MediaQuery.of(context).size.width/2,
          left: 25,
          right: 25
      ),
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
          child: Image.asset('assets/bmi_icon.png',scale: 2,)

      ),
    );
  }

  void navigateToLoginScreen(BuildContext context)
  {
    Future.delayed(Duration(seconds: 2), (){
      Navigator.pushReplacement((context), MaterialPageRoute(builder: (context) => bmi_calc()));
    });
  }
}
