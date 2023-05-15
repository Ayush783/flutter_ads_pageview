import 'package:app/provider/app_provider.dart';
import 'package:app/widgets/ad_page.dart';
import 'package:app/widgets/image_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImagesPageview extends StatefulWidget {
  const ImagesPageview({super.key});

  @override
  State<ImagesPageview> createState() => _ImagesPageviewState();
}

class _ImagesPageviewState extends State<ImagesPageview> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (context.read<AppProvider>().bannerAd == null) {
        context.read<AppProvider>().loadAd('YOUR_AD_ID');
      }
    });
  }

  @override
  void deactivate() {
    context.read<AppProvider>().disposeAd();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      onPageChanged: (value) async {
        if (value + 3 % 4 == 0) {
          context.read<AppProvider>().loadAd('YOUR_AD_ID');
        }
      },
      itemBuilder: (context, index) {
        if (index + 1 % 4 == 0) {
          return const AdPage();
        }
        return const ImagePage();
      },
    );
  }
}
