import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';
import 'ad_provider.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class WebViewPage extends StatefulWidget {
  final String url;
  final String title;

  WebViewPage(this.url, this.title);

  @override
  WebViewPageState createState() => WebViewPageState(this.url, this.title);
}

class WebViewPageState extends State<WebViewPage> {
  final String url;
  final String title;
  num position = 1;

  WebViewPageState(this.url, this.title);

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        AdProvider adProvider = Provider.of<AdProvider>(context, listen: false);
        if (adProvider.isFullPageAdLoaded) {
          log("Showing fullpage ad\n");
          adProvider.fullpageAd.show();
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.grey[900],
          ),
          iconTheme: IconThemeData(
            color: Colors.grey[900],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: WebView(
                initialUrl: url,
                javascriptMode: JavascriptMode.unrestricted,
                onPageStarted: (value) {
                  setState(() {
                    position = 1;
                  });
                },
                onPageFinished: (value) {
                  setState(() {
                    position = 0;
                  });
                },
                zoomEnabled: true,
              ),
            ),
            position == 1
                ? Container(
                  child: LinearProgressIndicator(
                      color: Colors.grey[900],
                      backgroundColor: Colors.deepPurple[100],
                    ),
                ): Column()
                
          ],
        ),
        bottomNavigationBar: Consumer<AdProvider>(
              builder: (context, AdProvider, child) {
                if (AdProvider.isWebViewBannerLoaded1) {
                  return SizedBox(
                      height:
                          AdProvider.webViewbanner1.size.height.toDouble(),
                      child: AdWidget(ad: AdProvider.webViewbanner1));
                } else {
                  return Container(height: 0);
                }
              },
            ),
          
      ),
    );
  }
}
