import 'package:flutter/material.dart';
import 'package:flutter_ui/components/Card.dart';
import 'package:flutter_ui/components/GridCounter.dart';
import 'package:flutter_ui/components/ImageNetwork.dart';
import 'package:flutter_ui/components/ImageWithLoading.dart';
import 'package:flutter_ui/components/SpaceItemsList.dart';

class TabBarHead extends StatelessWidget {
  const TabBarHead({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.directions_boat)),
                Tab(icon: Icon(Icons.directions_walk)),
              ],
            ),
            title: const Text('Tabs Demo'),
          ),
          body: const TabBarView(
            children: [
              ImageWithLoading(),
              ImageNetwork(),
              GridCounter(),
              SpacedItemsList(
                items: 100,
              ),
              CCard(),
            ],
          ),
        ),
      ),
    );
  }
}