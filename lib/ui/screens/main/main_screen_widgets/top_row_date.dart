import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stajirovka_test/features/providers/toprow_provider.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/features/resources/resources.dart';
import 'package:stajirovka_test/ui/other_widgets/bouncing_button.dart';
import 'package:stajirovka_test/ui/screens/calendar/calendar_screen.dart';

class TopRowDate extends StatelessWidget {
  const TopRowDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final providerTopRow = context.watch<TopRowProvider>();
    return Row(
      children: [
        const Spacer(),
        Text(
          providerTopRow.formattedDateTime,
          style: TextStyle(
              color: MyColors.grey2,
              fontFamily: MyFonts.nunito,
              fontWeight: FontWeight.w700,
              fontSize: 18.sp),
        ),
        const Spacer(),
        BouncingButton(
          onPress: () {
            Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, _, __) => const CalendarScreen(),
                    transitionDuration: const Duration(milliseconds: 300),
                    transitionsBuilder: (context, a, _, c) => FadeTransition(
                          opacity: a,
                          child: c,
                        )));
          },
          child: SvgPicture.asset(
            MySvg.calendar,
            width: 24.w,
          ),
        ),
      ],
    );
  }
}
