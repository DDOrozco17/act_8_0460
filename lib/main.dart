import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const TabBarExample(),
    );
  }
}

class TabBarExample extends StatefulWidget {
  const TabBarExample({Key? key}) : super(key: key);

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Cambié el color a verde
        title: const Text(
          'Papeleria Diaz 0460',
          style: TextStyle(color: Colors.white),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(
                Icons.create,
                color: Colors.white,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.auto_fix_high,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Center(
            child: Image.asset(
              "assets/images/marcadorhome.png",
              width: 400,
              height: 300,
              fit: BoxFit.contain,
              frameBuilder: (context, child, frame, loaded) {
                if (loaded) {
                  return child;
                }
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/marcatextoshome.png",
              width: 400,
              height: 300,
              fit: BoxFit.contain,
              frameBuilder: (context, child, frame, loaded) {
                if (loaded) {
                  return child;
                }
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
            ),
          ),
          Center(
            child: Image.asset(
              "assets/images/pegamento.png",
              width: 400,
              height: 300,
              fit: BoxFit.contain,
              frameBuilder: (context, child, frame, loaded) {
                if (loaded) {
                  return child;
                }
                return AnimatedOpacity(
                  opacity: frame == null ? 0 : 1,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeOut,
                  child: child,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
