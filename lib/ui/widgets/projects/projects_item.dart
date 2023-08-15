import 'package:flutter/material.dart';
import 'package:my_portifolio/res/dimens.dart';
import 'package:my_portifolio/res/strings.dart';

import '../../../utils/assets.dart';

class ProjectsItem extends StatefulWidget {
  const ProjectsItem(
      {super.key,
      required this.image,
      required this.title,
      required this.description,
      required this.repoUrl,
      this.presentation});

  final String image;
  final String title;
  final String description;
  final String repoUrl;
  final String? presentation;

  @override
  State<ProjectsItem> createState() => _ProjectsItemState();
}

class _ProjectsItemState extends State<ProjectsItem> {
  Color? itemColor;
  Color? borderColor;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    itemColor ?? {itemColor = theme.colorScheme.surfaceVariant};
    borderColor ?? {borderColor = theme.colorScheme.onSurfaceVariant};

    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      child: MouseRegion(
        onEnter: (event) => _onEnter(event, theme),
        onExit: (event) => _onExit(event, theme),
        child: LayoutBuilder(builder: (context, constraints) {
          return AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(defaultRadius),
                border: Border.all(color: itemColor!, width: 1),
                color: theme.colorScheme.surfaceVariant),
            child: Padding(
              padding: const EdgeInsets.all(largePadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        widget.image,
                        height: largeImageItemSize,
                        fit: BoxFit.cover,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ],
                  ),
                  const SizedBox(height: largePadding),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        widget.title,
                        style: theme.textTheme.titleLarge!
                            .copyWith(color: theme.colorScheme.onSurfaceVariant),
                      ),
                      Text(
                        widget.description,
                        style: theme.textTheme.titleMedium!
                            .copyWith(color: theme.colorScheme.onSurfaceVariant),
                      )
                    ],
                  ),
                  const SizedBox(height: largePadding),
                  widget.presentation != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(defaultRadius),
                          child: Image.asset(
                            widget.presentation!,
                            fit: BoxFit.cover,
                          ))
                      : const SizedBox(),
                  const SizedBox(height: largePadding),
                  FilledButton(
                      onPressed: () => launchUrlFromString(widget.repoUrl),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(defaultPadding),
                            child: Text(
                              StringRes.projectsButtonText,
                              style: theme.textTheme.titleMedium!
                                  .copyWith(color: theme.colorScheme.onPrimary),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  void _onEnter(event, ThemeData theme) {
    setState(() {
      itemColor = theme.colorScheme.primary;
      borderColor = theme.colorScheme.onPrimary;
    });
  }

  void _onExit(event, ThemeData theme) {
    setState(() {
      itemColor = theme.colorScheme.surfaceVariant;
      borderColor = theme.colorScheme.onSurfaceVariant;
    });
  }
}
