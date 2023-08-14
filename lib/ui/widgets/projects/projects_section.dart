import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portifolio/res/strings.dart';
import 'package:my_portifolio/ui/widgets/common/gradient_text.dart';
import 'package:my_portifolio/ui/widgets/projects/projects_grid.dart';
import 'package:my_portifolio/utils/extensions/device_type_extensions.dart';

import '../../../res/dimens.dart';
import '../../../utils/device_type.dart';

class Projects extends StatelessWidget {
  const Projects({super.key, required this.constraints});

  final BoxConstraints constraints;

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
          GradientText(
            text: StringRes.projectsTitle,
            gradient: LinearGradient(colors: [
              theme.colorScheme.primary,
              theme.colorScheme.secondary,
              theme.colorScheme.tertiary
            ]),
            style: (constraints.maxWidth < DeviceType.ipad.getMaxWidth()
                    ? theme.textTheme.titleLarge
                    : theme.textTheme.displaySmall)!
                .copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: largePadding),
          ProjectsGrid(constraints: constraints)
        ],
      ),
    );
  }
}
