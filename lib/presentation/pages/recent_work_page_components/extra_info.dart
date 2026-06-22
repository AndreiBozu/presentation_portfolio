import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/recent_work_item_model.dart';
import 'package:presentation_portfolio/presentation/widgets/shimmer_loading.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ExtraInfo extends StatefulWidget {
  const ExtraInfo({
    super.key,
    required this.item,
    required this.reverse,
    required this.isWeb,
    this.accentColor = AppColor.greenLight,
  });
  final ExtraItem item;
  final bool reverse;
  final bool isWeb;
  final Color accentColor;

  @override
  State<ExtraInfo> createState() => _ExtraInfoState();
}

class _ExtraInfoState extends State<ExtraInfo> {
  YoutubePlayerController? controller;
  bool videoReady = false;

  bool get _isVideo => widget.item.videoId != null;

  @override
  void dispose() {
    controller?.close();
    super.dispose();
  }

  /// Lazily create the player only once the media scrolls into view.
  void _initVideo() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (!mounted || controller != null) return;
      controller = YoutubePlayerController.fromVideoId(
        videoId: widget.item.videoId!,
        autoPlay: true,
        params: const YoutubePlayerParams(
          mute: true,
          showControls: false,
          loop: true,
          showFullscreenButton: false,
          // Make the video purely decorative: it loops muted and ignores
          // all pointer events so it can't be clicked or paused.
          pointerEvents: PointerEvents.none,
        ),
      );
      controller!.listen((value) {
        if (!videoReady && mounted && value.playerState == PlayerState.playing) {
          setState(() => videoReady = true);
        }
      });
      // Fallback: never let the shimmer stick if the player never reports play.
      Future.delayed(const Duration(seconds: 6), () {
        if (mounted && !videoReady) setState(() => videoReady = true);
      });
      setState(() {});
    });
  }

  BorderRadius get _radius => BorderRadius.circular(12.sp);

  /// Decorated frame shared by image and video media.
  Widget _mediaFrame({required Widget child}) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: _radius,
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withValues(alpha: 0.12),
            blurRadius: 24,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget _media({
    required double width,
    required double height,
    required double aspectRatio,
  }) {
    // Images render immediately — no loading state.
    if (!_isVideo) {
      return _mediaFrame(
        child: SizedBox(
          width: width,
          height: height,
          child: ClipRRect(
            borderRadius: _radius,
            child: Image.asset(
              "assets/${widget.item.imagePath}",
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
    }

    // Videos fill the same phone-shaped box as the images. The player is
    // sized to its native aspect ratio and cover-cropped (overflowing the
    // narrow dimension) so the letterbox bars are clipped away instead of
    // showing the video as a thin strip. They are non-interactive and show a
    // shimmer until ready.
    final double boxAspect = width / height;
    final bool fillHeight = boxAspect < aspectRatio;
    final double innerWidth = fillHeight ? height * aspectRatio : width;
    final double innerHeight = fillHeight ? height : width / aspectRatio;

    return VisibilityDetector(
      key: Key("video_${widget.item.videoId}"),
      onVisibilityChanged: (VisibilityInfo info) {
        if (info.visibleFraction > 0.3 && controller == null) {
          _initVideo();
        }
      },
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (controller != null)
              ClipRect(
                child: OverflowBox(
                  minWidth: innerWidth,
                  maxWidth: innerWidth,
                  minHeight: innerHeight,
                  maxHeight: innerHeight,
                  child: YoutubePlayer(
                    controller: controller!,
                    aspectRatio: aspectRatio,
                    gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
                    enableFullScreenOnVerticalDrag: false,
                  ),
                ),
              ),
            Positioned.fill(
              child: AnimatedOpacity(
                opacity: videoReady ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 450),
                child: IgnorePointer(
                  ignoring: videoReady,
                  child: ShimmerBox(
                    borderRadius: BorderRadius.zero,
                    showVideoHint: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title({TextAlign align = TextAlign.start}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 5.w,
          height: 24.sp,
          decoration: BoxDecoration(
            color: widget.accentColor,
            borderRadius: BorderRadius.circular(4.sp),
          ),
        ),
        SizedBox(width: 12.w),
        Flexible(
          child: Text(
            widget.item.title,
            style: TextStyles.recentWorkExtraItemTitle,
            textAlign: align,
          ),
        ),
      ],
    );
  }

  Widget _description() {
    return Text(
      widget.item.description,
      style: TextStyles.recentWorkParagraphGrey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 28.h,
        horizontal: 120.w,
      ),
      child: !widget.isWeb
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.reverse) ...[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _title(),
                        SizedBox(height: 18.h),
                        _description(),
                      ],
                    ),
                  ),
                  SizedBox(width: 48.w),
                ],
                _media(width: 300.w, height: 648.h, aspectRatio: 16 / 9),
                if (!widget.reverse) ...[
                  SizedBox(width: 48.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _title(),
                        SizedBox(height: 18.h),
                        _description(),
                      ],
                    ),
                  ),
                ],
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _title(align: TextAlign.center),
                if (widget.item.description.isNotEmpty) ...[
                  SizedBox(height: 16.h),
                  _description(),
                ],
                SizedBox(height: 28.h),
                _media(width: 720.w, height: 400.h, aspectRatio: 16 / 9),
              ],
            ),
    );
  }
}
