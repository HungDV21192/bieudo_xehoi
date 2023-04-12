import 'package:bieu_do_xe_hoi/screen/bindings/home_bindings.dart';
import 'package:bieu_do_xe_hoi/screen/views/home_screen.dart';
import 'package:get/get.dart';

part 'routes.dart';

class Pages {
  static const initittal = Routes.home_screen;
  static final routes = [
    GetPage(
      name: Routes.home_screen,
      page: () => HomeScreen(),
      binding: HomeBindings(),
      children: [
        // GetPage(
        //   name: Routes.sign_up,
        //   page: () => const SignUpScreen(),
        //   binding: UserBindings(),
        //   children: [
        //     GetPage(
        //       name: Routes.confirm_otp_screen,
        //       page: () => ConfirmOtpScreen(),
        //     ),
        //   ],
        // ),
      ],
    ),
  ];
}
