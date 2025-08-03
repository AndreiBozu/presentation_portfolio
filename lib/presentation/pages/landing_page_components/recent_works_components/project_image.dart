import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation_portfolio/data/models/recent_work_item_model.dart';
import 'package:presentation_portfolio/presentation/providers/recent_work_item.dart';

class ProjectImage extends ConsumerWidget {
  const ProjectImage({
    super.key,
    required this.colorLightTheme,
    required this.colorDarkTheme,
    required this.imageName,
    required this.isHovered,
    required this.recentWorkItem
  });
  final Color colorLightTheme;
  final Color colorDarkTheme;
  final String imageName;
  final bool isHovered;
  final RecentWorkModelItem recentWorkItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double width = 450.w;
    final double height = 300.h;

    return GestureDetector(
      onTap: () {
        ref.read(recentWorkItemProvider.notifier).save(recentWorkItem);
        context.go("/recent-work/${recentWorkItem.id}");
      },
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: [
            Container(
              width: width,
              height: height,
              clipBehavior: Clip.antiAlias,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.sp),
              ),
              child: AnimatedContainer(
                width: width,
                height: height,
                duration: const Duration(milliseconds: 300),
                transform: Matrix4.identity()
                  ..scale(isHovered ? 1.3 : 1.0)
                  ..rotateZ(isHovered ? 20/360 : 0),
                transformAlignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.sp),
                  child: Image.asset(
                    "assets/$imageName",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: isHovered ? 1 : 0,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.sp),
                    gradient: LinearGradient(
                        colors: [colorLightTheme.withValues(alpha: 0.6), colorDarkTheme.withValues(alpha: 0.6)],
                        begin: Alignment.bottomLeft
                    )
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
