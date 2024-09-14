import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stajirovka_test/features/providers/main_screen_provider.dart';
import 'package:stajirovka_test/features/resources/my_colors.dart';
import 'package:stajirovka_test/features/resources/resources.dart';
import 'package:stajirovka_test/ui/other_widgets/bouncing_button.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final providerMainScreen = context.watch<MainScreenProvider>();

    final Color checkColor = providerMainScreen.isButtonActive(context)
        ? MyColors.mandarin
        : MyColors.grey4;

    final Color checkText = providerMainScreen.isButtonActive(context)
        ? Colors.white
        : MyColors.grey2;

    final VoidCallback? onPress = providerMainScreen.isButtonActive(context)
        ? () {
            providerMainScreen.cleanEverything(context);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: MyColors.black,
              content: Text(
                textAlign: TextAlign.center,
                'Заметка сохранена!',
                style: TextStyle(fontFamily: MyFonts.nunito, fontSize: 15.sp),
              ),
            ));
          }
        : null;

    return BouncingButton(
      onPress: onPress,
      isNotActive: !providerMainScreen.isButtonActive(context),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(69).r, color: checkColor),
        child: Text(
          'Сохранить',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: checkText,
              fontWeight: FontWeight.w400,
              fontSize: 20.sp,
              fontFamily: MyFonts.nunito),
        ),
      ),
    );
  }
}
