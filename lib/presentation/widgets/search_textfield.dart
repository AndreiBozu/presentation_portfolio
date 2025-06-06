import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:presentation_portfolio/core/theme/app_color.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    super.key,
    this.defaultText = "",
    this.labelText = "",
    this.labelKey,
    this.onTextChange,
    this.width,
    this.clearField = false
  });
  final String labelText;
  final String? defaultText;
  final String? labelKey;
  final Function? onTextChange;
  final double? width;
  final bool clearField;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> with SingleTickerProviderStateMixin {
  final FocusNode focus = FocusNode();
  late AnimationController _animationController;
  final TextEditingController _textFieldController = TextEditingController();
  bool focused = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _textFieldController.text = widget.defaultText != null ? widget.defaultText! : "";
    focus.addListener(() {
      setState(() => focused = focus.hasFocus);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _textFieldController.dispose();
    focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if(widget.defaultText != null && widget.defaultText!.isNotEmpty && widget.defaultText != _textFieldController.text) {
      setState(() => _textFieldController.text = widget.defaultText!);
    }
    if(widget.clearField && _textFieldController.text.isNotEmpty) {
      setState(() => _textFieldController.text = "");
    }

    return SizedBox(
      width: widget.width ?? 350.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            maxLines: 1,
            semanticsLabel: widget.labelText,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14.sp,
              color: AppColor.black,
              height: 1,
            ),
          ),
          const SizedBox(height: 3),
          Stack(
            alignment: Alignment.center,
            children: [
              TextField(
                focusNode: focus,
                controller: _textFieldController,
                onChanged: (value) => widget.onTextChange!(value),
                keyboardType: TextInputType.text,
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
                maxLines: 1,
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.sp),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColor.lightGrey,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.sp),
                      borderSide: BorderSide(
                        width: 1,
                        color: AppColor.lightGrey,
                      ),
                    ),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      fontSize: 14.sp,
                      color: AppColor.grey,
                      height: 1,
                    ),
                    contentPadding: EdgeInsets.only(
                      top: 8.sp,
                      bottom: 8.sp,
                      right: 12.sp,
                      left: 52.sp,
                    ),
                    filled: true,
                    fillColor: AppColor.lightGrey
                ),
              ),
              Positioned(
                left: 0,
                child: TextButton(
                  onPressed: () => FocusManager.instance.primaryFocus?.unfocus(),
                  style: ButtonStyle(
                    overlayColor: WidgetStateProperty.all(Colors.transparent),
                    padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.all(0)),
                  ),
                  isSemanticButton: true,
                  child: Container(
                    width: 52.sp,
                    height: 40.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.sp),
                        bottomLeft: Radius.circular(4.sp),
                      ),
                    ),
                    child: Icon(
                      Icons.search_rounded,
                      color: focused ? AppColor.black : AppColor.grey,
                      size: 24.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
