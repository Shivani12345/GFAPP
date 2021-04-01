import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';


class HowToHelpScreen extends StatefulWidget {
  String fromScreen;
  int id;

  HowToHelpScreen(this.fromScreen, this.id);

  @override
  _InAppBrowserExampleScreenState createState() =>
      new _InAppBrowserExampleScreenState();
}

class _InAppBrowserExampleScreenState extends State<HowToHelpScreen> {
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
                      context, (widget.id == 2) ?'/WorldHomeScreen' : '/HomeScreen' , ModalRoute.withName("/"));
                  return false;
                },
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
                                child: AnimatedOpacity(
                                  opacity: 1.0,
                                  duration: Duration(milliseconds: 500),
                                  child: Container(
                                    child: new InAppWebView(
                                      // initialFile: "assets/HowToHelpNew.html",
                                      initialFile: (widget.id == 1)
                                          ? "assets/HowToHelpNew.html"
                                          : "assets/HowToHelpNewOther.html",
                                      initialOptions: InAppWebViewGroupOptions(
                                          crossPlatform: InAppWebViewOptions(
                                              supportZoom: false,
                                              useShouldOverrideUrlLoading: true,
                                              debuggingEnabled: true)),
                                      shouldOverrideUrlLoading:
                                          (controller, request) async {
                                        var url = request.url;
                                        var uri = Uri.parse(url);
                                        print(uri);
                                        if (![
                                          "http",
                                          "https",
                                          "file",
                                          "chrome",
                                          "data",
                                          "javascript",
                                          "about"
                                        ].contains(uri.scheme)) {
                                          if (await canLaunch(url)) {
                                            // Launch the App
                                            await launch(
                                              url,
                                            );
                                            // and cancel the request
                                            return ShouldOverrideUrlLoadingAction
                                                .CANCEL;
                                          }
                                        }

                                        return ShouldOverrideUrlLoadingAction
                                            .ALLOW;
                                      },
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
