import 'package:flutter/material.dart';

class GridNav extends StatelessWidget {
  final dynamic gridBarInfo;

  const GridNav({Key? key, required this.gridBarInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(6),
      color: Colors.transparent,
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: _gridList(context),
      ),
    );
  }

  _gridList(BuildContext context) {
    List<Widget> items = [];
    if (gridBarInfo == null) return items;
    if (gridBarInfo["hotel"] != null) {
      items.add(_gridItem(context, gridBarInfo["hotel"], true));
    }
    if (gridBarInfo["flight"] != null) {
      items.add(_gridItem(context, gridBarInfo["flight"], false));
    }
    if (gridBarInfo["travel"] != null) {
      items.add(_gridItem(context, gridBarInfo["travel"], false));
    }
    return items;
  }

  _gridItem(BuildContext context, itemInfo, bool first) {
    List<Widget> items = [];

    items.add(_mainItem(context, itemInfo["mainItem"]));
    items.add(_doubleItem(
        context, gridBarInfo["hotel"]["item1"], gridBarInfo["hotel"]["item2"]));
    items.add(_doubleItem(
        context, gridBarInfo["hotel"]["item3"], gridBarInfo["hotel"]["item4"]));

    List<Widget> expandItems = [];
    items.forEach((item) {
      expandItems.add(Expanded(child: item, flex: 1));
    });

    Color startColor = Color(int.parse('0xff' + itemInfo["startColor"]));
    Color endColor = Color(int.parse('0xff' + itemInfo["startColor"]));

    return Container(
      height: 88,
      margin: first ? null : EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [startColor, endColor])),
      child: Row(
        children: expandItems,
      ),
    );
  }

  _mainItem(BuildContext context, mainItem) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Image.network(
          mainItem["icon"],
          fit: BoxFit.contain,
          height: 88,
          width: 121,
          alignment: AlignmentDirectional.bottomEnd,
        ),
        Container(
          margin: EdgeInsets.only(top: 11),
          child: Text(
            mainItem["title"],
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        )
      ],
    );
  }

  _doubleItem(BuildContext context, topInfo, bottomInfo) {
    return Column(
      children: [
        Expanded(
          child: _item(context, topInfo, true),
        ),
        Expanded(
          child: _item(context, bottomInfo, false),
        ),
      ],
    );
  }

  _item(BuildContext context, info, bool isTop) {
        BorderSide borderSide = BorderSide(width: 0.8, color: Colors.white);
    return FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
          left: borderSide,
          bottom: isTop ? borderSide : BorderSide.none,
        )),
            child: Center(
          child: Text(
            info["title"],
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        )));
  }
}
