import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/fragments/AboutAppFragment.dart';
import 'package:flutter_app/fragments/GhanaHowToHelpFragment.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Constants.dart' as Constants;
import 'IdentifyingFragment.dart';

class LoadFirstScreen extends StatefulWidget {
  @override
  LoadState createState() {
    return LoadState();
  }
}

class LoadState extends State<LoadFirstScreen> {
  String buttonFrom;
  int currentId = -1;
  String countryName;

  @override
  void initState() {
    super.initState();
    getUserParams();
  }

  getUserParams() async {
    var prefs = await SharedPreferences.getInstance();
    int id = prefs.getInt(Constants.CURRENT_COUNTRYID);
    String name = prefs.getString(Constants.CURRENT_COUNTRYNAME);
   // print(id);
    print(name);
    setState(() {
      currentId = id;
      countryName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(currentId);
    return 
      WillPopScope(
        onWillPop: () async {
          exit(0);
        },
        child:
        
        Stack(children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                color: Constants.whiteColor,
                alignment: Alignment.topCenter,
                child: Column(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Text(
                        (currentId == 1)
                            ? Constants.GHANA_LOADERTEXT
                            : (currentId == 2)
                            ? Constants.WORLD_LOADERTEXT
                            : Constants.WORLD_LOADERTEXT,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'MediaSans',
                          fontWeight: FontWeight.w700,
                        ),)),
                  Container(
                    color: Constants.whiteColor,
                    width: double.infinity,
                    height: 450,
                    padding: EdgeInsets.symmetric(
                      vertical: 30,
                    ),
                    child: Column(
                      children: <Widget>[
                        buildFilterButtons('ABOUT THIS APP', 1),
                        buildFilterButtons('IDENTIFYING VICTIMS', 2),
                        buildFilterButtons('HOW TO HELP', 3),
                      ],
                    ),
                  )
                ])),
          ),
          Align(
              child: GestureDetector(
                  child: Container(
                    child: Image.asset(
                        (currentId == 1) ? "assets/images/ghana_back.png" :
                        // (currentId == 2) ? "assets/images/italy_back.png" :
                        (currentId == 2) ? "assets/images/world_back.png" :"assets/images/ghana_back.png",
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.bottomLeft),
                  ),
              ),
              alignment: Alignment.bottomCenter
          )
          ,
        ]
        ));
  }

  Widget buildFilterButtons(String text, int pos) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 10,
      ),
      child: SizedBox(
          width: double.infinity,
          height: 50, // match_parent
          child: RaisedButton(
            textColor: Constants.blackColor,
            color: Constants.myHexYellowColor,
            onPressed: () {
              print(text);
              if (pos == 1) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        AboutAppScreen('fragment',currentId),
                  ),
                );
              } else if (pos == 2) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        IdentifyingScreen('fragment',currentId),
                  ),
                );
              } else if (pos == 3) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        GhanaHowToHelpScreen('fragment',currentId),
                  ),
                );
              }
            },
            child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'MediaSans',
                  fontWeight: FontWeight.w700,
                )),
          )),
    );
  }

}
