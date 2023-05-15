import 'package:app/provider/app_provider.dart';
import 'package:app/screens/images_pageview.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      child: MaterialApp(
        title: 'Image Gallery',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ImagesPageview(),
      ),
    );
  }
}
