import 'package:bieu_do_xe_hoi/screen/controllers/home_controller.dart';
import 'package:bieu_do_xe_hoi/screen/views/components.dart';
import 'package:bieu_do_xe_hoi/utils/app_text_style.dart';
import 'package:bieu_do_xe_hoi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final midWidth = 2 * width / 3;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                Constants.background,
              ),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Components.menuWidget(
                      icon: Text('HUD', style: TextStyles.utmBold),
                      onTap: () {}),
                  SizedBox(width: 20.w),
                  Components.menuWidget(
                    icon: const Icon(Icons.menu),
                    onTap: () {
                      Get.dialog(
                        Dialog(
                          backgroundColor:
                              Constants.color4d4d4d.withOpacity(0.3),
                          insetPadding: EdgeInsets.zero,
                          child: Material(
                            color: Colors.black.withOpacity(0.2),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.white),
                                color: Colors.black,
                              ),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 200.w, vertical: 100.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 20.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 50.h),
                                    width: 90.w,
                                    height: 90.w,
                                    padding: EdgeInsets.all(4.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black,
                                      border: Border.all(color: Colors.white),
                                    ),
                                    child: InkWell(
                                        onTap: () => Get.back(),
                                        child: const Icon(Icons.close)),
                                  ),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      padding: EdgeInsets.only(left: 20.w),
                                      child: Column(
                                        children: List.generate(
                                            controller.listMenuItem.length,
                                            (index) {
                                          final data =
                                              controller.listMenuItem[index];
                                          return Components.iconMenu(
                                              title: data.title,
                                              subTitle: data.subTitle,
                                              subTitle2: data.subTitle2);
                                        }),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    colorBG: Constants.color707070,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Components.sideWidgets(
                        context,
                        listData: controller.danhmucbentrai,
                        child: Obx(
                          () => Components.smallChart(
                            width: width / 6,
                            value: controller.petrolValue.value,
                            minValue: 0,
                            maxValue: 100,
                            unit: '%',
                            icon: Constants.engine_icon,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Components.address(
                              context: context,
                              address:
                                  'Đường Nguyễn Trãi - Thanh Xuân - Hà Nội'),
                          Components.listOfRoadSigns(images: controller.images),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Obx(
                                  () => Components.speedWidget(
                                      // 2ouf
                                      width: 2 * midWidth / 5,
                                      value: controller.speedValue.value),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Obx(
                                  () => Components.middleWidget(
                                    midWidth / 5,
                                    controller.compassValue.value,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Obx(
                                  () => Components.rpmWidget(
                                      width: 2 * midWidth / 5,
                                      value: controller.rpmValue.value),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Components.sideWidgets(
                        context,
                        listData: controller.danhmucbenphai,
                        child: Obx(
                          () => Components.smallChart(
                            width: width / 6,
                            value: controller.temperaturelValue.value,
                            minValue: 50,
                            maxValue: 150,
                            unit: '℃',
                            icon: Constants.temp_icon,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
