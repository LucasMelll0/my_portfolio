import 'package:flutter/material.dart';
import 'package:my_portifolio/res/dimens.dart';
import 'package:my_portifolio/ui/widgets/about/about_section.dart';
import 'package:my_portifolio/ui/widgets/intro/intro_section.dart';
import 'package:my_portifolio/ui/widgets/intro/social_network_list.dart';
import 'package:my_portifolio/ui/widgets/projects/projects_section.dart';
import 'package:my_portifolio/ui/widgets/technologies/main_technologies.dart';
import 'package:my_portifolio/utils/device_type.dart';
import 'package:my_portifolio/utils/extensions/device_type_extensions.dart';

import '../res/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return LayoutBuilder(builder: (context, constraints) {
      var appBarTitle = constraints.maxWidth >= 600
          ? Text(
              StringRes.myPortifolio,
              style: theme.textTheme.titleLarge!
                  .copyWith(color: theme.colorScheme.onBackground),
            )
          : null;

      return Scaffold(
        appBar: AppBar(
          title: appBarTitle,
          leading: const Icon(Icons.code),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: constraints.maxHeight * .12,
                horizontal: constraints.maxHeight * 0.12),
            child: Column(
              crossAxisAlignment:
                  constraints.maxWidth < DeviceType.mobile.getMaxWidth()
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
              children: [
                IntroSection(constraints: constraints),
                _getDivider(constraints),
                AboutSection(constraints: constraints),
                _getDivider(constraints),
                MainTechnologies(constraints: constraints),
                _getDivider(constraints),
                Projects(constraints: constraints),
                _getDivider(constraints),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: defaultImageItemSize,
                        child: SocialNetworkList())
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _getDivider(BoxConstraints constraints) {
    return Column(
      children: [
        SizedBox(
          height: constraints.maxHeight * .20,
        ),
        Divider(
          thickness: 1,
          endIndent: constraints.maxWidth < DeviceType.mobile.getMaxWidth()
              ? null
              : constraints.maxWidth * .20,
        ),
        SizedBox(
          height: constraints.maxHeight * .20,
        )
      ],
    );
  }
}
