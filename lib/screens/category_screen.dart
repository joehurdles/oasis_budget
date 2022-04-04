import 'package:flutter/material.dart';
import 'package:oasis_budget/models/category_model.dart';

class CartegoryScreen extends StatefulWidget {
   
final Category category;

 const CartegoryScreen({ required this.category });
  @override
  State<CartegoryScreen> createState() => _CartegoryScreenState();
}

class _CartegoryScreenState extends State<CartegoryScreen> {
  @override
  Widget build(BuildContext context) {
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
                 blurRadius: 6.0 )
               ]
             ),
           )
         ],
       )
        ), 
    );
  }
}