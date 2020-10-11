import 'package:flutter/material.dart';
import 'package:printerest_layout/widgtes/menu_printerest.dart';
import 'package:printerest_layout/widgtes/printerest_grid.dart';
import 'package:provider/provider.dart';

class MainMenu extends StatelessWidget {
  final items = <PrinteresOptions>[
    PrinteresOptions(icon: Icons.print, onPressed: () => print('Pressed')),
    PrinteresOptions(icon: Icons.search, onPressed: () => print('Pressed')),
    PrinteresOptions(
        icon: Icons.notifications, onPressed: () => print('Pressed')),
    PrinteresOptions(
        icon: Icons.supervised_user_circle, onPressed: () => print('Pressed')),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Consumer<MenuPrinterestNotifier>(
        builder: (context, value, child) => Stack(children: [
          child,
          MenuPositioned(
            items: items,
            shouldShown: value.shouldShown,
          )
        ]),
        child: PrinterestGrid(),
      ));
}

class MenuPositioned extends StatelessWidget {
  const MenuPositioned({
    @required this.items,
    @required this.shouldShown,
  });

  final bool shouldShown;
  final List<PrinteresOptions> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: MenuPrinterest(items, shouldShown),
      ),
    );
  }
}

class MenuPrinterestNotifier extends ChangeNotifier {
  bool _shouldShown = true;

  get shouldShown => _shouldShown;

  void shouldShowMenu(bool v) {
    _shouldShown = v;
    notifyListeners();
  }
}
