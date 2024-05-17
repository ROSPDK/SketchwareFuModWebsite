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
        fontFamily: 'GoogleSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Sketchware Fu Mod'),
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
                  ),
            ),
       ),
          const SizedBox(height: 22),
          for (var i = 0; i < 4; i++)
            NavigationDrawerDestination(
              icon: const Icon(Icons.home_outlined),
              selectedIcon: const Icon(Icons.home),
              label: Text('Home'),
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
           Text(
              'Sketchware Fu Mod',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              "No code, all awesome. Create epic apps with Sketchware Pro's magical blocks.",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
           Image.asset('mockup.png'),
          ],
        ),
      ),
    ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),*/
    );
  }
}
