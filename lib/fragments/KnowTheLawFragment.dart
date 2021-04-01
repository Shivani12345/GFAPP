import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class KnowLawScreen extends StatefulWidget {
  int id;

  KnowLawScreen(this.id);

  @override
  lawState createState() {
    return lawState();
  }
}

class lawState extends State<KnowLawScreen> {
  InAppWebViewController webView;
  double progress = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.pushNamedAndRemoveUntil(
              context, '/HomeScreen', ModalRoute.withName("/"));
          return false;
        },
        child: Scaffold(
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
                        child: Container(
                          child: new InAppWebView(
                            initialFile: "assets/KnowTheLaw.html",
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
        ));
  }
}
