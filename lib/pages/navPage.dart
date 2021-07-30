import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/homePage.dart';

class NavPage extends StatefulWidget {
  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  int currentIndex = 0;
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: ,
      backgroundColor: Color(0xfff2f2f2),
      body: PageView(
        controller: controller,
        children: [
          HomePage(),
          Center(
            child: Text('Second Page'),
          ),
          Center(
            child: Text('Third Page'),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: currentIndex,
        selectedItemColor: Colors.red,
        onTap: (value){
          controller.jumpToPage(value);
          setState(() {
            currentIndex = value;
          });
        },
      ),
    );
  }
}
