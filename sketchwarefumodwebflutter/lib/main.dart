import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sketchware Fu Mod',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: NavigationDrawer(children: [
          DrawerHeader(
          child: Container(
          child: SvgPicture.asset(
                    'swpro.svg',
                     semanticsLabel: 'SW Pro Logo',
                    //width: 10,
                  ),
            ),
       ),
          const SizedBox(height: 22),
          for (var i = 0; i < 30; i++)
            NavigationDrawerDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home),
              label: Text('Item $i'),
            ),
        ]),
      body: Center(
      child: SingleChildScrollView(  
      child: Column(
mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          CircleAvatar(
          backgroundColor: Colors.transparent,  
          backgroundImage: AssetImage('FuMod.png'), ///Your image here  from pubspec.yaml
            radius: 50,
          ),   
           const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
           Image.asset('mockup.png'),
          ],
        ),
      ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
