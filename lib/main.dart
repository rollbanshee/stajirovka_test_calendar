import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:stajirovka_test/main_features.dart';
import 'package:stajirovka_test/ui/screens/main/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru_RU', null);
  MainFeatures.systemChrome();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 891),
      builder: (context, child) => MultiProvider(
        providers: MainFeatures.buildProviders(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Stajirovka Test Calendar',
          theme: ThemeData(),
          home: child,
        ),
      ),
      child: const MainScreen(),
    );
  }
}
