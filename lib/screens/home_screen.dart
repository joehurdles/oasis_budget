// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            return Container(height: 100.0,
            margin: EdgeInsets.all(8.0),
            color:Colors.red,
            );
          },
            childCount: 10,
          ),
          ),
        ],
      ),
    );
  }
}