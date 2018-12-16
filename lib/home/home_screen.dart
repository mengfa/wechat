import 'package:flutter/material.dart';
import 'package:wechat/constants.dart';

enum ActionItems {
  GROUP_CHAT, ADD_FRIEND, QR_SCAN, PAYMENT, HELP
}

class NavigationIconView {
  final BottomNavigationBarItem item;
  NavigationIconView({String title, IconData icon, IconData activeIcon}) :
      item = BottomNavigationBarItem(
          icon: Icon(icon),
          activeIcon: Icon(activeIcon),
          title: Text(title),
          backgroundColor: Colors.white,
      );
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  List<NavigationIconView> _navigationViews;

  void initState(){
    super.initState();
    _navigationViews = [
      NavigationIconView(
        title: '微信',
        icon: IconData(
          0xe608,
          fontFamily: Constants.IconFontFamily,
        ),
          activeIcon: IconData(
            0xe608,
            fontFamily: Constants.IconFontFamily,
          )

      ),
      NavigationIconView(
        title: '通讯录',
        icon: IconData(
          0xe656,
          fontFamily: Constants.IconFontFamily,
        ),
          activeIcon: IconData(
            0xe656,
            fontFamily: Constants.IconFontFamily,
          )
      ),
      NavigationIconView(
        title: '发现',
        icon: IconData(
          0xe671,
          fontFamily: Constants.IconFontFamily,
        ),
          activeIcon: IconData(
            0xe671,
            fontFamily: Constants.IconFontFamily,
          )
      ),
      NavigationIconView(
        title: '我',
        icon: IconData(
          0xe6c0,
          fontFamily: Constants.IconFontFamily,
        ),
        activeIcon: IconData(
          0xe6c0,
          fontFamily: Constants.IconFontFamily,
        )
      ),
    ];
  }

  _buildPopupMunuItem(int iconName, String title){
    return Row(
        children: <Widget>[
            Icon(IconData(
              iconName,
              fontFamily: Constants.IconFontFamily
            ), size: 22.0, color: const Color(AppColors.AppBarPopuMenuColor)),
            Container(width: 12.0),
            Text(title, style: TextStyle(color: const Color(AppColors.AppBarPopuMenuColor))),
          ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = BottomNavigationBar(
      fixedColor: const Color(AppColors.TabIconActive),
      items: _navigationViews.map((NavigationIconView view){
        return view.item;
      }).toList(),
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      onTap: (int index){
        setState(() {
          _currentIndex = index;
        });
        print('点击的是第$index个Tab');
      },

    );
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        elevation: 0.5,
        actions: [
          IconButton(
            icon: Icon(IconData(
              0xe65e,
              fontFamily: Constants.IconFontFamily,
            ), size: 22.0,),
            onPressed: (){print("点击了搜索按钮");},
          ),
          Container(width: 16.0,),
          PopupMenuButton(
            itemBuilder: (BuildContext context){
              return <PopupMenuItem<ActionItems>>[
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe69e, "发起群聊"),
                  value: ActionItems.GROUP_CHAT,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe638, "添加朋友"),
                  value: ActionItems.ADD_FRIEND,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe61b, "扫一扫"),
                  value: ActionItems.QR_SCAN,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe62a, "收付款"),
                  value: ActionItems.PAYMENT,
                ),
                PopupMenuItem(
                  child: _buildPopupMunuItem(0xe63d, "帮助与反馈"),
                  value: ActionItems.HELP,
                ),
              ];
            },
            icon: Icon(IconData(
              0xe658,
              fontFamily: Constants.IconFontFamily,
            ), size: 22.0,),
            onSelected: (ActionItems selected){
              print("点击的是$selected");
            },
          ),
          Container(width: 16.0,)
        ],
      ),
      body: Container(
        color: Colors.redAccent,
      ),
      bottomNavigationBar: botNavBar,
    );
  }
}
