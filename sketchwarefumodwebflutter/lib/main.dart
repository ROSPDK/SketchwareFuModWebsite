import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

 
class _MyAppState extends State<MyApp> { 
ThemeMode appThemeMode = ThemeMode.system;
 void changeAppTheme(ThemeMode themeMode) {
    setState(() {
      appThemeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sketchware Fu Mod',
      themeMode: appThemeMode,
      theme: ThemeData(
        fontFamily: 'GoogleSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        fontFamily: 'GoogleSans',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: Scaffold(
       appBar: AppBar(
        title: Text("Sketchware Fu Mod"),
        actions: [
        PopupMenuButton<int>(
                icon: Icon(Icons.dark_mode_outlined),
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                //onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text('System Theme'),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text('Light Theme'),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text('Dark Theme'),
                  ),
               ],
             ),
        ],
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
          backgroundImage: AssetImage('FuMod.png'), 
            radius: 50,
          ),   
           Text(
              'Sketchware Fu Mod',
              style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "No code, all awesome. Create epic apps with Sketchware Pro's magical blocks.",
              style: Theme.of(context).textTheme.headlineMedium,
             textAlign: TextAlign.center,
            ),
           Image.asset('mockup.png'),
          ],
        ),
      ),
     ),
    ),
   );
/*void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
      case 2:
     }
    }*/
  }
}

