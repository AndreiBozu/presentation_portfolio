import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';

import 'search_textfield.dart';

class CountryCodesSheet extends StatefulWidget {
  const CountryCodesSheet({
    super.key,
    this.callBack,
    required this.countryCodes,
    required this.isMobile,
  });
  final Function? callBack;
  final List<Map> countryCodes;
  final bool isMobile;

  @override
  State<CountryCodesSheet> createState() => _CountryCodesSheetState();
}

class _CountryCodesSheetState extends State<CountryCodesSheet> {
  String textSearched = "";


  @override
  Widget build(BuildContext context) {
    final List listOfCountryCodes = widget.countryCodes;
    final bool isMobile = widget.isMobile;

    return Container(
      height: ScreenUtil().screenHeight * (isMobile ? 0.75 : 0.6),
      width: ScreenUtil().screenWidth * (isMobile ? 0.9 : 0.4),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(6.sp),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.sp,
          right: 20.sp,
          top: 12.sp,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchTextField(
                onTextChange: (text) {
                  setState(() => textSearched = text);
                },
              ),
              SizedBox(height: 20.h),
              for(final Map countryCode in listOfCountryCodes)
                if(countryCode["name"].toString().toLowerCase().contains(textSearched) ||
                    countryCode["name"].toString().contains(textSearched) ||
                    countryCode["countryCode"].toString().contains(textSearched.replaceAll("+", ""))
                )
                  TextButton(
                    onPressed: () {
                      widget.callBack!(countryCode);
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                        overlayColor: WidgetStateProperty.all(AppColor.lightGrey),
                        padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                        shape: WidgetStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.sp))
                        )
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(isMobile ? 18.sp : 10.sp),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 350.w,
                            child: Text(
                              countryCode["name"],
                              semanticsLabel: "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: AppColor.black,
                                fontSize: isMobile ? 24.sp : 16.sp,
                                fontWeight: FontWeight.w400,
                                height: 1,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "+${countryCode["countryCode"]}",
                            semanticsLabel: "",
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: isMobile ? 21.sp : 14.sp,
                              fontWeight: FontWeight.w400,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
            ],
          ),
        ),
      ),
    );
  }
}