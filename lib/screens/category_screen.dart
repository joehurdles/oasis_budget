import 'package:flutter/material.dart';
import 'package:oasis_budget/helpers/color_helper.dart';
import 'package:oasis_budget/models/category_model.dart';
import 'package:oasis_budget/models/expense_model.dart';
import 'package:oasis_budget/widgets/radial_painter.dart';

class CartegoryScreen extends StatefulWidget {
   
final Category category;

 const CartegoryScreen({ required this.category });
  @override
  State<CartegoryScreen> createState() => _CartegoryScreenState();
}

class _CartegoryScreenState extends State<CartegoryScreen> {

_buildExpenses() {
  List<Widget> expenseList = [];
  widget.category.expenses.forEach((Expense expense) {
    expenseList.add(Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              expense.name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('-₵${expense.cost.toStringAsFixed(2)}',
             style: const TextStyle(
               color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    ));
   });
   return Column(
     children: expenseList,
   );
}

  @override
  Widget build(BuildContext context) {
double totalAmountSpent = 0;
widget.category.expenses.forEach((Expense expense) {
  totalAmountSpent += expense.cost;
});
final double amountLeft = widget.category.maxAmount - totalAmountSpent;
final double percent = amountLeft / widget.category.maxAmount;


    return Scaffold(
     appBar: AppBar(
       backgroundColor: Colors.green,
       title: Text(widget.category.name),
       actions: [IconButton(onPressed: (){}, 
       icon: const Icon(Icons.add),
       iconSize: 30,
       ),
       ],
     ),
     body: SingleChildScrollView(
       child: Column(
         children: [
           Container(
             margin: const EdgeInsets.all(20.0),
             padding: const EdgeInsets.all(20.0),
             height: 250,
             width: double.infinity,
             decoration: BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.circular(10.0),
               boxShadow: const [
                 BoxShadow(color: Colors.black12,
                 offset: Offset(0, 2),
                 blurRadius: 6.0 
                 ),
               ]
             ),
             child: CustomPaint(
               foregroundPainter: RadialPainter(
                 bgColor:Colors.grey,
                 lineColor: getColor(context, percent),
                 percent: percent,
                 width: 15.0
                  ),
               child:
                 Center(
                   child: Text(
                   '₵${amountLeft.toStringAsFixed(2)}/ ₵${widget.category.maxAmount}',
                   style: const TextStyle(
                     fontSize: 19.0,
                     fontWeight: FontWeight.w600,
                   ),
                   ),
                 ),
             ),
           ),
           _buildExpenses(),
         ],
       )
        ), 
    );
  }
}