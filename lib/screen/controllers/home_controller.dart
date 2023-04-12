import 'dart:async';
import 'dart:math';

import 'package:bieu_do_xe_hoi/utils/constants.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  late Timer timer;
  var speedValue = 0.0.obs;
  var rpmValue = 8.0.obs;
  var petrolValue = 50.0.obs;
  var temperaturelValue = 100.0.obs;
  var compassValue = 0.0.obs;
  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(
      const Duration(milliseconds: 2000),
      (timer) {
        speedValue.value = ((Random().nextDouble() * 160));
        speedValue.value = double.parse(speedValue.toStringAsFixed(1));
        rpmValue.value = ((Random().nextDouble() * 8));
        rpmValue.value = double.parse(rpmValue.toStringAsFixed(1));
        petrolValue.value = ((Random().nextDouble() * 100));
        petrolValue.value = double.parse(petrolValue.toStringAsFixed(1));
        temperaturelValue.value = ((Random().nextDouble() * 100 + 50));
        temperaturelValue.value =
            double.parse(temperaturelValue.toStringAsFixed(1));
        compassValue.value = ((Random().nextDouble() * 180));
        compassValue.value = double.parse(compassValue.toStringAsFixed(1));
      },
    );
  }

  final images = [
    Constants.do_thi,
    Constants.bienbao_td60,
    Constants.giao_4,
  ];
  var danhmucbentrai = <InfoWidget>[
    InfoWidget(
        title: 'Tgian đi',
        value: '23:30:59',
        iconUrl: Constants.icon_wall_clock),
    InfoWidget(
        title: 'Tổng km', value: '512.150', iconUrl: Constants.icon_road),
    InfoWidget(
        title: 'Trung bình',
        value: '50',
        unit: 'km/h',
        iconUrl: Constants.icon_speedometer),
    InfoWidget(
        title: 'Max', value: '150', unit: 'km/h', iconUrl: Constants.avg_speed),
  ];

  var listMenuItem = <MenuItemModel>[
    MenuItemModel(title: 'Đơn vị', subTitle: 'Kmh', subTitle2: 'Mph'),
    MenuItemModel(title: 'Âm thanh'),
    MenuItemModel(title: 'Thời gian đi'),
    MenuItemModel(title: 'Tổng quãng đường'),
    MenuItemModel(title: 'Vận tốc trung bình'),
    MenuItemModel(title: 'Vận tốc cao nhất'),
    MenuItemModel(title: 'Vòng quay cao nhất'),
    MenuItemModel(title: 'Tiêu thụ nhiên liệu'),
    MenuItemModel(title: 'Tiêu thụ nhiên liệu TB'),
    MenuItemModel(title: 'Ắc quy'),
  ];

  var danhmucbenphai = <InfoWidget>[
    InfoWidget(
        title: 'Max Rpm',
        value: '9000',
        unit: 'rpm',
        iconUrl: Constants.icon_odometer),
    InfoWidget(
        title: 'Tiêu thụ',
        value: '5.6',
        unit: 'lph',
        iconUrl: Constants.icon_gas_station),
    InfoWidget(
        title: 'Trung bình',
        value: '5.6',
        unit: 'lph',
        iconUrl: Constants.icon_gas_station_2),
    InfoWidget(
        title: 'Ắc quy',
        value: '12.6',
        unit: 'v',
        iconUrl: Constants.icon_car_battery),
  ];
}

class InfoWidget {
  final String title;
  final String value;
  final String? unit;
  final String iconUrl;

  InfoWidget({
    required this.title,
    required this.value,
    required this.iconUrl,
    this.unit,
  });
}

class MenuItemModel {
  final String title;
  final String subTitle;
  final String subTitle2;
  final bool isSelec;

  MenuItemModel({
    required this.title,
    this.subTitle = 'Bật',
    this.subTitle2 = 'Tắt',
    this.isSelec = false,
  });
}
