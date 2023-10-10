import 'package:dependency_manager/dependency_manager.dart'
    show Shimmer, ShimmerDirection;
import 'package:flutter/material.dart';

class GitsShimmer extends StatelessWidget {
  final ShimmerDirection? direction;
  final Widget child;

  const GitsShimmer({
    Key? key,
    this.direction,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      direction: direction ?? ShimmerDirection.ltr,
      baseColor: Colors.grey.shade200,
      highlightColor: Colors.white,
      child: child,
    );
  }
}
