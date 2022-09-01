import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/screens/home_screen.dart';
import 'package:test_app/viewmodel/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageView()),
      ],
        child: MaterialApp(
          theme: ThemeData(primaryColor: Color(0xffE5E5E5), appBarTheme: AppBarTheme(elevation: 0, color: Color(0xff2D5368) )),
          home: HomePage(),));
  }
}

