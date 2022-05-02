import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Webview.dart';
import 'package:flutter/material.dart';
import 'ad_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  var myMenuItems = <String>[
    'Privacy Policy',
    'Terms',
    'Rate Us',
    'Share',
    'Exit'
  ];
  @override
  void initState() {
    super.initState();
    // initialise homepage banner
    Provider.of<AdProvider>(context, listen: false).initialiseHomePageBanner();
    Provider.of<AdProvider>(context, listen: false)
        .initialisedetailsPageBanner();
    Provider.of<AdProvider>(context, listen: false).initialiseHomePageBanner2();
    Provider.of<AdProvider>(context, listen: false).initialiseHomePageBanner3();
    Provider.of<AdProvider>(context, listen: false).initialiseHomePageBanner4();
    Provider.of<AdProvider>(context, listen: false).initialiseHomePageBanner5();
    Provider.of<AdProvider>(context, listen: false).initialiseHomePageBanner6();
    Provider.of<AdProvider>(context, listen: false).initialiseHomePageBanner7();
    Provider.of<AdProvider>(context, listen: false).initialiseHomePageBanner8();
  }

  Future<void> onSelect(item) async {
    switch (item) {
      case 'Rate Us':
        {
          RateMyApp(googlePlayIdentifier: 'com.spextek.news')
              .showStarRateDialog(context);
        }
        break;
      case 'Share':
        {
          Share.share(
              'https://play.google.com/store/apps/details?id=com.atharwani.news');
        }
        break;
      case 'Privacy Policy':
        {
          // ignore: deprecated_member_use
          launch('http://WaniAthar.github.io/policies/epaper.html');
        }
        break;
      case 'Terms':
        {
          // ignore: deprecated_member_use
          launch('http://WaniAthar.github.io/policies/t&c.html');
        }
        break;
      case 'Exit':
        {
          exit(0);
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      body: CustomScrollView(
        slivers: [
          //sliver app bar
          SliverAppBar(
            iconTheme: IconThemeData(
              color: Colors.grey[900],
            ),
            actions: <Widget>[
              PopupMenuButton<String>(
                  onSelected: onSelect,
                  itemBuilder: (BuildContext context) {
                    return myMenuItems.map((String choice) {
                      return PopupMenuItem<String>(
                        child: Text(choice),
                        value: choice,
                      );
                    }).toList();
                  }),
            ],
            backgroundColor: Colors.deepPurple[100],
            shadowColor: Colors.deepPurple[100],
            centerTitle: true,
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.deepPurple[50],
                child: Column(
                  children: [
                    Icon(
                      Icons.arrow_upward_rounded,
                      size: 100,
                      color: Colors.grey[900],
                    ),
                    Title(
                      child: Text("Swipe Up",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey[900],
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          )),
                      color: Colors.white,
                    ),
                  ],
                ),
                padding: EdgeInsets.only(top: 60.0),
              ),
              title: Text('E-PAPER Kashmir',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                      shadows: [
                        Shadow(
                          color: Colors.grey.shade700,
                          blurRadius: 15.0,
                          offset: Offset(5.0, 5.0),
                        ),
                      ])),
              centerTitle: true,
            ),
          ),

          // sliver items
          SliverToBoxAdapter(
            child: Consumer<AdProvider>(
              builder: (context, AdProvider, child) {
                if (AdProvider.isHomePageBannerLoaded) {
                  return Container(
                      height:
                          AdProvider.homepagebannerAd.size.height.toDouble(),
                      child: AdWidget(ad: AdProvider.homepagebannerAd));
                } else {
                  return Container(height: 0);
                }
              },
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(
                          'https://epaper.kashmiruzma.net/',
                          'Kashmir Uzma',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Image(image: AssetImage('images/uzma-logo.jpg')),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.0,
                            blurRadius: 10,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.0,
                            blurRadius: 10 / 2.0,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10,
                            offset: Offset(-3.0, -3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10 / 2,
                            offset: Offset(-3.0, -3.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(
                          'https://epaper.dailyexcelsior.com/',
                          'Excelsior',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Image(
                      image: AssetImage('images/excelsior.jpg'),
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.0,
                            blurRadius: 10,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.0,
                            blurRadius: 10 / 2.0,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10,
                            offset: Offset(-3.0, -3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10 / 2,
                            offset: Offset(-3.0, -3.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer<AdProvider>(
              builder: (context, AdProvider, child) {
                if (AdProvider.isHomePageBannerLoaded2) {
                  return SizedBox(
                      height:
                          AdProvider.homepagebannerAd2.size.height.toDouble(),
                      child: AdWidget(ad: AdProvider.homepagebannerAd2));
                } else {
                  return Container(height: 0);
                }
              },
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(
                          'http://epaper.earlytimes.in',
                          'Early Times',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Image(image: AssetImage('images/earlytimes.png')),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.0,
                            blurRadius: 10,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.0,
                            blurRadius: 10 / 2.0,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10,
                            offset: Offset(-3.0, -3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10 / 2,
                            offset: Offset(-3.0, -3.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(
                          'https://www.chattanonline.com/',
                          'Daily Chattan',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Image(image: AssetImage('images/dailychattan.jpg')),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.0,
                            blurRadius: 10,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.0,
                            blurRadius: 10 / 2.0,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10,
                            offset: Offset(-3.0, -3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10 / 2,
                            offset: Offset(-3.0, -3.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer<AdProvider>(
              builder: (context, AdProvider, child) {
                if (AdProvider.isHomePageBannerLoaded3) {
                  return Container(
                      height:
                          AdProvider.homepagebannerAd3.size.height.toDouble(),
                      child: AdWidget(ad: AdProvider.homepagebannerAd3));
                } else {
                  return Container(height: 0);
                }
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(
                          'https://epaper.thedailyaftab.com/',
                          'Aftaab',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Image(image: AssetImage('images/aftaab.jpg')),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.0,
                            blurRadius: 10,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.0,
                            blurRadius: 10 / 2.0,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10,
                            offset: Offset(-3.0, -3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10 / 2,
                            offset: Offset(-3.0, -3.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(
                          'https://epaper.greaterkashmir.com/',
                          'Greater Kashmir',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    child:
                        Image(image: AssetImage('images/GreaterKashmir.png')),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.0,
                            blurRadius: 10,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.0,
                            blurRadius: 10 / 2.0,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10,
                            offset: Offset(-3.0, -3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10 / 2,
                            offset: Offset(-3.0, -3.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer<AdProvider>(
              builder: (context, AdProvider, child) {
                if (AdProvider.isHomePageBannerLoaded4) {
                  return Container(
                      height:
                          AdProvider.homepagebannerAd4.size.height.toDouble(),
                      child: AdWidget(ad: AdProvider.homepagebannerAd4));
                } else {
                  return Container(height: 0);
                }
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(
                          'http://epaper.kashmirobserver.net/',
                          'Kashmir Observer',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    child:
                        Image(image: AssetImage('images/kashmirobserver.jpg')),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.0,
                            blurRadius: 10,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.0,
                            blurRadius: 10 / 2.0,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10,
                            offset: Offset(-3.0, -3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10 / 2,
                            offset: Offset(-3.0, -3.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(
                          'http://www.dailyroshni.net/',
                          'Daily Roshni',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Image(image: AssetImage('images/roshni.jpg')),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.0,
                            blurRadius: 10,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.0,
                            blurRadius: 10 / 2.0,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10,
                            offset: Offset(-3.0, -3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10 / 2,
                            offset: Offset(-3.0, -3.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer<AdProvider>(
              builder: (context, AdProvider, child) {
                if (AdProvider.isHomePageBannerLoaded5) {
                  return Container(
                      height:
                          AdProvider.homepagebannerAd5.size.height.toDouble(),
                      child: AdWidget(ad: AdProvider.homepagebannerAd5));
                } else {
                  return Container(height: 0);
                }
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(
                          'http://epaper.kashmirtimes.com/',
                          'Kashmir Times',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    child:
                        Image(image: AssetImage('images/KashmirTimesLogo.jpg')),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.0,
                            blurRadius: 10,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.0,
                            blurRadius: 10 / 2.0,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10,
                            offset: Offset(-3.0, -3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10 / 2,
                            offset: Offset(-3.0, -3.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(
                          'https://epaper.lazawal.com/',
                          'Lazawal',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Image(image: AssetImage('images/lazwal.jpg')),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.0,
                            blurRadius: 10,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.0,
                            blurRadius: 10 / 2.0,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10,
                            offset: Offset(-3.0, -3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10 / 2,
                            offset: Offset(-3.0, -3.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer<AdProvider>(
              builder: (context, AdProvider, child) {
                if (AdProvider.isHomePageBannerLoaded6) {
                  return Container(
                      height:
                          AdProvider.homepagebannerAd6.size.height.toDouble(),
                      child: AdWidget(ad: AdProvider.homepagebannerAd6));
                } else {
                  return Container(height: 0);
                }
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(
                          'https://www.thenorthlines.com/epaper/',
                          'Northlines',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Image(image: AssetImage('images/northlines.png')),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.0,
                            blurRadius: 10,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.0,
                            blurRadius: 10 / 2.0,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10,
                            offset: Offset(-3.0, -3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10 / 2,
                            offset: Offset(-3.0, -3.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(
                          'http://www.srinagarnews.org/',
                          'Srinagar News',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Image(image: AssetImage('images/srinagar_news.png')),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.0,
                            blurRadius: 10,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.0,
                            blurRadius: 10 / 2.0,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10,
                            offset: Offset(-3.0, -3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10 / 2,
                            offset: Offset(-3.0, -3.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer<AdProvider>(
              builder: (context, AdProvider, child) {
                if (AdProvider.isHomePageBannerLoaded7) {
                  return Container(
                      height:
                          AdProvider.homepagebannerAd7.size.height.toDouble(),
                      child: AdWidget(ad: AdProvider.homepagebannerAd7));
                } else {
                  return Container(height: 0);
                }
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(
                          'https://epaper.stateobserver.com/',
                          'State Observer',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Image(image: AssetImage('images/stateobserver.jpg')),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.0,
                            blurRadius: 10,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.0,
                            blurRadius: 10 / 2.0,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10,
                            offset: Offset(-3.0, -3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10 / 2,
                            offset: Offset(-3.0, -3.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(
                          'https://epaper.statetimes.in/',
                          'State Times',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Image(image: AssetImage('images/statetimes.jpg')),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.0,
                            blurRadius: 10,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.0,
                            blurRadius: 10 / 2.0,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10,
                            offset: Offset(-3.0, -3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10 / 2,
                            offset: Offset(-3.0, -3.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer<AdProvider>(
              builder: (context, AdProvider, child) {
                if (AdProvider.isHomePageBannerLoaded8) {
                  return Container(
                      height:
                          AdProvider.homepagebannerAd8.size.height.toDouble(),
                      child: AdWidget(ad: AdProvider.homepagebannerAd8));
                } else {
                  return Container(height: 0);
                }
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WebViewPage(
                          'http://mirrorofkashmir.in/',
                          'The Mirror',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 200,
                    child: Image(image: AssetImage('images/themirror.jpg')),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.shade300,
                            spreadRadius: 0.0,
                            blurRadius: 10,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.grey.shade400,
                            spreadRadius: 0.0,
                            blurRadius: 10 / 2.0,
                            offset: Offset(3.0, 3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10,
                            offset: Offset(-3.0, -3.0)),
                        BoxShadow(
                            color: Colors.white,
                            spreadRadius: 2.0,
                            blurRadius: 10 / 2,
                            offset: Offset(-3.0, -3.0)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Consumer<AdProvider>(
              builder: (context, AdProvider, child) {
                if (AdProvider.isDetailsPageBannerLoaded) {
                  return Container(
                      height:
                          AdProvider.detailspagebannerAd.size.height.toDouble(),
                      child: AdWidget(ad: AdProvider.detailspagebannerAd));
                } else {
                  return Container(height: 0);
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}


/*
AdProvider().isHomePageBannerLoaded
          ? Container(
              child: AdWidget(
              ad: AdProvider().homepagebannerAd,
            ))
          : Container(
              height: 0,
            ),
*/