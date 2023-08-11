import 'package:flutter/material.dart';
import 'package:my_portifolio/data/app_data.dart';
import 'package:my_portifolio/ui/widgets/technologies/main_technologies_item.dart';
import 'package:my_portifolio/utils/device_type.dart';
import 'package:my_portifolio/utils/extensions/device_type_extensions.dart';

class MainTechnologiesGrid extends StatelessWidget {
  const MainTechnologiesGrid({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _getCrossAxisCount(constraints.maxWidth),
          childAspectRatio: _getAspectRatio(constraints.maxWidth),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16),
      scrollDirection: Axis.vertical,
      children: AppData.mainTechnologies
          .map((e) => SizedBox(
            child: MainTechnologiesItem(
                title: e.title,
                description: e.description,
                image: e.image,
          )))
          .toList(),
    );
  }

  int _getCrossAxisCount(double deviceWidth) {
    int numOfTechnologies = AppData.mainTechnologies.length;
    if (deviceWidth < DeviceType.mobile.getMaxWidth()) {
      return 1;
    } else if (deviceWidth < DeviceType.ipad.getMaxWidth()) {
      return 2;
    } else if (deviceWidth < DeviceType.smallScreen.getMaxWidth()) {
      return 3;
    } else {
      return numOfTechnologies > 3 ? 3 : numOfTechnologies;
    }
  }

  double _getAspectRatio(double deviceWidth) {
    if (deviceWidth < DeviceType.mobile.getMinWidth()) {
      return 1.1;
    } else if (deviceWidth < DeviceType.ipad.getMinWidth()) {
      return 1.4;
    } else if (deviceWidth < DeviceType.smallScreen.getMaxWidth()) {
      return 1.5;
    } else {
      return 1.6;
    }
  }
}
