import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:motus_client/global/themes/textTheme.dart';
import 'package:provider/provider.dart';

import 'Widgets/floatingActionBtn.dart';
import 'Widgets/navBar.dart';
import 'Widgets/topAppBar.dart';
import 'global/themes/colorScheme.dart';
import 'views/dictionary.dart';
import 'views/friends.dart';
import 'views/home.dart';
import 'views/search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: DynamicColorBuilder(
          builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic){
            ColorScheme appLightColorScheme;
            ColorScheme appDarkColorScheme;
            if(lightDynamic != null && darkDynamic != null ){
              appLightColorScheme = lightColorScheme.copyWith(
                primary: lightDynamic.primary.harmonizeWith(lightColorScheme.primary),
                secondary: lightDynamic.secondary.harmonizeWith(lightColorScheme.primary),
                onPrimary: lightDynamic.onPrimary.harmonizeWith(lightColorScheme.primary),
                onSecondary: lightDynamic.onSecondary.harmonizeWith(lightColorScheme.primary),
              );
              appDarkColorScheme = darkColorScheme.copyWith(
                primary: darkDynamic.primary.harmonizeWith(darkColorScheme.primary),
                secondary: darkDynamic.secondary,
                onSecondary: darkDynamic.onSecondary,
                onPrimary: darkDynamic.onPrimary,
              );
              
            } else {
              appLightColorScheme = lightColorScheme;
              appDarkColorScheme = darkColorScheme;
            }
            return MaterialApp(
              theme: ThemeData(
                colorScheme: appLightColorScheme,
                useMaterial3: true,
                textTheme: myTextTheme,
              ),
              darkTheme: ThemeData(
                colorScheme: appDarkColorScheme,
                useMaterial3: true,
                textTheme: myTextTheme,
              ),
              home: BasePage(title: "motus")
            );
          }
      ),
    );
  }
}

class MyAppState extends ChangeNotifier{
  var selectedPageIndex = 0;

  void setSelectedPageIndex(var selectedPage){
    selectedPageIndex = selectedPage;
    notifyListeners();
  }
}


class BasePage extends StatefulWidget {
  const BasePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var index = appState.selectedPageIndex;
        Widget page;
    switch (index){
      case 0:
        page = Home();
        break;
      case 1:
        page = Friends();
        break;
      case 2:
        page = Dictionary();
        break;
      default:
        throw UnimplementedError('No widget for $index');
    }
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: TopAppBar()
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:page
      ),
      floatingActionButton: FloatingActionBtn(),
      bottomNavigationBar: NavBar(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


