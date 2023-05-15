import 'dart:convert';

import 'package:app/api_keys.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;

class AppProvider extends ChangeNotifier {
  Future<String> loadRandomImage() async {
    final response = await http.get(Uri.parse(
        'https://api.unsplash.com/photos/random?client_id=$unsplashApiKey'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final String url = data['urls']['regular'];
      return url;
    }
    return 'https://images.unsplash.com/photo-1684069158042-de27cd720172?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80';
  }

  BannerAd? _bannerAd;

  BannerAd? get bannerAd => _bannerAd;

  set bannerAd(BannerAd? ad) {
    _bannerAd = ad;
    notifyListeners();
  }

  bool _loadingAd = false;

  bool get loadingAd => _loadingAd;

  set loadingAd(bool val) {
    _loadingAd = val;
    notifyListeners();
  }

  void loadAd(String adId) async {
    loadingAd = true;
    await _bannerAd?.dispose();
    bannerAd = BannerAd(
      adUnitId: adId,
      request: const AdRequest(),
      size: const AdSize(width: 320, height: 480),
      listener: BannerAdListener(
        onAdLoaded: (_) {},
        onAdClicked: (_) {},
        onAdImpression: (ad) {},
        onAdFailedToLoad: (ad, err) {},
      ),
    );
    await _bannerAd?.load();
    loadingAd = false;
  }

  void disposeAd() {
    _bannerAd?.dispose();
    _bannerAd = null;
  }
}
