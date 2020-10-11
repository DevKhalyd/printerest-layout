import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PrinteresOptions {
  final VoidCallback onPressed;
  final IconData icon;

  const PrinteresOptions({
    this.onPressed,
    this.icon,
  });
}

class MenuPrinterest extends StatelessWidget {
  ///Items to be displayed in the mainscreee
  final List<PrinteresOptions> items;
  final bool shouldShown;

  const MenuPrinterest(this.items, [this.shouldShown = true]);

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => ItemPrinterestHandler(),
      builder: (_, c) => AnimatedOpacity(
            opacity: shouldShown ? 1 : 0,
            duration: Duration(
              milliseconds: 250,
            ),
            child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurRadius: 5.0,
                          spreadRadius: -5)
                    ]),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: _PrinterestSelectedOptions(items))),
          ));

  // @override
  // Widget build(BuildContext context) =>
}

///Handle each item
class _PrinterestSelectedOptions extends StatelessWidget {
  final List<PrinteresOptions> items;

  const _PrinterestSelectedOptions(this.items);

  @override
  Widget build(BuildContext context) {
    int pos = 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: items.map((e) => _ItemPrinterest(pos++, e)).toList(),
    );
  }
}

class _ItemPrinterest extends StatelessWidget {
  final int pos;
  final PrinteresOptions option;

  const _ItemPrinterest(this.pos, this.option);

  @override
  Widget build(BuildContext context) {
    //This value is listening because need to reprint the UI
    bool isSelected = Provider.of<ItemPrinterestHandler>(
          context,
        ).currentPos ==
        pos;

    return IconButton(
        icon: Icon(
          option.icon,
          size: isSelected ? 30 : 20,
          color: isSelected ? Colors.red : Colors.blueGrey,
        ),
        onPressed: () {
          Provider.of<ItemPrinterestHandler>(context, listen: false)
              .setPositionIcon(pos);
          option.onPressed();
        });
  }
}

class ItemPrinterestHandler extends ChangeNotifier {
  int _pos = 0;

  int get currentPos => _pos;

  set currentPos(v) => _pos = v;

  void setPositionIcon(int newPos) {
    _pos = newPos;
    notifyListeners();
  }
}
