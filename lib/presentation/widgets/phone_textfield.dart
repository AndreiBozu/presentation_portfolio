import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';
import 'package:presentation_portfolio/core/theme/text_style.dart';
import 'package:presentation_portfolio/data/services/country_codes.dart';

import 'country_codes_sheet.dart';


class PhoneTextField extends StatefulWidget {
  const PhoneTextField({
    super.key,
    this.label,
    this.width,
    this.backgroundColor = AppColor.lightGrey,
    this.placeholderTextColor = AppColor.grey,
    this.inputTextColor = AppColor.black,
    this.error = false,
    required this.onChange
  });
  final String? label;
  final double? width;
  final Color backgroundColor;
  final Color placeholderTextColor;
  final Color inputTextColor;
  final bool error;
  final Function(String) onChange;

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  final GlobalKey _key = GlobalKey();
  final TextEditingController controller = TextEditingController();
  Map selectedCountry = countryCodes.where((country) => country["countryCode"] == "40").first;
  double countryCodeFieldHeight = 36.sp;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final RenderBox box = _key.currentContext!.findRenderObject() as RenderBox;
      countryCodeFieldHeight = box.size.height;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    void showModal() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: CountryCodesSheet(
              countryCodes: countryCodes,
              callBack: (country) {
                setState(() {
                  selectedCountry = country;
                });
              },
            )
          );
        },
      );
    }

    return SizedBox(
      width: widget.width ?? 350.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(widget.label != null) ...[
            Text(
              widget.label ?? "",
              style: TextStyles.caseStudiesCompanyTitleStyle(),
            ),
            SizedBox(height: 3.h),
          ],
          Stack(
            children: [
              Container(
                key: _key,
                width: widget.width ?? 350.w,
                decoration: BoxDecoration(
                    color: widget.error ? AppColor.error100 : widget.backgroundColor,
                    borderRadius: BorderRadius.circular(4.sp),
                    border: Border.all(width: widget.error ? 1 : 0, color: widget.error ? AppColor.error700 : Colors.transparent)
                ),
                child: TextField(
                  controller: controller,
                  onChanged: (String text) {
                    final String number = text;
                    if(number.isNotEmpty && number[0] == "0") {
                      number.substring(1);
                      controller.text = number;
                      setState(() {});
                    }
                    widget.onChange("${selectedCountry["countryCode"]} $number");
                  },
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: TextStyle(
                      color: widget.error ? AppColor.error700 : widget.inputTextColor,
                      fontWeight: FontWeight.w500,
                      height: 1,
                      fontSize: 12.sp
                  ),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 64.w, top: 12.h, bottom: 12.h, right: 12.h),
                      hintText: "731234567",
                      hintStyle: TextStyle(
                          height: 1,
                          fontSize: 12.sp,
                          color: widget.error ? AppColor.error300 : widget.placeholderTextColor,
                          fontWeight: FontWeight.w400
                      )
                  ),
                ),
              ),
              TextButton(
                onPressed: () => showModal(),
                style: ButtonStyle(
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
                ),
                child: SizedBox(
                  width: 60.w,
                  height: countryCodeFieldHeight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CountryFlag.fromCountryCode(
                        selectedCountry["id"],
                        width: 21.sp,
                        height: 16.sp,
                        shape: RoundedRectangle(2.sp),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        selectedCountry["countryCode"],
                        style: TextStyle(
                          color: widget.error ? AppColor.error700 : widget.inputTextColor,
                          height: 1,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                )
              )
            ],
          )
        ],
      ),
    );
  }
}