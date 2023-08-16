import 'package:flutter/material.dart';
import 'package:my_portifolio/res/dimens.dart';
import 'package:my_portifolio/ui/widgets/about/about_section.dart';
import 'package:my_portifolio/ui/widgets/intro/intro_section.dart';
import 'package:my_portifolio/ui/widgets/intro/social_network_list.dart';
import 'package:my_portifolio/ui/widgets/projects/projects_section.dart';
import 'package:my_portifolio/ui/widgets/technologies/main_technologies.dart';
import 'package:my_portifolio/utils/device_type.dart';
import 'package:my_portifolio/utils/extensions/context_extensions.dart';
import 'package:my_portifolio/utils/extensions/device_type_extensions.dart';

import '../res/strings.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey homeKey = GlobalKey();
  GlobalKey aboutKey = GlobalKey();
  GlobalKey technologiesKey = GlobalKey();
  GlobalKey projectsKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        drawer: context.width < DeviceType.ipad.getMaxWidth()
            ? Drawer(
                child: ListView(
                  children: _getActions(),
                ),
              )
            : null,
        appBar: AppBar(
          actions: context.width > DeviceType.ipad.getMaxWidth()
              ? _getActions()
              : [],
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: widget._scrollController,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: constraints.maxHeight * .12,
                horizontal: context.width > DeviceType.mobile.getMaxWidth()
                    ? constraints.maxHeight * 0.12
                    : constraints.maxHeight * 0.05),
            child: Column(
              crossAxisAlignment:
                  constraints.maxWidth < DeviceType.mobile.getMaxWidth()
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
              children: [
                IntroSection(key: homeKey, constraints: constraints),
                _getDivider(constraints),
                AboutSection(key: aboutKey, constraints: constraints),
                _getDivider(constraints),
                MainTechnologies(
                    key: technologiesKey, constraints: constraints),
                _getDivider(constraints),
                Projects(key: projectsKey, constraints: constraints),
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

  _scrollTo(GlobalKey key) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).maybePop();
      Scrollable.ensureVisible(key.currentContext!,
          duration: const Duration(milliseconds: 300));
    });
  }

  Widget _getDivider(BoxConstraints constraints) {
    return Column(
      children: [
        SizedBox(
          height: context.width <= DeviceType.mobile.getMaxWidth()
              ? constraints.maxHeight * .10
              : constraints.maxHeight * .20,
        ),
        Divider(
          thickness: 1,
          endIndent: constraints.maxWidth < DeviceType.mobile.getMaxWidth()
              ? null
              : constraints.maxWidth * .20,
        ),
        SizedBox(
          height: context.width <= DeviceType.mobile.getMaxWidth()
              ? constraints.maxHeight * .10
              : constraints.maxHeight * .20,
        )
      ],
    );
  }

  List<Widget> _getActions() {
    var theme = Theme.of(context);
    TextStyle? textStyle =
        theme.textTheme.titleLarge!.copyWith(color: theme.colorScheme.primary);

    return [
      TextButton(
        onPressed: () {
          _scrollTo(homeKey);
        },
        child: Text(
          StringRes.homeSection,
          style: textStyle,
        ),
      ),
      TextButton(
        onPressed: () {
          _scrollTo(aboutKey);
        },
        child: Text(
          StringRes.aboutSection,
          style: textStyle,
        ),
      ),
      TextButton(
        onPressed: () {
          _scrollTo(technologiesKey);
        },
        child: Text(
          StringRes.technologiesSection,
          style: textStyle,
        ),
      ),
      TextButton(
        onPressed: () {
          _scrollTo(projectsKey);
        },
        child: Text(
          StringRes.projectsSection,
          style: textStyle,
        ),
      )
    ];
  }

  @override
  void dispose() {
    widget._scrollController.dispose();
    super.dispose();
  }
}
