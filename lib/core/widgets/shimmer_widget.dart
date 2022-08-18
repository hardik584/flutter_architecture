import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  // ignore: use_key_in_widget_constructors
  const ShimmerWidget.rectangular({
    Key? key,
    required this.width,
    required this.height,
    this.shapeBorder = const RoundedRectangleBorder(),
  });

  // ignore: use_key_in_widget_constructors
  const ShimmerWidget.withOutBorder(
      {Key? key, this.width = double.infinity, required this.height})
      : shapeBorder = const RoundedRectangleBorder();

  // ignore: use_key_in_widget_constructors
  const ShimmerWidget.circular(
      {Key? key,
      this.width = double.infinity,
      required this.height,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: const Color(0XFFF1F1F1),
        highlightColor: Colors.white,
        period: const Duration(seconds: 2),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: Colors.grey[400]!,
            shape: shapeBorder,
          ),
        ),
      );
}
