import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/widget/loading_container.dart';
import 'package:my_flutter_app/pages/widget/local_nav.dart';
import 'package:my_flutter_app/pages/widget/grid_nav.dart';
import 'package:my_flutter_app/server/server.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> topBarList = [];
  dynamic gridBarList = {};

  @override
  void initState() {
    super.initState();
    _getInfo();
  }

  Future<dynamic> _getInfo() async {
    var res = await HomeDao.homeDao();
    print(res);
    setState(() {
      topBarList = res["localNavList"];
      gridBarList = res["gridNav"];
    });
    print("--------------");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: LoadingContainer(
        isLoading: false,
        delay: Duration(seconds: 2),
        child: _listView,
      ),
    ));
  }

  Widget get _listView {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
          child: LocalNav(topBarList: topBarList),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
          child: GridNav(gridBarInfo: gridBarList),
        ),
      ],
    );
  }
}
