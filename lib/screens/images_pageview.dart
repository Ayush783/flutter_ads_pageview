import 'package:app/widgets/ad_page.dart';
import 'package:app/widgets/image_page.dart';
import 'package:flutter/material.dart';

class ImagesPageview extends StatefulWidget {
  const ImagesPageview({super.key});

  @override
  State<ImagesPageview> createState() => _ImagesPageviewState();
}

class _ImagesPageviewState extends State<ImagesPageview> {
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) {
        if (index + 1 % 4 == 0) {
          return const AdPage();
        }
        return const ImagePage();
      },
    );
  }
}
