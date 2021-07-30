import 'package:flutter/material.dart';

class LocalNav extends StatelessWidget {
  final List<dynamic> topBarList;

  const LocalNav({Key? key, required this.topBarList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Padding(
          padding: EdgeInsets.fromLTRB(2, 6, 2, 0),
          child: _navBar(context),
        ),
    );
  }

  _navBar(BuildContext context) {
    if (topBarList == null) return null;
    List<Widget> items = [];
    topBarList.forEach((model) {
      items.add(_item(context, model));
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items,
    );
  }

  Widget _item(BuildContext context, model) {
    return GestureDetector(
      onTap: () {
        print("点击事件");
      },
      child: Column(
        children: <Widget>[
          Image.network(
            model["icon"],
            width: 32,
            height: 32,
          ),
          Text(
            model["title"],
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
