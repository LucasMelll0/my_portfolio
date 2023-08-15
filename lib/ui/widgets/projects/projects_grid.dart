import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_portifolio/ui/widgets/projects/projects_item.dart';
import 'package:my_portifolio/utils/extensions/device_type_extensions.dart';

import '../../../data/app_data.dart';
import '../../../utils/device_type.dart';

class ProjectsGrid extends StatelessWidget {
  const ProjectsGrid({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: AppData.mainProjects.length,
      gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _getCrossAxisCount(constraints.maxWidth)),
      itemBuilder: (BuildContext context, int index) {
        var project = AppData.mainProjects[index];
        return ProjectsItem(
          image: project.image,
          title: project.title,
          description: project.description,
          repoUrl: project.repoUrl,
          presentation: project.presentation,
        );
      },
    );
  }

  int _getCrossAxisCount(double deviceWidth) {
    int numOfTechnologies = AppData.mainProjects.length;
    if (deviceWidth < DeviceType.ipad.getMaxWidth()) {
      return 1;
    } else {
      return numOfTechnologies > 2 ? 2 : numOfTechnologies;
    }
  }
}
