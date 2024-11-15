import 'package:flutter/material.dart';
import 'package:trogon_e_coomerce/routes/app_routes.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    AppRoutes.goFromSplashScreen();
    return Scaffold(
      body: SizedBox(
        child: Image.asset(
          'assets/splashimage.jpg',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
