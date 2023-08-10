import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portifolio/res/dimens.dart';
import 'package:my_portifolio/res/strings.dart';
import 'package:my_portifolio/utils/device_type.dart';
import 'package:my_portifolio/utils/extensions/device_type_extensions.dart';

class AboutSection extends StatelessWidget {
  final BoxConstraints constraints;

  const AboutSection({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SizedBox(
      width: constraints.maxWidth,
      child: Column(
        crossAxisAlignment:
            constraints.maxWidth < DeviceType.mobile.getMaxWidth()
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
        children: [
          Text(
            StringRes.aboutTitle,
            style: (constraints.maxWidth < DeviceType.ipad.getMaxWidth()
                    ? theme.textTheme.titleSmall
                    : theme.textTheme.displaySmall)!
                .copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: defaultPadding,),
          Text(
            StringRes.about,
            style: constraints.maxWidth < DeviceType.ipad.getMaxWidth()
                ? theme.textTheme.bodyMedium
                : theme.textTheme.bodyLarge,
            softWrap: true,
            textAlign: _getTextAlign(constraints.maxWidth),
          )
        ],
      ),
    );
  }

  _getTextAlign(double screenWidth) {
    return screenWidth < DeviceType.mobile.getMaxWidth()
        ? TextAlign.center
        : TextAlign.start;
  }
}
