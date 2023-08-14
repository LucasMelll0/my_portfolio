import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portifolio/utils/assets.dart';
import 'package:my_portifolio/utils/extensions/device_type_extensions.dart';

import '../../../res/dimens.dart';
import '../../../res/strings.dart';
import '../../../utils/device_type.dart';
import '../common/gradient_text.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(
      crossAxisAlignment: constraints.maxWidth < DeviceType.mobile.getMaxWidth()
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          StringRes.presentation,
          style: constraints.maxWidth < DeviceType.ipad.getMaxWidth()
              ? theme.textTheme.titleSmall
              : theme.textTheme.titleLarge,
          textAlign: _getTextAlign(constraints.maxWidth),
          softWrap: true,
        ),
        const SizedBox(height: defaultPadding),
        GradientText(
          text: StringRes.myName,
          gradient: LinearGradient(colors: [
            theme.colorScheme.primary,
            theme.colorScheme.secondary,
            theme.colorScheme.tertiary
          ]),
          style: (constraints.maxWidth < DeviceType.ipad.getMaxWidth()
                  ? theme.textTheme.displaySmall
                  : theme.textTheme.displayMedium)
              ?.copyWith(color: theme.colorScheme.primary),
          textAlign: _getTextAlign(constraints.maxWidth),
          softWrap: true,
        ),
        introMessage(constraints, theme),
        const SizedBox(height: defaultPadding),
        socialLinks()
      ],
    );
  }

  Row socialLinks() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => launchUrlFromString('https://github.com/LucasMelll0'),
          child: Image.network(
              width: 50,
              "https://img.icons8.com/material-rounded/384/ffffff/github.png"),
        ),
        const SizedBox(
          width: defaultPadding,
        ),
        GestureDetector(
          onTap: () => launchUrlFromString(
              "https://www.linkedin.com/in/lucas-mello-a43887188/"),
          child: Image.network(
              width: 40,
              "https://img.icons8.com/metro/308/ffffff/linkedin.png"),
        )
      ],
    );
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
