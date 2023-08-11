import 'package:flutter/material.dart';
import 'package:my_portifolio/utils/assets.dart';

class IntroPhoto extends StatelessWidget {
  const IntroPhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: loadImageAsset(myPhotoPath),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(144),
                child: snapshot.data!,
              ),
            );
          }
          return const CircularProgressIndicator();
        });
  }
}
