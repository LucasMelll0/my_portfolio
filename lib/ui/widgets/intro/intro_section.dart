import 'package:flutter/material.dart';
import 'package:my_portifolio/ui/widgets/intro/intro_photo.dart';
import 'package:my_portifolio/ui/widgets/intro/intro_text.dart';
import 'package:my_portifolio/utils/extensions/context_extensions.dart';
import 'package:my_portifolio/utils/extensions/device_type_extensions.dart';

import '../../../res/dimens.dart';
import '../../../utils/device_type.dart';

class IntroSection extends StatelessWidget {
  final BoxConstraints constraints;

  const IntroSection({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height,
      child: constraints.maxWidth < DeviceType.mobile.getMaxWidth()
          ? Column(
              children: [
                const IntroPhoto(),
                const SizedBox(height: largePadding),
                IntroText(constraints: constraints)
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(child: IntroText(constraints: constraints)),
                const IntroPhoto()
              ],
            ),
    );
  }
}
