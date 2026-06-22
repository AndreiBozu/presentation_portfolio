import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_color.dart';

/// A lightweight, self-contained animated shimmer placeholder.
///
/// Used while media (videos) are still loading. It paints a soft gradient
/// highlight that sweeps horizontally across the box, and can optionally show a
/// centered play hint so the user knows a video is on the way.
class ShimmerBox extends StatefulWidget {
  const ShimmerBox({
    super.key,
    this.width,
    this.height,
    this.borderRadius,
    this.showVideoHint = false,
  });

  final double? width;
  final double? height;
  final BorderRadius? borderRadius;
  final bool showVideoHint;

  @override
  State<ShimmerBox> createState() => _ShimmerBoxState();
}

class _ShimmerBoxState extends State<ShimmerBox>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1400),
  )..repeat();

  static const Color _base = Color(0xFFE7E7ED);
  static const Color _highlight = Color(0xFFF6F6FB);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final BorderRadius radius = widget.borderRadius ?? BorderRadius.circular(12.sp);

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final double t = _controller.value;
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: radius,
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: const [_base, _highlight, _base],
              stops: [
                (t - 0.35).clamp(0.0, 1.0),
                t.clamp(0.0, 1.0),
                (t + 0.35).clamp(0.0, 1.0),
              ],
            ),
          ),
          alignment: Alignment.center,
          child: widget.showVideoHint
              ? Container(
                  width: 64.sp,
                  height: 64.sp,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.white.withValues(alpha: 0.75),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.black.withValues(alpha: 0.08),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.play_arrow_rounded,
                    size: 38.sp,
                    color: AppColor.grey,
                  ),
                )
              : null,
        );
      },
    );
  }
}
