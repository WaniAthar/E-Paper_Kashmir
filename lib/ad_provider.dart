import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:news/ad_helper.dart';

class AdProvider with ChangeNotifier {
  late BannerAd homepagebannerAd;
  late BannerAd homepagebannerAd2;
  late BannerAd homepagebannerAd3;
  late BannerAd homepagebannerAd4;
  late BannerAd homepagebannerAd5;
  late BannerAd homepagebannerAd6;
  late BannerAd homepagebannerAd7;
  late BannerAd homepagebannerAd8;
  late BannerAd webViewbanner1;

  late bool isHomePageBannerLoaded = false;
  late bool isHomePageBannerLoaded2 = false;
  late bool isHomePageBannerLoaded3 = false;
  late bool isHomePageBannerLoaded4 = false;
  late bool isHomePageBannerLoaded5 = false;
  late bool isHomePageBannerLoaded6 = false;
  late bool isHomePageBannerLoaded7 = false;
  late bool isHomePageBannerLoaded8 = false;
  late bool isWebViewBannerLoaded1 = false;
  late BannerAd detailspagebannerAd;
  late bool isDetailsPageBannerLoaded = false;
  late InterstitialAd fullpageAd;
  late bool isFullPageAdLoaded = false;
  late NativeAd nativeAdHome1;
  late bool isnativeAdHome1Loaded = false;

