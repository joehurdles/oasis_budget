// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:oasis_budget/data/data.dart';
import 'package:oasis_budget/models/category_model.dart';
import 'package:oasis_budget/models/expense_model.dart';
import 'package:oasis_budget/widgets/bar_chart.dart';
import 'package:oasis_budget/helpers/color_helper.dart';
import 'package:oasis_budget/screens/category_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  _buildCategory(Category category, double totalAmountSpent) {
return GestureDetector(
  onTap: () {
               Navigator.push(
               context, MaterialPageRoute(builder: (_) => CartegoryScreen(category: category),
                    ),
               );
  },
  
  child:
        Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    padding: EdgeInsets.all(20),
    height: 100.0,
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
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(category.name,
            style: TextStyle(
              fontSize: 19.0,
              fontWeight: FontWeight.w600,
            ),
             ),
    
            Text('₵${(category.maxAmount - totalAmountSpent).toStringAsFixed(2)}/ ₵${(category.maxAmount).toStringAsFixed(2)}',
             style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
            ),
          ],
        ),
         SizedBox(height: 10,),
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
         final double maxBarWidth = constraints.maxWidth;
         final double percent = (category.maxAmount - totalAmountSpent) / category.maxAmount;
         double barWidth = percent * maxBarWidth;
    
        if (barWidth < 0) {
          barWidth =0;
        }
        return Stack(
            children: [
              Container(
                height: 20.0,
              decoration: BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(15),
              ),
              ),
                Container(
                height: 20.0,
                width: barWidth,
              decoration: BoxDecoration(
    color:getColor(context, percent),
    borderRadius: BorderRadius.circular(15),
              ),
              ),
            ],
            );
          },
        ),
          ],
        ),   
    ),
);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.green,
            forceElevated: true,
            floating: true,
            expandedHeight: 100,
            leading: IconButton(onPressed: (){}, icon: const Icon(Icons.settings),iconSize: 30,
            ),
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Oasis Budget',textAlign: TextAlign.center),
            ),
           actions: <Widget>[
             IconButton(onPressed: (){}, icon: const Icon(Icons.add),iconSize: 30,
            ),
           ],
        ),
         SliverList(delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index){
            if (index == 0) {
            return Container(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
            decoration: BoxDecoration(
              color:Colors.white,
              boxShadow: const [
                BoxShadow(
                  color:Colors.black12,
                  offset:Offset(0, 2),
                  blurRadius: 6.0,
                )
              ],
              borderRadius: BorderRadius.circular(10)
            ),
            child:BarChart(weeklySpending),
            );
            }
            else{ 
              final Category category = categories[index - 1];
              double totalAmountSpent = 0;
              category.expenses.forEach((Expense expense) {
            totalAmountSpent += expense.cost;
              });
              return _buildCategory(category, totalAmountSpent);
            }
          },
            childCount: 1 + categories.length,
          ),
          ),
        ],
      ),
    );
  }
}