import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/recent_work_item_model.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ExtraInfo extends StatefulWidget {
  const ExtraInfo({
    super.key,
    required this.item,
    required this.reverse,
    required this.isWeb
  });
  final ExtraItem item;
  final bool reverse;
  final bool isWeb;

  @override
  State<ExtraInfo> createState() => _ExtraInfoState();
}

class _ExtraInfoState extends State<ExtraInfo> {
  YoutubePlayerController? controller;
  bool visible = false;


  @override
  Widget build(BuildContext context) {
    final MediaType mediaType = widget.item.videoId != null ? MediaType.video : MediaType.image;

    return VisibilityDetector(
      key: Key(mediaType == MediaType.video ? widget.item.videoId! : widget.item.imagePath!),
      onVisibilityChanged: (VisibilityInfo visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.3) {
          Future.delayed(const Duration(milliseconds: 500), () {
            visible = true;
            controller = (mediaType == MediaType.video) ? YoutubePlayerController.fromVideoId(
              videoId: widget.item.videoId!,
              autoPlay: true,
              params: YoutubePlayerParams(
                mute: true,
                showControls: true,
                loop: true,
                showFullscreenButton: true,
              ),
            ) : null;
            if(mounted) {
              setState(() {});
            }
          });
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
          horizontal: 120.w
        ),
        child: visible ? !widget.isWeb ? Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(widget.reverse) ...[
              Expanded(
                child: SizedBox(
                  height: 504.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        widget.item.title,
                        style: TextStyles.recentWorkExtraItemTitle,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        widget.item.description,
                        style: TextStyles.recentWorkParagraphGrey,
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                )
              ),
              SizedBox(width: 40.w),
            ],
            SizedBox(
              width: 300.w,
              height: 648.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.sp),
                child: (mediaType == MediaType.video) ? YoutubePlayer(
                  controller: controller!,
                  aspectRatio: 2.16,
                  gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
                  enableFullScreenOnVerticalDrag: false,
                ) : Image.asset(
                  "assets/${widget.item.imagePath}",
                  fit: BoxFit.fill,
                ),
              )
            ),
            if(!widget.reverse) ...[
              SizedBox(width: 40.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      widget.item.title,
                      style: TextStyles.recentWorkExtraItemTitle,
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      widget.item.description,
                      style: TextStyles.recentWorkParagraphGrey,
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              )
            ]
          ],
        ): Column(
          children: [
            SizedBox(height: 20.h),
            Text(
              widget.item.title,
              style: TextStyles.recentWorkExtraItemTitle,
            ),
            if( widget.item.description.isNotEmpty)...[
              SizedBox(height: 15.h),
              Text(
                widget.item.description,
                style: TextStyles.recentWorkParagraphGrey,
              ),
            ],
            SizedBox(height: 20.h),
            SizedBox(
              width: 720.w,
              height: 400.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6.sp),
                child: (mediaType == MediaType.video) ? YoutubePlayer(
                  controller: controller!,
                  aspectRatio: 1.77,
                  gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
                  enableFullScreenOnVerticalDrag: false,
                ) : Image.asset(
                  "assets/${widget.item.imagePath}",
                  fit: BoxFit.fill,
                ),
              )
            ),
            SizedBox(height: 20.h),
          ],
        ) : Padding(
          padding: EdgeInsets.only(bottom: 200.sp),
          child: SizedBox(
            height: 120.sp,
            width: 120.sp,
            child: CircularProgressIndicator(color: AppColor.grey),
          ),
        ),
      ),
    );
  }
}

enum MediaType {
  video,
  image
}
