import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/colors.gen.dart';
import '../theme/text_styles.dart';

class TagWidget extends StatelessWidget {
  final List<int> genreIds;

  const TagWidget(this.genreIds, {super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
          genreIds.length >= 3 ? 3 : genreIds.length,
          (index) => Container(
                margin: EdgeInsetsDirectional.only(end: 8.w),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: ColorName.tagBgColor),
                child: Text(
                  genreIds[index].toString(),
                  style: TextStyles.tag,
                ),
              )),
    );
  }
}
