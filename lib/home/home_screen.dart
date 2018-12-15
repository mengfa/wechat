import 'package:flutter/material.dart';

class NavigationIconView {
  final String _title;
  final Widget _icon;
  final Widget _activeIcon;
  final BottomNavigationBarItem item;

  NavigationIconView({String title, Widget icon, Widget activeIcon}) :
      _title = title,
      _icon = icon,
      _activeIcon = activeIcon,
      item = BottomNavigationBarItem(
        icon: icon,
        activeIcon: activeIcon,
        title: new Text(title),
        backgroundColor: Colors.white
      );

}

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();

}


class _HomeScreenState extends State<HomeScreen> {
  List<NavigationIconView> _navigationViews;

  void initState(){
    super.initState();
    _navigationViews = [
      NavigationIconView(
        title: '微信',
        icon: Icon(Icons.ac_unit),

      ),
      NavigationIconView(
        title: '通讯录',
        icon: Icon(Icons.rate_review),

      ),
      NavigationIconView(
        title: '发现',
        icon: Icon(Icons.tab_unselected),

      ),
      NavigationIconView(
        title: '我',
        icon: Icon(Icons.power),

      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      items: _navigationViews.map((NavigationIconView view){
        return view.item;
      }).toList(),
      currentIndex: 0,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        print('点击的是第$index个Tab');
      },

    );
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
      ),
      body: Container(
        color: Colors.redAccent,
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
