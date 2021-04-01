import 'package:flutter/material.dart';
import 'package:flutter_app/HomeScreen.dart';
import 'package:flutter_app/WorldHomeScreen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

import '../Constants.dart' as Constants;

class PrefrencesScreen extends StatefulWidget {
  @override
  CountrySelectState createState() {
    return CountrySelectState();
  }
}

class CountrySelectState extends State<PrefrencesScreen> {
  int currentId;
  String countryName;
  int _selectedIndex;

  // final countries = [Constants.GHANA, Constants.ITALY, Constants.WORLD];
  // final flags = [
  //   'assets/images/ghana.png',
  //   'assets/images/italy.png',
  //   'assets/images/world.png'
  // ];
  final countries = [Constants.GHANA, Constants.GFN];
  final flags = [
    'assets/images/ghana.png',
    'assets/images/world.png'
  ];

  @override
  void initState() {
    super.initState();
    getUserParams();
  }

  getUserParams() async {
    var prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt(Constants.CURRENT_COUNTRYID);
    String name = prefs.getString(Constants.CURRENT_COUNTRYNAME);
    print(id);
    print(name);
    setState(() {
      currentId = id;
      countryName = name;
      _selectedIndex = currentId - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushNamedAndRemoveUntil(
              context, (currentId == 2) ?'/WorldHomeScreen' : '/HomeScreen' , ModalRoute.withName("/"));
          return false;
        },
        child: Column(
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
                            children: [
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  width: 230,
                                  padding: const EdgeInsets.only(
                                    top: 15.0,
                                    bottom: 15,
                                  ),
                                  child: Text('SELECT',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: "LatoBlack",
                                        fontWeight: FontWeight.w700,
                                      )))),
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
                                        color: Colors.white,
                                        // color: _selectedIndex == index
                                        //     ? Colors.blue
                                        //     : Colors.grey,
                                        child: ListTile(
                                            tileColor: _selectedIndex == index
                                                ? Constants.grayColor
                                                : Constants.whiteColor,
                                            leading: new Image.asset(
                                              flags[index],
                                              width: 30,
                                              height: 30,
                                            ),
                                            title: Text(countries[index],
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontFamily: 'LatoBlack',
                                                  fontWeight: FontWeight.w700,
                                                )),
                                            trailing: _selectedIndex == index
                                                ? new Image.asset(
                                                    'assets/images/right.png',
                                                    width: 20,
                                                    height: 20,
                                                  )
                                                : null,
                                            onTap: () {
                                              showAlertDialog(context, index);
                                            }),
                                      ),
                                    ),
                                  );
                                },
                              )),
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
        ));
  }

  showAlertDialog(BuildContext context, int index) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.pop(context);
        setState(() {
          _selectedIndex = index;
        });

        callSharedPreferences(countries[index], index + 1);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Change Location"),
      content: Text("Are you sure you want to change location?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future callSharedPreferences(String loginData, int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(Constants.CURRENT_COUNTRYID, id);
    prefs.setString(Constants.CURRENT_COUNTRYNAME, loginData);

    Toast.show("You changed location to "+ loginData, context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);


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