  void initialiseHomePageBanner() async {
    homepagebannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId1,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isHomePageBannerLoaded = true;
          log("HomePage Banner Loaded");
        },
        onAdClosed: (ad) {
          homepagebannerAd.dispose();
        },
        onAdFailedToLoad: (ad, error) {
          log(error.toString());
        },
      ),
      request: AdRequest(),
    );
    await homepagebannerAd.load();
    notifyListeners();
  }

  void initialisedetailsPageBanner() async {
    detailspagebannerAd = BannerAd(
      size: AdSize.largeBanner,
      adUnitId: AdHelper.bannerAdUnitId9,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isDetailsPageBannerLoaded = true;
          log("HomePage2 Banner Loaded");
        },
        onAdClosed: (ad) {
          ad.dispose();
          isDetailsPageBannerLoaded = true;
        },
        onAdFailedToLoad: (ad, error) {
          isDetailsPageBannerLoaded = true;
          log(error.toString());
        },
      ),
      request: AdRequest(),
    );
    await detailspagebannerAd.load();
    notifyListeners();
  }

  void initialiseFullPageAd() async {
    await InterstitialAd.load(
      adUnitId: AdHelper.fullPageAd,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          fullpageAd = ad;
          isFullPageAdLoaded = true;
          log("FullPage Ad Loaded");
        },
        onAdFailedToLoad: (error) {
          log(error.toString());
          isFullPageAdLoaded = false;
        },
      ),
    );
    notifyListeners();
  }

  void initialiseHomePageBanner2() async {
    homepagebannerAd2 = BannerAd(
      size: AdSize.largeBanner,
      adUnitId: AdHelper.bannerAdUnitId2,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isHomePageBannerLoaded2 = true;
          log("HomePage2 Banner Loaded");
        },
        onAdClosed: (ad) {
          ad.dispose();
          isHomePageBannerLoaded2 = false;
        },
        onAdFailedToLoad: (ad, error) {
          log(error.toString());
          isHomePageBannerLoaded2 = false;
        },
      ),
      request: AdRequest(),
    );
    await homepagebannerAd2.load();
    notifyListeners();
  }

  void initialiseHomePageBanner3() async {
    homepagebannerAd3 = BannerAd(
      size: AdSize.largeBanner,
      adUnitId: AdHelper.bannerAdUnitId3,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isHomePageBannerLoaded3 = true;
          log("HomePage3 Banner Loaded");
        },
        onAdClosed: (ad) {
          ad.dispose();
          isHomePageBannerLoaded3 = false;
        },
        onAdFailedToLoad: (ad, error) {
          log(error.toString());
          isHomePageBannerLoaded3 = false;
        },
      ),
      request: AdRequest(),
    );
    await homepagebannerAd3.load();
    notifyListeners();
  }

  void initialiseHomePageBanner4() async {
    homepagebannerAd4 = BannerAd(
      size: AdSize.largeBanner,
      adUnitId: AdHelper.bannerAdUnitId4,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isHomePageBannerLoaded4 = true;
          log("HomePage4 Banner Loaded");
        },
        onAdClosed: (ad) {
          ad.dispose();
          isHomePageBannerLoaded4 = false;
        },
        onAdFailedToLoad: (ad, error) {
          log(error.toString());
        },
      ),
      request: AdRequest(),
    );
    await homepagebannerAd4.load();
    notifyListeners();
  }

  void initialiseHomePageBanner5() async {
    homepagebannerAd5 = BannerAd(
      size: AdSize.largeBanner,
      adUnitId: AdHelper.bannerAdUnitId5,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isHomePageBannerLoaded5 = true;
          log("HomePage Banner Loaded");
        },
        onAdClosed: (ad) {
          ad.dispose();
          isHomePageBannerLoaded5 = false;
        },
        onAdFailedToLoad: (ad, error) {
          log(error.toString());
          isHomePageBannerLoaded5 = false;
        },
      ),
      request: AdRequest(),
    );
    await homepagebannerAd5.load();
    notifyListeners();
  }

  void initialiseHomePageBanner6() async {
    homepagebannerAd6 = BannerAd(
      size: AdSize.largeBanner,
      adUnitId: AdHelper.bannerAdUnitId6,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isHomePageBannerLoaded6 = true;
          log("HomePage Banner Loaded");
        },
        onAdClosed: (ad) {
          ad.dispose();
          isHomePageBannerLoaded6 = false;
        },
        onAdFailedToLoad: (ad, error) {
          log(error.toString());
          isHomePageBannerLoaded6 = false;
        },
      ),
      request: AdRequest(),
    );
    await homepagebannerAd6.load();
    notifyListeners();
  }

  void initialiseHomePageBanner7() async {
    homepagebannerAd7 = BannerAd(
      size: AdSize.largeBanner,
      adUnitId: AdHelper.bannerAdUnitId7,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isHomePageBannerLoaded7 = true;
          log("HomePage Banner Loaded");
        },
        onAdClosed: (ad) {
          ad.dispose();
          isHomePageBannerLoaded7 = false;
        },
        onAdFailedToLoad: (ad, error) {
          log(error.toString());
          isHomePageBannerLoaded7 = false;
        },
      ),
      request: AdRequest(),
    );
    await homepagebannerAd7.load();
    notifyListeners();
  }

  void initialiseHomePageBanner8() async {
    homepagebannerAd8 = BannerAd(
      size: AdSize.largeBanner,
      adUnitId: AdHelper.bannerAdUnitId8,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isHomePageBannerLoaded8 = true;
          log("HomePage Banner Loaded");
        },
        onAdClosed: (ad) {
          ad.dispose();
          isHomePageBannerLoaded8 = false;
        },
        onAdFailedToLoad: (ad, error) {
          log(error.toString());
          isHomePageBannerLoaded8 = false;
        },
      ),
      request: AdRequest(),
    );
    await homepagebannerAd8.load();
    notifyListeners();
  }

  void initializeWebViewBanner1() async {
    webViewbanner1 = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.webViewBanner1,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isWebViewBannerLoaded1 = true;
          log("HomePage Banner Loaded");
        },
        onAdClosed: (ad) {
          ad.dispose();
          isWebViewBannerLoaded1 = false;
        },
        onAdFailedToLoad: (ad, error) {
          log(error.toString());
          isWebViewBannerLoaded1 = false;
        },
      ),
      request: AdRequest(),
    );
    await webViewbanner1.load();
    notifyListeners();
  }
}
