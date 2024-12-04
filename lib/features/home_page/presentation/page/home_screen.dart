import 'package:flutter/material.dart';
import 'package:weather_home_screen/constant/common/date_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(children: [
          const SizedBox(height: 32,),
          Center(
            child: Text(
              getCurrentDate("EEEE, dd MMM"),
              style: const TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black45),
            ),
          )
        ]),
      ),
    );
  }
}
