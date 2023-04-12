import 'package:bieu_do_xe_hoi/lang/TranslationService.dart';
import 'package:bieu_do_xe_hoi/routes/pages.dart';
import 'package:bieu_do_xe_hoi/screen/bindings/home_bindings.dart';
import 'package:bieu_do_xe_hoi/utils/logger_utils.dart';
import 'package:bieu_do_xe_hoi/utils/theme_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HomeBindings().dependencies();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: null,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Biểu đồ xe',
          theme: ThemeClass.darkTheme,
          darkTheme: ThemeClass.darkTheme,
          debugShowCheckedModeBanner: false,
          enableLog: true,
          logWriterCallback: Logger.write,
          initialRoute: Pages.initittal,
          initialBinding: HomeBindings(),
          getPages: Pages.routes,
          locale: TranslationService.locale,
          fallbackLocale: TranslationService.fallbackLocale,
          translations: TranslationService(),
        );
      },
    );
  }
}
