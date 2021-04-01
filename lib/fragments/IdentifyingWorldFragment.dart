import 'package:flutter/material.dart';
import 'package:flutter_app/fragments/ChildrenVictimScreen.dart';
import 'package:flutter_app/fragments/DomesticVictims.dart';
import 'package:flutter_app/fragments/InternationalVictimScreen.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../Constants.dart' as Constants;

class IdentifyingWorldScreen extends StatefulWidget {
  String fromScreen;
  int id;

  IdentifyingWorldScreen(this.fromScreen, this.id);

  @override
  OtherVictimsState createState() {
    return OtherVictimsState();
  }
}

class OtherVictimsState extends State<IdentifyingWorldScreen> {
  InAppWebViewController webView;
  double progress = 0;

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
                  body: LayoutBuilder(builder: (BuildContext context,
                      BoxConstraints viewportConstraints) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: viewportConstraints.maxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Column(
                            children: <Widget>[
                              Container(
                                  child: progress < 1.0
                                      ? LinearProgressIndicator(value: progress)
                                      : Container(
                                          height: 5,
                                          color: Colors.white,
                                        )),
                              Expanded(
                                child: Container(
                                  child: new InAppWebView(
                                    initialFile: "assets/howToSpotSigns.html",
                                    initialOptions: InAppWebViewGroupOptions(
                                        crossPlatform: InAppWebViewOptions(
                                            supportZoom: false,
                                            debuggingEnabled: true)),
                                    onWebViewCreated:
                                        (InAppWebViewController controller) {
                                      webView = controller;
                                    },
                                    onProgressChanged:
                                        (InAppWebViewController controller,
                                            int progress) {
                                      setState(() {
                                        this.progress = progress / 100;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ))));
  }

  Widget buildFilterButtons(String text, int pos) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 60,
        vertical: 10,
      ),
      child: SizedBox(
          width: double.infinity,
          height: 50,
          child: FlatButton(
            textColor: Constants.blackColor,
            color: Constants.whiteColor,
            onPressed: () {
              if (pos == 1) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        DomesticVictimScreen(widget.id),
                  ),
                );
              } else if (pos == 2) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        InternationalVictimScreen(widget.id),
                  ),
                );
              } else if (pos == 3) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ChildrenVictimScreen(widget.id),
                  ),
                );
              }
            },
            child: Text(text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'TiemposHeadline',
                  fontWeight: FontWeight.w700,
                )),
          )),
    );
  }
}
