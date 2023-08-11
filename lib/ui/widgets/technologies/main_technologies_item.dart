import 'package:flutter/material.dart';

import '../../../res/dimens.dart';

class MainTechnologiesItem extends StatefulWidget {
  const MainTechnologiesItem(
      {super.key,
      required this.title,
      required this.description,
      required this.image});

  final String image;
  final String title;
  final String description;

  @override
  State<StatefulWidget> createState() => _MainTechnologiesItemState();
}

class _MainTechnologiesItemState extends State<MainTechnologiesItem> {
  Color? itemColor;
  Color? contentColor;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    itemColor ?? {itemColor = theme.colorScheme.surfaceVariant};
    contentColor ?? {contentColor = theme.colorScheme.onSurfaceVariant};

    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: itemColor,
          borderRadius: BorderRadius.circular(defaultRadius)),
      child: MouseRegion(
        onEnter: (event) => _onEnter(event, theme),
        onExit: (event) => _onExit(event, theme),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              height: 48,
              widget.image,
              color: contentColor,
            ),
            const SizedBox(height: defaultPadding,),
            FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.title,
                    style: theme.textTheme.titleMedium!
                        .copyWith(color: contentColor),
                  ),
                  Text(
                    widget.description,
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: contentColor),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void _onEnter(event, ThemeData theme) {
    setState(() {
      itemColor = theme.colorScheme.primary;
      contentColor = theme.colorScheme.onPrimary;
    });
  }

  void _onExit(event, ThemeData theme) {
    setState(() {
      itemColor = theme.colorScheme.surfaceVariant;
      contentColor = theme.colorScheme.onSurfaceVariant;
    });
  }
}
