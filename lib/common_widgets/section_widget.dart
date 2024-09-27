import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/colors.gen.dart';
import '../theme/text_styles.dart';

class SectionWidget extends StatelessWidget {
  final String sectionTitle;
  final bool isSeeMore;

  const SectionWidget(this.sectionTitle, this.isSeeMore, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sectionTitle,
          style: TextStyles.title,
        ),
        Visibility(
          visible: isSeeMore,
          child: Container(
            padding:
                EdgeInsetsDirectional.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
                color: ColorName.bgColor,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: ColorName.strokeColor, width: 1)),
            child: Text(
              'See more',
              style: TextStyles.more,
            ),
          ),
        )
      ],
    );
  }
}
