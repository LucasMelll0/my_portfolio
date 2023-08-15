import 'package:flutter/cupertino.dart';
import 'package:my_portifolio/data/app_data.dart';
import 'package:my_portifolio/res/dimens.dart';
import 'package:my_portifolio/ui/widgets/intro/social_network_item.dart';

class SocialNetworkList extends StatelessWidget {
  const SocialNetworkList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: AppData.socialNetworks
          .map((e) => Container(
              padding: const EdgeInsets.only(right: defaultPadding),
              height: defaultImageItemSize,
              child: SocialNetworkItem(url: e.url, image: e.image)))
          .toList(),
    );
  }
}
