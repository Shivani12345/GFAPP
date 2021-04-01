import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class RoleOfFaithScreen extends StatefulWidget {
  String fromScreen;
  int id;

  RoleOfFaithScreen(this.fromScreen, this.id);

  @override
  RoleState createState() {
    return RoleState();
  }
}

class RoleState extends State<RoleOfFaithScreen> {
  InAppWebViewController webView;
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: WillPopScope(
            onWillPop: () async {
              Navigator.pushNamedAndRemoveUntil(
                  context,
                  (widget.id == 2) ? '/WorldHomeScreen' : '/HomeScreen',
                  ModalRoute.withName("/"));
              return false;
            },
            child: SafeArea(
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
              body: LayoutBuilder(builder:
                  (BuildContext context, BoxConstraints viewportConstraints) {
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
                          // Container(
                          //   alignment: Alignment.center,
                          //   color: Colors.yellow,
                          //   child:  new Text('What Faith based and community organizations can do for path?',
                          //       textAlign: TextAlign.center,
                          //       style: TextStyle(
                          //         fontFamily: 'lato_black',
                          //         // The color must be set to white for this to work
                          //
                          //         color: Colors.black,
                          //         fontStyle: FontStyle.normal,
                          //         fontWeight: FontWeight.w700,
                          //         fontSize: 20,
                          //       )),
                          // ),
                          Expanded(
                            child: Container(
                              child: new InAppWebView(
                                initialFile: "assets/RoleOfFaith.html",
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
}
