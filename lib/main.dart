import 'package:flutter/material.dart';
import 'package:printerest_layout/screens/main_menu.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MenuPrinterestNotifier(),
      child: MaterialApp(
        title: 'Printerest Layout',
        home: MainMenu(),
      ),
    );
  }
}
