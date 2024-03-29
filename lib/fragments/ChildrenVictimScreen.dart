import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants.dart' as Constants;

class ChildrenVictimScreen extends StatefulWidget {
  int id;

  ChildrenVictimScreen(this.id);

  @override
  ChildState createState() {
    return ChildState();
  }
}

class ChildState extends State<ChildrenVictimScreen> {
  InAppWebViewController webView;
  double progress = 0;



  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: SafeArea(
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
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: new Image.asset(
                        'assets/images/left_arrow.png',
                        width: 30,
                        height: 30,
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
                      Expanded(
                        child: new InAppWebView(
                          initialFile: (widget.id == 1)
                              ? "assets/childrenTrafficking.html"
                              : "assets/childrenTraffickingOther.html",
                          initialOptions: InAppWebViewGroupOptions(
                              crossPlatform: InAppWebViewOptions(
                                  supportZoom: false, debuggingEnabled: true)),
                          onWebViewCreated:
                              (InAppWebViewController controller) {
                            webView = controller;
                          },
                          onProgressChanged: (InAppWebViewController controller,
                              int progress) {
                            setState(() {
                              this.progress = progress / 100;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        )));
  }
}
