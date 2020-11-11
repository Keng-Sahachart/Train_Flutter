import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom NavigationBar',
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidget createState() => _MyStatefulWidget();
}

class _MyStatefulWidget extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  String sHome = 'Home';

  static const TextStyle styleOption = TextStyle(
      fontWeight: FontWeight.bold, color: Colors.lightBlue, fontSize: 30);

  static const List<Widget> _widgetOption = <Widget>[
    Text('Index 0 : Home', style: styleOption),
    Text('Index 0 : Business', style: styleOption),
    Text('Index 0 : School', style: styleOption),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom NavigationBar Demo'),
      ),
      body: Center(
        child: _widgetOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.greenAccent,
        onTap: _onItemTapped,
        /* Item ต้อง >= 2 ไม่งั้น  error*/
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('School'))
        ],
      ),
    );
  }
}
