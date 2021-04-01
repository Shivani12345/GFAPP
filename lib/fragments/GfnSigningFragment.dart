import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class GfnSignScreen extends StatefulWidget {

  String fromScreen;
  int id;

  GfnSignScreen(this.fromScreen,this.id);
  @override
  SignState createState() {
    return SignState();
  }
}

class SignState extends State<GfnSignScreen> {
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
    return Align(
        alignment: Alignment.center,
        child: SafeArea(
        child: WillPopScope(
        onWillPop: () async {
          Navigator.pushNamedAndRemoveUntil(
              context, (widget.id == 2) ?'/WorldHomeScreen' : '/HomeScreen' , ModalRoute.withName("/"));
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
                            initialFile: "assets/GfnSignings.html",
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
    ) )));

  }
}
