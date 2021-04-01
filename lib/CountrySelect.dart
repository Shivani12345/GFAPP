import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constants.dart' as Constants;
import 'HomeScreen.dart';
import 'WorldHomeScreen.dart';

class countrySelectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SelectPageState();
}

class SelectPageState extends State<countrySelectPage> {
  int _selectedIndex = -1;
  final countries = [Constants.GHANA, Constants.GFN];
  final flags = [
    'assets/images/ghana.png',
    'assets/images/world.png'
  ];


  // final countries = [Constants.GHANA, Constants.ITALY, Constants.WORLD];
  // final flags = [
  //   'assets/images/ghana.png',
  //   'assets/images/italy.png',
  //   'assets/images/world.png'
  // ];
  var userCon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              ],
            ),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Constants.myHexColor,
                          child: Center(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [ Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          width: 230,
                                          padding: const EdgeInsets.only(
                                            top: 15.0, bottom: 15,),
                                          child: Text(
                                              'SELECT',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontFamily: "LatoBlack",
                                                fontWeight: FontWeight.w700,
                                              )
                                          ))),
                                    Container(
                                      color: Colors.white,
                                      width: 230,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: countries.length,
                                        itemBuilder: (context, index) {
                                          return Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                              width: 230,
                                              height: 55,
                                              color: Colors.white,
                                              padding: const EdgeInsets.only(
                                                top: 3,
                                                bottom: 3,
                                              ),
                                              child: Ink(
                                                // color: _selectedIndex == index
                                                //     ? Colors.blue
                                                //     : Colors.grey,
                                                child: ListTile(
                                                    tileColor: _selectedIndex ==
                                                        index
                                                        ? Constants.grayColor
                                                        : Constants.whiteColor,
                                                    leading: new Image.asset(
                                                      flags[index],
                                                      width: 30,
                                                      height: 30,
                                                    ),
                                                    title: Text(
                                                        countries[index],
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: 'LatoBlack',
                                                          fontWeight: FontWeight
                                                              .w700,
                                                        )),
                                                    trailing: _selectedIndex ==
                                                        index
                                                        ? new Image.asset(
                                                      'assets/images/right.png',
                                                      width: 20,
                                                      height: 20,
                                                    )
                                                        : null,
                                                    onTap: () {
                                                      print("onTappp");
                                                      setState(() {
                                                        _selectedIndex = index;
                                                      });
                                                      callSharedPreferences(
                                                          countries[index],
                                                          index + 1);
                                                    }),
                                              ),
                                            ),
                                          );
                                        },
                                      ),)
                                  ])),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Constants
                              .myHexYellowColor, //remove color to make it transpatrent
                        ),
                      ),
                    ],
                  )),
            ],
          )),
    );
  }

  Future callSharedPreferences(String loginData, int id) async {
    print(id);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(Constants.CURRENT_COUNTRYID, id);
    prefs.setString(Constants.CURRENT_COUNTRYNAME, loginData);

    if (id == 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext ctx) => WorldHomeScreen()),
      );
    }
    else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext ctx) => HomeScreen()),
      );
    }
  }
}
