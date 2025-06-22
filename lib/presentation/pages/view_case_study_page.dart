import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/models/case_study_item_model.dart';
import 'package:presentation_portfolio/presentation/widgets/buttons.dart';
import 'package:presentation_portfolio/presentation/widgets/top_navigation_bar.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';


class ViewCaseStudyPage extends StatelessWidget {
  const ViewCaseStudyPage({
    super.key,
    required this.caseStudyItem
  });
  final CaseStudyModelItem caseStudyItem;

  @override
  Widget build(BuildContext context) {
    final controller = YoutubePlayerController.fromVideoId(
      videoId: '5fEU3aJQzCU',
      autoPlay: true,
      params: YoutubePlayerParams(
        mute: true,
        showControls: true,
        loop: true,
        showFullscreenButton: false,
      ),
    );

    return Scaffold(
      body: SizedBox(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 250.w,
                        height: 530.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.sp),
                          child: Image.asset(
                            "assets/${caseStudyItem.imagePath}",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      SizedBox(
                        width: 300.w,
                        height: 530.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "TITLE TEXT",
                              style: TextStyles.sectionTitleNameBlack,
                            ),
                            Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                              style: TextStyles.paragraphGrey,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Buttons.squareTextButton(
                                  onPressed: () {},
                                  backgroundColor: Colors.blue,
                                  textColor: Colors.white,
                                  verticalPadding: 12.h,
                                  horizontalPadding: 35.w,
                                  text: "App store",
                                ),
                                Buttons.squareTextButton(
                                  onPressed: () {},
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  horizontalPadding: 30.w,
                                  verticalPadding: 12.h,
                                  text: "Google Play",
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Buttons.squareTextButton(
                                  onPressed: () {},
                                  backgroundColor: Colors.blue,
                                  textColor: Colors.white,
                                  verticalPadding: 12.h,
                                  horizontalPadding: 35.w,
                                  text: "WEB",
                                ),
                                Buttons.squareTextButton(
                                  onPressed: () {},
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  horizontalPadding: 35.w,
                                  verticalPadding: 12.h,
                                  text: "GitHub",
                                )
                              ],
                            )
                          ],
                        )
                      )
                    ],
                  ),
                  SizedBox(
                    height: 600,
                    width: 300,
                    child: YoutubePlayer(
                      controller: controller,
                      aspectRatio: 9 / 16,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              child: const TopNavigationBar(),
            )
          ],
        ),
      )
    );
  }
}
