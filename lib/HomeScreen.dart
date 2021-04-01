import 'package:flutter/material.dart';
import 'package:flutter_app/fragments/CertificateFragment.dart';
import 'package:flutter_app/fragments/HowToHelpFragment.dart';
import 'package:flutter_app/fragments/KnowTheLawFragment.dart';
import 'Constants.dart' as Constants;
import 'package:shared_preferences/shared_preferences.dart';

import 'fragments/AboutAppFragment.dart';
import 'fragments/AboutGFNFragment.dart';
import 'fragments/AfricaSigningFragment.dart';
import 'fragments/GhanaHowToHelpFragment.dart';
import 'fragments/HumanTrafficFragment.dart';
import 'fragments/IdentifyingFragment.dart';
import 'fragments/LoadFragment.dart';
import 'fragments/PrayersFragment.dart';
import 'fragments/PrefrenceFragment.dart';
import 'fragments/TalkCongregationFragment.dart';

class DrawerItem {
  String title;
  IconData icon;

  DrawerItem(this.title, this.icon);
}

class HomeScreen extends StatefulWidget {
  final drawerItems = [
    new DrawerItem(Constants.HOME, null),
    new DrawerItem(Constants.ABOUT_HUMAN_TRAFFIC, null),
    new DrawerItem(Constants.IDENTIFY_VICTIM, null),
    new DrawerItem(Constants.HOW_TOHELP, null),

    new DrawerItem(Constants.TALKING_YOUR_CONGREGATION, null),
    new DrawerItem(Constants.PRAYERS, null),

    new DrawerItem(Constants.AFRICA_SIGNING, null),
    // new DrawerItem(Constants.ABOUT_THISAPP, null),
    new DrawerItem(Constants.ABOUT_GFN, null),
    new DrawerItem(Constants.GFN_PLEDGE, null),
    new DrawerItem(Constants.PREFERENCES, null)
  ];

  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomeScreen> {
  String countryName;
  int currentId;
  int _selectedDrawerIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new LoadFirstScreen();
      case 1:
        return new HumanTrafficScreen("drawer", currentId);

      case 2:
        return new IdentifyingScreen("drawer", currentId);
      case 3:
        return new GhanaHowToHelpScreen("drawer", currentId);
      case 4:
        return new TalkCongregationScreen("drawer",currentId);
      case 5:
        return new PrayerScreen("drawer",currentId);


      case 6:
        return new africaSignScreen(currentId);

      // case 5:
      //   return new AboutAppScreen("drawer",currentId);
      case 7:
        return new AboutGFNScreen("drawer", currentId);
      case 8:
        return new CertificateFragment(currentId);

      case 9:
        return new PrefrencesScreen();

      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) async {
    var prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt(Constants.CURRENT_COUNTRYID);
    String name = prefs.getString(Constants.CURRENT_COUNTRYNAME);
    print(index);
    Navigator.of(context).pop();
    setState(() {
      _selectedDrawerIndex = index;
      currentId = id;
      countryName = name;
    });
    print(currentId);
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
        new InkWell(
          child: Container(
            padding: new EdgeInsets.all(7.0),
            child: Row(children: <Widget>[
              (i == 9)
                  ? Container(
                      margin: const EdgeInsets.only(top: 20.0, left: 5.0),
                      child: Image.asset(
                        'assets/images/setting.png',
                        height: 20,
                        color: Colors.white,
                      ))
                  :  Container(height: 0),
              new Expanded(
                  child: (i == 9)
                      ? Container(
                          margin: const EdgeInsets.only(top: 20.0, left: 5.0),
                          child: new Text(d.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'LatoBlack',
                                fontWeight: FontWeight.w700,
                              )))
                      : Container(
                          margin: new EdgeInsets.symmetric(horizontal: 5.0),
                          child: new Text(d.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'LatoBlack',
                                fontWeight: FontWeight.w700,
                              ))))
            ]),
          ),
          onTap: () => _onSelectItem(i),
        ),
      );
    }

    return Align(
      alignment: Alignment.topLeft,
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 110,
                  color: Colors.white,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/toollogo.png',
                        height: 50,
                      )
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: new Image.asset(
                        'assets/hamburgmenu.png',
                        width: 30,
                        height: 30,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        _scaffoldKey.currentState.openDrawer();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          drawer: Drawer(
            child: new Container(
              color: Constants.myHexColor,
              child: ListView(
                children: <Widget>[
                  Container(
                    constraints: new BoxConstraints(
                      minHeight: 50.0,
                      maxHeight: 80.0,
                    ),
                    child: DrawerHeader(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              alignment: Alignment.bottomLeft,
                              icon: new Image.asset(
                                'assets/hamburgmenu.png',
                                color: Colors.white,
                                width: 30,
                                height: 30,
                              ),
                              onPressed: () {
                                _scaffoldKey.currentState.openEndDrawer();
                              }),
                          Image.asset(
                            'assets/drawerlogo.png',
                            height: 40,
                          )
                        ],
                      ),
                    ),
                  ),
                  new Column(children: drawerOptions),
                ],
              ),
            ),
          ),
          body: new Container(
            child: _getDrawerItemWidget(_selectedDrawerIndex),
          ),
        ),
      ),
    );
  }
}
