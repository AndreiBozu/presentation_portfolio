import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/recent_work_item_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class ExtraInfo extends StatelessWidget {
  const ExtraInfo({
    super.key,
    required this.item,
    required this.reverse
  });
  final ExtraItem item;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    final MediaType mediaType = item.videoId != null ? MediaType.video : MediaType.image;
    final controller = (mediaType == MediaType.video) ? YoutubePlayerController.fromVideoId(
      videoId: item.videoId!,
      autoPlay: true,
      params: YoutubePlayerParams(
        pointerEvents: PointerEvents.none,
        mute: true,
        showControls: false,
        loop: true,
        showFullscreenButton: false,
      ),
    ) : null;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 120.w
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(reverse) ...[
            Expanded(
              child: SizedBox(
                height: 304.h,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      item.title,
                      style: TextStyles.recentWorkExtraItemTitle,
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      item.description,
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
              ) : Image.asset(
                "assets/${item.imagePath}",
                fit: BoxFit.fill,
              ),
            )
          ),
          if(!reverse) ...[
            SizedBox(width: 40.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    item.title,
                    style: TextStyles.recentWorkExtraItemTitle,
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    item.description,
                    style: TextStyles.recentWorkParagraphGrey,
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            )
          ]
        ],
      ),
    );
  }
}

enum MediaType {
  video,
  image
}
