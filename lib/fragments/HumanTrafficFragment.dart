import 'package:flutter/material.dart';
import 'package:flutter_app/fragments/Definitions.dart';
import 'package:flutter_app/fragments/RoleOfFaith.dart';
import 'package:flutter_app/fragments/WhatIsItHuman.dart';
import '../Constants.dart' as Constants;

class HumanTrafficScreen extends StatefulWidget {
  String fromScreen;
  int id;

  HumanTrafficScreen(this.fromScreen, this.id);

  @override
  VictimsState createState() {
    return VictimsState();
  }
}

class VictimsState extends State<HumanTrafficScreen> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: SafeArea(
            child: WillPopScope(
                onWillPop: () async {
                  Navigator.pushNamedAndRemoveUntil(
                      context,
                      (widget.id == 2) ? '/WorldHomeScreen' : '/HomeScreen',
                      ModalRoute.withName("/"));
                  return false;
                },
                child: Scaffold(
                    appBar: (widget.fromScreen == "drawer")
                        ? null
                        : PreferredSize(
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
                                        'assets/images/left_arrow.png',
                                        width: 40,
                                        height: 40,
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    resizeToAvoidBottomInset: false,
                    body: Stack(children: <Widget>[
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
                                      "ABOUT MODERN SLAVERY",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontFamily: 'MediaSans',
                                        fontWeight: FontWeight.w700,
                                      ),
                                    )),
                                Container(
                                  color: Constants.myHexYellowColor,
                                  width: double.infinity,
                                  height: 450,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 30,
                                  ),
                                  child: Column(
                                    children: <Widget>[
                                      buildFilterButtons('WHAT IS IT?', 1),
                                      buildFilterButtons('DEFINITIONS', 2),
                                      buildFilterButtons('ROLE OF FAITH', 3),
                                    ],
                                  ),
                                )
                              ]))),
                      Align(
                          child: GestureDetector(
                            child: Image.asset(
                              (widget.id == 1)
                                  ? "assets/images/ghana_back.png"
                                  :
                                  // (widget.id == 2) ? "assets/images/italy_back.png" :
                                  (widget.id == 2)
                                      ? "assets/images/world_back.png"
                                      : "assets/images/ghana_back.png",
                              fit: BoxFit.fitWidth,
                              alignment: Alignment.bottomLeft,
                            ),
                          ),
                          alignment: Alignment.bottomCenter),
                    ])))));
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
          child: FlatButton(
            textColor: Constants.blackColor,
            color: Constants.whiteColor,
            onPressed: () {
              if (pos == 1) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => WhatIsScreen(widget.id),
                  ),
                );
              } else if (pos == 2) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        DefinitionsScreen(widget.id),
                  ),
                );
              } else if (pos == 3) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        RoleOfFaithScreen('fragment', widget.id),
                  ),
                );
              }

              // Respond to button press
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
