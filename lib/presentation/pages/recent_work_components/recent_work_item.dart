import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/presentation/widgets/buttons.dart';


class RecentWorkItem extends StatelessWidget {
  const RecentWorkItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.workKey
  });
  final String image;
  final String title;
  final String description;
  final String workKey;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300.h, width: 530.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.sp),
            child: Image.asset(
              "assets/images/$image",
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          width: 530.w,
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyles.recentWorkProjectTitleName,
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          width: 530.w,
          child: Text(
            description,
            textAlign: TextAlign.start,
            style: TextStyles.paragraphGrey,
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          width: 530.w,
          child: Row(
            children: [
              Buttons.squareTextButton(
                  onPressed: () {

                  },
                  enableShadow: true,
                  textColor: AppColor.white,
                  backgroundColor: AppColor.greenDark,
                  text: "Learn more",
                  textSize: 14.sp,
                  verticalPadding: 10.h,
                  horizontalPadding: 24.w,
                  suffixIcon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColor.white,
                    size: 16.sp,
                  )
              ),
              const Spacer()
            ],
          ),
        )
      ],
    );
  }
}
