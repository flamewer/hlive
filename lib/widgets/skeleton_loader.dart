// lib/widgets/skeleton_loader.dart
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SkeletonLoader extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final bool isCircle;

  const SkeletonLoader({
    super.key,
    this.width = double.infinity,
    this.height = 16,
    this.shape,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor.withOpacity(0.7),
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: isCircle
            ? null
            : (shape is RoundedRectangleBorder
                  ? (shape as RoundedRectangleBorder).borderRadius
                  : BorderRadius.circular(4)),
      ),
      child: const SizedBox.shrink(),
    );
  }
}

class ShimmerSkeleton extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Color baseColor;
  final Color highlightColor;

  const ShimmerSkeleton({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
  });

  @override
  State<ShimmerSkeleton> createState() => _ShimmerSkeletonState();
}

class _ShimmerSkeletonState extends State<ShimmerSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
    _animation = Tween<double>(begin: -1.0, end: 2.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (Rect bounds) {
            return LinearGradient(
              colors: [
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
              stops: const [0.0, 0.5, 1.0],
              begin: Alignment(_animation.value - 1.0, 0.0),
              end: Alignment(_animation.value, 0.0),
            ).createShader(bounds);
          },
          child: widget.child,
        );
      },
    );
  }
}
