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
/* void changeAppTheme(ThemeMode themeMode) {
    setState(() {
      appThemeMode = themeMode;
    });
  } */

  var listTheme = "System Theme";

  _showAppThemeDialog() {
    final SetListTiles _setListTiles = new SetListTiles(
      listTheme: listTheme,
    );

    return showDialog(
      context: context,
  builder: (BuildContext cx) {
      return AlertDialog(
        title: Text('App Theme'),
        content: new SingleChildScrollView(
          child: Column(
            children: [
              _setListTiles,
            ],
          ),
        ),
      },
    ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                listTheme = _setListTiles.listTheme;
              });
              Navigator.pop(context);
            },
            child: Text('OK'),
          ),
        ],
      ),
     ),
    );
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
        IconButton(
        icon: Icon(Icons.dark_mode_outlined),
        onPressed: _showAppThemeDialog(),
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
  }
}

class SetListTiles extends StatefulWidget {
  String listTheme;
  SetListTiles({Key? key, this.listTheme}) : super(key: key);

  @override
  State<SetListTiles> createState() => _SetListTilesState();
}

class _SetListTilesState extends State<SetListTiles> {
void changeAppTheme(ThemeMode themeMode) {
    setState(() {
      ThemeMode appThemeMode = themeMode;
    });
  }
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('System Theme'),
          leading: new Radio(
            value: "System Theme",
            groupValue: widget.listTheme,
            onChanged: (String? selectedTheme) {
              setState(() {
                widget.listTheme = selectedTheme;
                changeAppTheme(ThemeMode.system);
              });
            },
          ),
        ),
        ListTile(
          title: Text('Light Theme'),
          leading: new Radio(
            value: "Light Theme",
            groupValue: widget.listTheme,
            onChanged: (String? selectedTheme) {
              setState(() {
                widget.listTheme = selectedTheme;
                changeAppTheme(ThemeMode.light);
              });
            },
          ),
        ),
        ListTile(
          title: Text('Dark Theme'),
          leading: new Radio(
            value: "Dark Theme",
            groupValue: widget.listTheme,
            onChanged: (String? selectedTheme) {
              setState(() {
                widget.listTheme = selectedTheme;
                changeAppTheme(ThemeMode.dark);
              });
            },
          ),
        ),
      ],
    );
    }
  }
