import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:printerest_layout/screens/main_menu.dart';
import 'package:provider/provider.dart';

class PrinterestGrid extends StatefulWidget {
  @override
  _PrinterestGridState createState() => _PrinterestGridState();
}

class _PrinterestGridState extends State<PrinterestGrid> {
  final controller = ScrollController();

  final List items = List.generate(200, (index) => index);

  double lastOffset = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      double offset = controller.offset;

      if (offset > lastOffset)
        Provider.of<MenuPrinterestNotifier>(context, listen: false)
            .shouldShowMenu(false);
      else
        Provider.of<MenuPrinterestNotifier>(context, listen: false)
            .shouldShowMenu(true);

      lastOffset = controller.offset;
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => StaggeredGridView.countBuilder(
        controller: controller,
        crossAxisCount: 4,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => _PinterestItem(index),
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 3 : 2),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      );
}

class _PinterestItem extends StatelessWidget {
  final int index;

  const _PinterestItem(this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('Touched $index'),
      child: Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: Center(
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text('$index'),
            ),
          )),
    );
  }
}
