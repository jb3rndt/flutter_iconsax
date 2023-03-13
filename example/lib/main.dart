import 'package:example/icons.dart';
import 'package:flutter/material.dart';

Map<String, List<Icon>> iconSets = {
  "Linear": linear,
  "Bold": bold,
  "Broken": broken,
};

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Iconsax Demo"),
          bottom: TabBar(
            tabs: iconSets.keys.map((key) => Tab(text: key)).toList(),
          ),
        ),
        body: TabBarView(
          children: iconSets.values
              .map((value) => Scrollbar(
                    thickness: 10,
                    child: GridView.builder(
                      padding: const EdgeInsets.all(8),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 10,
                        crossAxisSpacing: 4,
                      ),
                      itemCount: value.length,
                      itemBuilder: (context, index) => value[index],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
