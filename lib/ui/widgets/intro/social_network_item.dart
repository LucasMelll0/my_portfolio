import 'package:flutter/cupertino.dart';

import '../../../utils/assets.dart';

class SocialNetworkItem extends StatelessWidget {
  const SocialNetworkItem({super.key, required this.url, required this.image});

  final String url;
  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrlFromString(url),
      child: Image.network(
          width: 50,
          image),
    );
  }
}
