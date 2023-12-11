import 'package:flutter/material.dart';
import 'package:intertech/core/theme/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    return Shimmer.fromColors(
        baseColor: AppColors.shared.shimmerBaseColor,
        highlightColor: AppColors.shared.shimmerHighlightColor,
        period: const Duration(seconds: 2),
        child: widget.child);
  }
}
