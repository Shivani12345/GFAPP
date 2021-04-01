import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class CertificateFragment extends StatefulWidget {
  int id;
  CertificateFragment(this.id);


  @override
  CertiState createState() {
    return CertiState();
  }
}

class CertiState extends State<CertificateFragment> {
  InAppWebViewController webView;

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
          context, (widget.id == 2) ?'/WorldHomeScreen' : '/HomeScreen' , ModalRoute.withName("/"));
      return false;
    },
    child: Align(
        alignment: Alignment.center,
        child: SafeArea(
        child: Scaffold(
    resizeToAvoidBottomInset: false,
    body: LayoutBuilder(
    builder: (BuildContext context, BoxConstraints viewportConstraints) {
    return SingleChildScrollView(
    child: ConstrainedBox(
    constraints: BoxConstraints(
    minHeight: viewportConstraints.maxHeight,
    ),
    child: IntrinsicHeight(
    child: Column(
    children: <Widget>[
    Expanded(
    child: Container(
    child: new InAppWebView(
    initialFile: "assets/certificate.html",
    initialOptions: InAppWebViewGroupOptions(
    crossPlatform:
    InAppWebViewOptions(debuggingEnabled: true,)),
    onWebViewCreated:
    (InAppWebViewController controller) {
    webView = controller;
    }),
    ),
    ),
    ],
    ),
    ),
    ),
    );
    }),))
   ));
  }
}
