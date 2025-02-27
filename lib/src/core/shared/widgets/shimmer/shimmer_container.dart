import 'package:flutter/material.dart';

class ShimmerContainer extends StatefulWidget {
  final double height;
  final double width;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;

  const ShimmerContainer({
    super.key,
    required this.height,
    required this.width,
    this.padding,
    this.margin,
    this.border,
    this.borderRadius,
  });

  @override
  State<ShimmerContainer> createState() => _ShimmerContainerState();
}

class _ShimmerContainerState extends State<ShimmerContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shimmerAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    )..repeat(reverse: true);

    _shimmerAnimation = Tween<double>(
      begin: .35,
      end: .85,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shimmerAnimation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          padding: widget.padding,
          margin: widget.margin,
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(_shimmerAnimation.value),
            border: widget.border,
            borderRadius: widget.borderRadius ?? BorderRadius.circular(12.0),
          ),
        );
      },
    );
  }
}
