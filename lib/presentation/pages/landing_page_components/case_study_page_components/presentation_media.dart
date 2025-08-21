import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/data/models/case_study_item_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';


class PresentationMedia extends StatefulWidget {
  const PresentationMedia({
    super.key,
    required this.caseStudyItem,
    this.isMobile = false
  });
  final CaseStudyItemModel caseStudyItem;
  final bool isMobile;

  @override
  State<PresentationMedia> createState() => _PresentationMediaState();
}

class _PresentationMediaState extends State<PresentationMedia> {
  YoutubePlayerController? controller;

  @override
  void initState() {
    if(widget.caseStudyItem.videoPath != null) {
      controller = YoutubePlayerController.fromVideoId(
        videoId: widget.caseStudyItem.videoPath!,
        autoPlay: true,
        params: YoutubePlayerParams(
          mute: true,
          showControls: true,
          loop: true,
          showFullscreenButton: true,
        )
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (ScreenUtil().screenWidth * (widget.isMobile ? 0.9 : 0.7)) * 0.5625, width: ScreenUtil().screenWidth * (widget.isMobile ? 0.9 : 0.7),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.sp),
        child: widget.caseStudyItem.videoPath == null ? Image.asset(
          "assets/images/${widget.caseStudyItem.imgDescriptionPath}",
          fit: BoxFit.fill,
        ) : YoutubePlayer(
          controller: controller!,
          aspectRatio: 1/16,
        )
      ),
    );
  }
}
