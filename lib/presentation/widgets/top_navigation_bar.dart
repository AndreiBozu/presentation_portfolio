import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/presentation/widgets/buttons.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double borderRadius = 10.0;

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
                Buttons.textButton(
                  text: "Home",
                  onPressed: () {

                  }
                ),
                Buttons.textButton(
                  text: "Case studies",
                  onPressed: () {

                  }
                ),
                Buttons.textButton(
                  text: "Recent work",
                  onPressed: () {

                  }
                ),
                Buttons.textButton(
                  text: "Get in Touch",
                  onPressed: () {

                  }
                )
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
