import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../gen/assets.gen.dart';
import '../../model/movie_response.dart';
import '../theme/text_styles.dart';

class MovieDateRelease extends StatelessWidget {
  final Result movie;
  const MovieDateRelease(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Assets.images.clock.svg(),
        SizedBox(
          width: 4.w,
        ),
        Text(
          movie.releaseDate,
          style: TextStyles.dateRelease,
        )
      ],
    );
  }
}
