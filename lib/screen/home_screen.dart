import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class HomeScreen extends HookWidget {
  HomeScreen({Key? key}) : super(key: key);

  final _tab = <Tab>[
    Tab(text: 'Car', icon: Icon(Icons.directions_car)),
    Tab(text: 'Bicycle', icon: Icon(Icons.directions_bike)),
    Tab(text: 'Boat', icon: Icon(Icons.directions_boat)),
  ];

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tab.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ホーム'),
          bottom: TabBar(
            tabs: _tab,
          ),
        ),
        body: TabBarView(children: <Widget>[
          TabPage(title: 'Car', icon: Icons.directions_car),
          TabPage(title: 'Bicycle', icon: Icons.directions_bike),
          TabPage(title: 'Boat', icon: Icons.directions_boat),
        ]),
      ),
    );
  }
}

class TabPage extends StatelessWidget {
  final IconData icon;
  final String title;

  const TabPage({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(icon, size: 64),
          Text(
            title,
          ),
        ],
      ),
    );
  }
}
