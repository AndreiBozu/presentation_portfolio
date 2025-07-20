import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/constant.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/data/models/navigation_bar_button_model.dart';
import 'package:presentation_portfolio/presentation/widgets/buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({
    super.key,
    required this.sections,
    required this.callBack
  });
  final List<NavigationBarButtonModel> sections;
  final Function(NavigationBarButtonModel section) callBack;

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 10.0;

    void launchURL(String urlToLaunch) async {
      final Uri url = Uri.parse(urlToLaunch);
      if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
      }
    }

    return Container(
      width: 1110.w,
      height: 70.h,
      padding: EdgeInsets.symmetric(
        horizontal: 80.w
      ),
      decoration: BoxDecoration(
        color: AppColor.darkElement,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius)
        )
      ),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 700.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for(final NavigationBarButtonModel section in sections) ...[
                  Buttons.textButton(
                    text: section.title,
                    onPressed: () => callBack(section)
                  ),
                ]
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Buttons.iconButton(
                  icon: "social-linkedin",
                  onPressed: () {
                    launchURL(Constant.linkedinUrl);
                  }
                ),
                SizedBox(width: 6.w),
                Buttons.iconButton(
                  icon: "github-fill",
                  width: 20.sp,
                  onPressed: () {
                    launchURL(Constant.githubUrl);
                  }
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
