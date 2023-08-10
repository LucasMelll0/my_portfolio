import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portifolio/utils/extensions/device_type_extensions.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../res/dimens.dart';
import '../../../res/strings.dart';
import '../../../utils/device_type.dart';

class IntroSection extends StatelessWidget {
  final BoxConstraints constraints;

  const IntroSection({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      width: constraints.maxWidth,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Column(
              crossAxisAlignment:
                  constraints.maxWidth < DeviceType.mobile.getMaxWidth()
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
              children: [
                Text(
                  StringRes.presentation,
                  style: constraints.maxWidth < DeviceType.ipad.getMaxWidth()
                      ? theme.textTheme.titleSmall
                      : theme.textTheme.titleLarge,
                  textAlign: _getTextAlign(constraints.maxWidth),
                  softWrap: true,
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Text(
                  StringRes.myName,
                  style: (constraints.maxWidth < DeviceType.ipad.getMaxWidth()
                          ? theme.textTheme.displaySmall
                          : theme.textTheme.displayMedium)
                      ?.copyWith(color: theme.colorScheme.primary),
                  textAlign: _getTextAlign(constraints.maxWidth),
                  softWrap: true,
                ),
                introMessage(constraints, theme),
                const SizedBox(
                  height: defaultPadding,
                ),
                socialLinks()
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row socialLinks() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => _launchUrl('https://github.com/LucasMelll0'),
          child: Image.network(
              width: 50,
              "https://img.icons8.com/material-rounded/384/ffffff/github.png"),
        ),
        const SizedBox(
          width: defaultPadding,
        ),
        GestureDetector(
          onTap: () =>
              _launchUrl("https://www.linkedin.com/in/lucas-mello-a43887188/"),
          child: Image.network(
              width: 40,
              "https://img.icons8.com/metro/308/ffffff/linkedin.png"),
        )
      ],
    );
  }

  Future<void> _launchUrl(String url) async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception("Could not launch $url");
    }
  }

  SizedBox introMessage(BoxConstraints constraints, ThemeData theme) {
    return SizedBox(
      width: constraints.maxWidth < DeviceType.mobile.getMaxWidth()
          ? constraints.maxWidth - 20
          : constraints.maxWidth / 2.5,
      child: Text(
        StringRes.introMessage,
        style: constraints.maxWidth < DeviceType.ipad.getMaxWidth()
            ? theme.textTheme.bodyMedium
            : theme.textTheme.bodyLarge,
        softWrap: true,
        textAlign: _getTextAlign(constraints.maxWidth),
      ),
    );
  }

  _getTextAlign(double screenWidth) {
    return screenWidth < DeviceType.mobile.getMaxWidth()
        ? TextAlign.center
        : TextAlign.start;
  }
}
