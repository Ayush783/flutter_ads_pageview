import 'package:app/provider/app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImagePage extends StatefulWidget {
  const ImagePage({super.key});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  Future<String>? imgUrl;

  @override
  void initState() {
    fetchImageUrl(context);
    super.initState();
  }

  void fetchImageUrl(BuildContext context) {
    imgUrl = context.read<AppProvider>().loadRandomImage();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: imgUrl,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Image.network(
            snapshot.data as String,
            fit: BoxFit.fitHeight,
          );
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        } else {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(),
              ),
            ],
          );
        }
      },
    );
  }
}
