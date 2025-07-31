import 'package:flutter/material.dart';

class lab15_1 extends StatefulWidget {
  const lab15_1({super.key});

  @override
  State<lab15_1> createState() => _lab15_1State();
}

class _lab15_1State extends State<lab15_1> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Tab View"),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Column(
                    children: [
                      Icon(Icons.home),
                      Text("Home"),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    children: [
                      Icon(Icons.info),
                      Text("About US"),
                    ],
                  ),
                ),
                Tab(
                  child: Column(
                    children: [
                      Icon(Icons.call),
                      Text("Contact US"),
                    ],
                  ),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text("home"),
              ),
              Center(
                child: Text("About US"),
              ),
              Center(
                child: Text("Contact US"),
              ),
            ],
          ),
        ));
  }
}
