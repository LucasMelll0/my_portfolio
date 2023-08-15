import 'package:flutter/material.dart';
import 'package:my_portifolio/res/dimens.dart';

import '../../../utils/assets.dart';

class SocialNetworkItem extends StatelessWidget {
  const SocialNetworkItem({super.key, required this.url, required this.image});

  final String url;
  final IconData image;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextButton(
      style: IconButton.styleFrom(
          shape: const CircleBorder(),
          iconSize: defaultImageItemSize,
          padding:EdgeInsets.all(defaultPadding),),
      onPressed: () => launchUrlFromString(url),
      child: Icon(
        image,
        color: theme.colorScheme.onBackground,
        size: defaultImageItemSize,
      ),
    );
  }
}
