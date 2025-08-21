import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/recent_work_item_model.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ExtraInfoMobile extends StatefulWidget {
  const ExtraInfoMobile({
    super.key,
    required this.item,
    required this.reverse
  });
  final ExtraItem item;
  final bool reverse;

  @override
  State<ExtraInfoMobile> createState() => _ExtraInfoMobileState();
}

class _ExtraInfoMobileState extends State<ExtraInfoMobile> {
  YoutubePlayerController? controller;
  bool visible = false;


  @override
  Widget build(BuildContext context) {
    final MediaType mediaType = widget.item.videoId != null ? MediaType.video : MediaType.image;

    return VisibilityDetector(
      key: Key(mediaType == MediaType.video ? widget.item.videoId! : widget.item.imagePath!),
      onVisibilityChanged: (VisibilityInfo visibilityInfo) {
        if (visibilityInfo.visibleFraction > 0.8) {
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
          horizontal: 30.w
        ),
        child: visible ? Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(widget.reverse) ...[
              Expanded(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 504.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Text(
                        widget.item.title,
                        style: TextStyles.mobileRecentWorkExtraItemTitle,
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        widget.item.description,
                        style: TextStyles.mobileRecentWorkParagraphGrey,
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                )
              ),
              SizedBox(width: 20.w),
            ],
            SizedBox(
                width: 300.w,
                height: 648.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.sp),
                  child: (mediaType == MediaType.video) ? YoutubePlayer(
                    controller: controller!,
                    aspectRatio: 2.16,
                  ) : Image.asset(
                    "assets/${widget.item.imagePath}",
                    fit: BoxFit.fill,
                  ),
                )
            ),
            if(!widget.reverse) ...[
              SizedBox(width: 20.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      widget.item.title,
                      style: TextStyles.mobileRecentWorkExtraItemTitle,
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      widget.item.description,
                      style: TextStyles.mobileRecentWorkParagraphGrey,
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              )
            ]
          ],
        ) : const SizedBox(),
      ),
    );
  }
}

enum MediaType {
  video,
  image
}
