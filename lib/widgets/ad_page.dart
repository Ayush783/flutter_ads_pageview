import 'package:app/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

class AdPage extends StatelessWidget {
  const AdPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerAd = context.watch<AppProvider>().bannerAd;
    final loadingAd = context.watch<AppProvider>().loadingAd;
    return Container(
      color: Colors.grey.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'ADVERTISEMENT',
          ),
          SizedBox(
            width: 380,
            height: 420,
            child: bannerAd != null && !loadingAd
                ? AdWidget(
                    ad: context.read<AppProvider>().bannerAd!,
                  )
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
