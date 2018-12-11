// import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:minimal_footwear/main_page.dart';
import 'package:minimal_footwear/page_reveal.dart';
import 'package:minimal_footwear/welcome_screen.dart';

// final router = Router();

void main() {
  // router.define('/shoe/:i', handler: Handler(
  //   handlerFunc: (context, params) {
  //   },
  // ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController welcomeScreemController;
  AnimationController mainScreenController;

  @override
  void initState() {
    super.initState();
    welcomeScreemController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    )..addListener(() {
        setState(() {});
      });

    mainScreenController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    welcomeScreemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          WelcomeScreen(
            onPageOpen: () async {
              await welcomeScreemController.forward().orCancel;
              await mainScreenController.forward().orCancel;
            },
          ),
          PageReveal(
            child: MainPage(
              animation: mainScreenController,
            ),
            percentage: welcomeScreemController.value,
          ),
        ],
      ),
    );
  }
}
