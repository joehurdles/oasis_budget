import 'package:flutter/material.dart';
import 'package:oasis_budget/screens/home_screen.dart';


void main() {
  runApp(const OasisBudget());
}

class OasisBudget extends StatelessWidget {
  const OasisBudget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oasis Budget',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),


      home: HomeScreen(),


    );
  }
}