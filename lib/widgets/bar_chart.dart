import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:oasis_budget/data/data.dart';

class BarChart extends StatelessWidget {
  
final List<double> expenses;

BarChart(this.expenses);

  @override
  Widget build(BuildContext context) {
double mostExpensive = 0;
expenses.forEach((double price) {
  if (price > mostExpensive) {
    mostExpensive = price;
  }
});

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column (
        children:  <Widget> [
          const Text('Weekly Spending',
           style: TextStyle(fontSize: 18, 
           fontWeight: FontWeight.bold, 
           letterSpacing: 1.2,),
           ),
      const SizedBox(height: 5,),
  
  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
          onPressed: (){}, 
        icon:const Icon(Icons.arrow_back),
        iconSize: 30.0,
        ),

        const Text('April 4, 2022 - April 11, 2022',
        style: TextStyle(fontWeight: FontWeight.w600,
        fontSize: 13.0,
        letterSpacing: 1.0),
        ),

        IconButton(
        icon: const Icon(Icons.arrow_forward),
        iconSize: 30.0,
        onPressed: (){}, 
        ),
      ],
  ),
  const SizedBox(height: 30.0,),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  crossAxisAlignment: CrossAxisAlignment.end,
  children: [
      Bar(label:'Su',
      amountSpent:expenses[0], 
      mostExpensive: mostExpensive,
      ),

       Bar(label:'Mo',
      amountSpent:expenses[1], 
      mostExpensive: mostExpensive,
      ),

       Bar(label:'Tu',
      amountSpent:expenses[2], 
      mostExpensive: mostExpensive,
      ),

       Bar(label:'We',
      amountSpent:expenses[3], 
      mostExpensive: mostExpensive,
      ),

       Bar(label:'Th',
      amountSpent:expenses[4], 
      mostExpensive: mostExpensive,
      ),

       Bar(label:'Fr',
      amountSpent:expenses[5], 
      mostExpensive: mostExpensive,
      ),

       Bar(label:'Sa',
      amountSpent:expenses[6], 
      mostExpensive: mostExpensive,
      ),
  ],
),
   ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  const Bar({ Key? key, required this.label, required this.amountSpent, required this.mostExpensive }) : super(key: key);

final String label;
final double amountSpent;
final double mostExpensive;

final double _maxBarHeight = 150.0;

//  Bar({required this.label, required this.amountSpent, required this.mostExpensive}); 
  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: [
       Text('\₵${amountSpent.toStringAsFixed(2)}',
       style: const TextStyle(
         fontWeight: FontWeight.w600
       ),
       ),
       const SizedBox(height:6.0),
       Container(
         height: barHeight,
         width: 12.0,
         decoration: BoxDecoration(
           color:Theme.of(context).primaryColor,
           borderRadius: BorderRadius.circular(6.0),
         ),
       ),
       const SizedBox(height:8.0),
       Text(label,
       style: const TextStyle(
         fontWeight: FontWeight.w600,
         fontSize: 15.0,
       ),
       ), 
      ],  
    );
  }
}