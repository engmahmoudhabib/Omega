import 'package:flutter/material.dart';
import 'package:omega/core/statics/assets_paths.dart';


class AnimatedImage extends StatefulWidget {
  double height;
  double width;
  AnimatedImage({
    Key? key,
    this.height = 0,
    this.width = 0,
  }) : super(key: key);

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage> {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsPaths.appIconWithNoBg,
      height: widget.height,
      width: widget.width,
    );
  }
}