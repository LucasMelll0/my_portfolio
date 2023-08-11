import 'package:flutter/cupertino.dart';

class GradientText extends StatelessWidget {
  const GradientText(
      {super.key,
      required this.text,
      required this.gradient,
      this.style,
      this.textAlign,
      this.softWrap});

  final String text;
  final TextStyle? style;
  final Gradient gradient;
  final TextAlign? textAlign;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient
          .createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(
        text,
        style: style,
        textAlign: textAlign,
        softWrap: softWrap,
      ),
    );
  }
}
