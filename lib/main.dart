import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  void _onItemTapped(int index) => setState(() => _currentIndex = index);

  final List<Widget> children = [
    PageWidget(color: Colors.red, title: "画面1"),
    PageWidget(color: Colors.blue, title: "画面2"),
    PageWidget(color: Colors.green, title: "画面3"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BottomNavigationBar'),
      ),
      body: IndexedStack(
        index: this._currentIndex,
        children: this.children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '画面1'),
          BottomNavigationBarItem(icon: Icon(Icons.photo_album), label: '画面2'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: '画面3'),
        ],
        currentIndex: this._currentIndex,
        onTap: this._onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

class PageWidget extends StatelessWidget {
  final Color color;
  final String title;

  PageWidget({Key key, this.color, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(title),
      ),
    );
  }
}
