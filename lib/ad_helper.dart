import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdHelper {
  static String get bannerAdUnitId1 {
    if (Platform.isAndroid) {
      // return "ca-app-pub-9854745246269551~5481703410";
      return "ca-app-pub-9854745246269551/8539999649";
      // } else if (Platform.isIOS) {
      //   return "ca-app-pub-9854745246269551/8539999649";
    } else {
      throw UnsupportedError("Unssupported Platform");
    }
  }

  static String get fullPageAd {
    if (Platform.isAndroid) {
      return "ca-app-pub-9854745246269551/3413727674"; 
      // return "ca-app-pub-3940256099942544/1033173712";   //test ad
      // } else if (Platform.isIOS) {
      //   return "your interstitial ad unit id for ios";
    } else {
      throw UnsupportedError("Unssupported Platform");
    }
  }

  static String get detailsPageBanner {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/3419835294";
      // } else if (Platform.isIOS) {
      //   return "your interstitial ad unit id for ios";
    } else {
      throw UnsupportedError("Unssupported Platform");
    }
  }

  static String get bannerAdUnitId2 {
    if (Platform.isAndroid) {
      // return "ca-app-pub-9854745246269551~5481703410";
      return "ca-app-pub-9854745246269551/2675361070";
      // } else if (Platform.isIOS) {
      //   return "ca-app-pub-9854745246269551/8539999649";
    } else {
      throw UnsupportedError("Unssupported Platform");
    }
  }

  static String get bannerAdUnitId3 {
    if (Platform.isAndroid) {
      // return "ca-app-pub-9854745246269551~5481703410";
      return "ca-app-pub-9854745246269551/9049197737";
      // } else if (Platform.isIOS) {
      //   return "ca-app-pub-9854745246269551/8539999649";
    } else {
      throw UnsupportedError("Unssupported Platform");
    }
  }

  static String get bannerAdUnitId4 {
    if (Platform.isAndroid) {
      // return "ca-app-pub-9854745246269551~5481703410";
      return "ca-app-pub-9854745246269551/3796871057";
      // } else if (Platform.isIOS) {
      //   return "ca-app-pub-9854745246269551/8539999649";
    } else {
      throw UnsupportedError("Unssupported Platform");
    }
  }

  static String get bannerAdUnitId5 {
    if (Platform.isAndroid) {
      // return "ca-app-pub-9854745246269551~5481703410";
      return "ca-app-pub-9854745246269551/1170707712";
      // } else if (Platform.isIOS) {
      //   return "ca-app-pub-9854745246269551/8539999649";
    } else {
      throw UnsupportedError("Unssupported Platform");
    }
  }

  static String get bannerAdUnitId6 {
    if (Platform.isAndroid) {
      // return "ca-app-pub-9854745246269551~5481703410";
      return "ca-app-pub-9854745246269551/8857626042";
      // } else if (Platform.isIOS) {
      //   return "ca-app-pub-9854745246269551/8539999649";
    } else {
      throw UnsupportedError("Unssupported Platform");
    }
  }

  static String get bannerAdUnitId7 {
    if (Platform.isAndroid) {
      // return "ca-app-pub-9854745246269551~5481703410";
      return "ca-app-pub-9854745246269551/3605299367";
      // } else if (Platform.isIOS) {
      //   return "ca-app-pub-9854745246269551/8539999649";
    } else {
      throw UnsupportedError("Unssupported Platform");
    }
  }

  static String get bannerAdUnitId8 {
    if (Platform.isAndroid) {
      // return "ca-app-pub-9854745246269551~5481703410";
      return "ca-app-pub-9854745246269551/5955883114";
      // } else if (Platform.isIOS) {
      //   return "ca-app-pub-9854745246269551/8539999649";
    } else {
      throw UnsupportedError("Unssupported Platform");
    }
  }

  static String get bannerAdUnitId9 {
    if (Platform.isAndroid) {
      // return "ca-app-pub-9854745246269551~5481703410";
      return "ca-app-pub-9854745246269551/5246270825";
      // } else if (Platform.isIOS) {
      //   return "ca-app-pub-9854745246269551/8539999649";
    } else {
      throw UnsupportedError("Unssupported Platform");
    }
  }

  static String get webViewBanner1 {
    if (Platform.isAndroid) {
      return "ca-app-pub-9854745246269551/1007056183";
      // } else if (Platform.isIOS) {
      //   return "your interstitial ad unit id for ios";
    } else {
      throw UnsupportedError("Unssupported Platform");
    }
  }
}
