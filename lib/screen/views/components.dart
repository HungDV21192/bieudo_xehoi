import 'package:bieu_do_xe_hoi/screen/controllers/home_controller.dart';
import 'package:bieu_do_xe_hoi/utils/app_text_style.dart';
import 'package:bieu_do_xe_hoi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Components {
  static menuWidget({
    required Widget icon,
    Color colorBG = Constants.colorff0000,
    Color colorBD = Constants.colorcccccc,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 80.h,
          width: 101.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: colorBG,
            border: Border.all(color: colorBD),
          ),
          child: icon),
    );
  }

  static sideWidgets(BuildContext context,
      {required List<InfoWidget> listData, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ...List.generate(listData.length, (index) {
          final value = listData[index];
          return _infoWidget(
            context: context,
            title: value.title,
            value: value.value,
            unit: value.unit,
            iconUrl: value.iconUrl,
          );
        }),
        const Spacer(),
        child,
        SizedBox(height: 30.h),
      ],
    );
  }

  static _infoWidget(
      {required BuildContext context,
      required String iconUrl,
      required String title,
      required String value,
      String? unit}) {
    return Container(
      width: 275.w,
      height: 115.h,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
        color: Constants.color959595.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(iconUrl),
          SizedBox(width: 15.w),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyles.tahoma400.copyWith(
                  fontSize: 24.sp,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    value,
                    style: TextStyles.tahoma400.copyWith(
                        fontSize: 32.sp, color: Constants.color00f500),
                  ),
                  (unit ?? '').isNotEmpty
                      ? Text(
                          ' ${unit!}',
                          style: TextStyles.tahoma400
                              .copyWith(fontSize: 24.sp, color: Colors.white),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  static address({required BuildContext context, required String address}) {
    return Text(
      address,
      style: TextStyles.utmBold,
    );
  }

  static smallChart({
    required double value,
    required double width,
    double minValue = 0.0,
    double maxValue = 100.0,
    required String unit,
    required String icon,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Constants.color6c8cc7, width: 2.w),
      ),
      height: width * 0.9,
      width: width * 0.9,
      child: SfRadialGauge(axes: <RadialAxis>[
        RadialAxis(
          startAngle: 190,
          endAngle: 350,
          minimum: minValue,
          maximum: maxValue,
          showLastLabel: true,
          axisLineStyle: const AxisLineStyle(
              thicknessUnit: GaugeSizeUnit.factor, thickness: 0),
          majorTickStyle: MajorTickStyle(
            length: 20.w,
            thickness: 2.h,
            color: Colors.white,
          ),
          minorTickStyle: MinorTickStyle(
            length: 10.h,
            thickness: 2.h,
            color: Colors.white,
          ),
          axisLabelStyle: const GaugeTextStyle(
            fontFamily: 'Tahoma',
            color: Colors.green,
            fontWeight: FontWeight.w500,
          ),
          ranges: <GaugeRange>[
            GaugeRange(
              rangeOffset: -0.05,
              startValue: 0,
              endValue: 160,
              sizeUnit: GaugeSizeUnit.factor,
              color: Colors.red,
            ),
          ],
          pointers: <GaugePointer>[
            NeedlePointer(
              value: value,
              needleLength: 0.95,
              lengthUnit: GaugeSizeUnit.factor,
              needleStartWidth: 2.h, // kích thước mũi mũi tên
              needleEndWidth: 4.h, // Kích thước chân mũi tên
              needleColor: Colors.red,
              enableAnimation: true,
              animationType: AnimationType.ease,
              knobStyle: KnobStyle(
                knobRadius: 0.1.h,
                sizeUnit: GaugeSizeUnit.factor,
                color: Colors.red,
              ),
            ),
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    icon,
                    width: width / 6,
                    height: width / 6,
                  ),
                  Text(
                    '${value.toStringAsFixed(0)} $unit',
                    style: TextStyles.utmBold
                        .copyWith(fontSize: 55.sp, color: Colors.white),
                  ),
                  SizedBox(height: width / 5),
                ],
              ),
              angle: 90,
              positionFactor: 0.75,
            )
          ],
        ),
      ]),
    );
  }

  static speedWidget({required double width, required value}) {
    return Container(
      margin: EdgeInsets.only(bottom: 40.h),
      decoration: BoxDecoration(
          color: Colors.black,
          shape: BoxShape.circle,
          border: Border.all(color: Constants.color6c8cc7, width: 6.w)),
      height: width,
      width: width,
      child: SfRadialGauge(axes: <RadialAxis>[
        //Biểu đồ nhỏ bên trong
        RadialAxis(
          minimum: 0,
          maximum: 160,
          radiusFactor: 0.45,
          maximumLabels: 10,
          showLabels: false,
          majorTickStyle:
              MajorTickStyle(length: 10.w, thickness: 2.h, color: Colors.white),
          minorTickStyle:
              MinorTickStyle(length: 10.w, thickness: 2.h, color: Colors.white),
          showAxisLine: false,
        ),
        RadialAxis(
            minimum: 0,
            maximum: 160,
            showLastLabel: true,
            maximumLabels: 5,
            showAxisLine: false,
            // labelOffset: 10.w, // Khoảng cách số tới viền
            axisLineStyle: const AxisLineStyle(
                thicknessUnit: GaugeSizeUnit.factor, thickness: 0.03),
            majorTickStyle: MajorTickStyle(
                length: 25.w, thickness: 4.h, color: Colors.white),
            minorTickStyle: MinorTickStyle(
                length: 15.w, thickness: 2.h, color: Colors.white),
            axisLabelStyle: GaugeTextStyle(
                fontSize: 40.sp,
                color: Constants.color00f500,
                fontWeight: FontWeight.bold),
            pointers: <GaugePointer>[
              NeedlePointer(
                value: value,
                needleLength: 0.95,
                enableAnimation: true,
                animationType: AnimationType.ease,
                needleStartWidth: 2.h, // kích thước mũi mũi tên
                needleEndWidth: 6.h, // Kích thước chân mũi tên
                needleColor: Colors.red,
                knobStyle: KnobStyle(
                  knobRadius: 0.05.h,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: Colors.red,
                ),
              )
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'km/h',
                      style: TextStyles.minionProBlod,
                    ),
                    Text(
                      value.toStringAsFixed(0),
                      style: TextStyles.utmBold.copyWith(
                        fontSize: 67.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                angle: 90,
                positionFactor: 0.75,
              ),
            ]),
      ]),
    );
  }

  static rpmWidget({required double width, required value}) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 40.h),
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
            border: Border.all(
              color: Constants.color6c8cc7,
              width: 6.w,
            ),
          ),
          height: width,
          width: width,
          child: SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: 8.02,
                maximumLabels: 4,
                showAxisLine: false,
                axisLineStyle: const AxisLineStyle(
                    thicknessUnit: GaugeSizeUnit.factor, thickness: 0.03),
                majorTickStyle: MajorTickStyle(
                    length: 25.w, thickness: 4.h, color: Colors.white),
                minorTickStyle: MinorTickStyle(
                    length: 15.w, thickness: 3.h, color: Colors.white),
                axisLabelStyle: GaugeTextStyle(
                    fontSize: 40.sp,
                    color: Constants.color00f500,
                    fontWeight: FontWeight.bold),
                ranges: [
                  GaugeRange(
                    startValue: 6.48,
                    endValue: 6.52,
                    startWidth: 20.w,
                    endWidth: 20.w,
                    color: Constants.colorf05b21,
                    rangeOffset: 0,
                    sizeUnit: GaugeSizeUnit.logicalPixel,
                  ),
                  GaugeRange(
                    startValue: 6.55,
                    endValue: 6.95,
                    startWidth: 17.w,
                    endWidth: 17.w,
                    color: Constants.colorf90000,
                    rangeOffset: 0,
                  ),
                  GaugeRange(
                    startValue: 6.98,
                    endValue: 7.02,
                    startWidth: 30.w,
                    endWidth: 30.w,
                    color: Constants.colorf05b21,
                    rangeOffset: 0,
                    sizeUnit: GaugeSizeUnit.logicalPixel,
                  ),
                  GaugeRange(
                    startValue: 7.05,
                    endValue: 7.45,
                    startWidth: 17.w,
                    endWidth: 17.w,
                    color: Constants.colorf90000,
                    rangeOffset: 0,
                  ),
                  GaugeRange(
                    startValue: 7.48,
                    endValue: 7.52,
                    startWidth: 20.w,
                    endWidth: 20.w,
                    color: Constants.colorf05b21,
                    rangeOffset: 0,
                  ),
                  GaugeRange(
                    startValue: 7.55,
                    endValue: 7.95,
                    startWidth: 20.w,
                    endWidth: 20.w,
                    color: Constants.colorf90000,
                    rangeOffset: 0,
                  ),
                  GaugeRange(
                    startValue: 7.98,
                    endValue: 8.02,
                    startWidth: 30.w,
                    endWidth: 30.w,
                    color: Constants.colorf05b21,
                    rangeOffset: 0,
                  ),
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(
                    value: value,
                    needleLength: 0.95,
                    enableAnimation: true,
                    animationType: AnimationType.ease,
                    needleStartWidth: 2.h, // kích thước mũi mũi tên
                    needleEndWidth: 6.h, // Kích thước chân mũi tên
                    needleColor: Constants.colored1d24,
                    knobStyle: const KnobStyle(
                      knobRadius: 0.02,
                      sizeUnit: GaugeSizeUnit.factor,
                      color: Constants.colored1d24,
                    ),
                  )
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    widget: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('vòng/phút', style: TextStyles.minionProBlod),
                        Text(
                          (value * 1000).toStringAsFixed(0),
                          style: TextStyles.utmBold.copyWith(
                            fontSize: 67.sp,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    angle: 90,
                    positionFactor: 0.75,
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  static listOfRoadSigns({required List<String> images}) {
    return images.isNotEmpty
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: 15.h),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                images.length > 3 ? 3 : images.length,
                (index) => Container(
                  margin: EdgeInsets.only(
                      right:
                          index == 2 || index == (images.length - 1) ? 0 : 8.w),
                  width: 160.h,
                  height: 132.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        images[index],
                      ),
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
              ),
            ),
          )
        : const SizedBox.shrink();
  }

  static middleWidget(double width, double value) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Constants.logo_road,
            height: width * 0.6,
            width: width * 0.6,
            fit: BoxFit.fill,
          ),
          Image.asset(
            Constants.logo_car,
            height: width * 0.6,
            width: width * 0.6,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 20.h),
          _customCompass(width, value),
        ],
      ),
    );
  }

  static _customCompass(double width, double value) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
        border: Border.all(color: Constants.color6c8cc7, width: 6.h),
      ),
      width: width,
      height: width,
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        animationDuration: 1000,
        axes: <RadialAxis>[
          RadialAxis(
            startAngle: 90,
            endAngle: 450,
            radiusFactor: 1,
            canRotateLabels: true,
            showLabels: false,
            showLastLabel: false,
            showFirstLabel: false,
            showTicks: false,
            minimum: 0,
            maximum: 360,
            maximumLabels: 5,

            ranges: [
              ...gaugeRangeCompass(direction: 'T'),
              ...gaugeRangeCompass(direction: 'B'),
              ...gaugeRangeCompass(direction: 'Đ'),
              ...gaugeRangeCompass(direction: 'N'),
            ],
            pointers: <GaugePointer>[
              NeedlePointer(
                value: value,
                needleStartWidth: 2.h,
                needleEndWidth: 10.h,
                gradient: const LinearGradient(
                  colors: <Color>[
                    Constants.colord51b62,
                    Constants.colord51b62,
                    Constants.color7f181c,
                    Constants.color7f181c,
                  ],
                  stops: <double>[0, 0.5, 0.5, 1],
                ),
                knobStyle: KnobStyle(
                  knobRadius: 0.05.h,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: Constants.color7f181c,
                ),
              ),
              NeedlePointer(
                value: value + 180,
                needleStartWidth: 2.h,
                needleEndWidth: 10.h,
                gradient: const LinearGradient(
                  colors: <Color>[
                    Constants.colore5e5e6,
                    Constants.colore5e5e6,
                    Constants.colora5a6a9,
                    Constants.colora5a6a9,
                  ],
                  stops: <double>[0, 0.5, 0.5, 1],
                ),
                knobStyle: KnobStyle(
                  knobRadius: 0.15.h,
                  sizeUnit: GaugeSizeUnit.factor,
                  color: Constants.colore5e5e6,
                ),
              ),
            ],
            minorTicksPerInterval: 0,
            axisLineStyle: const AxisLineStyle(
                color: Colors.blue,
                thicknessUnit: GaugeSizeUnit.logicalPixel,
                thickness: 0),
            majorTickStyle:
                MajorTickStyle(length: 15.h, thickness: 2.h, color: Colors.red),
            // minorTickStyle:
            //     MinorTickStyle(length: 6.w, thickness: 1.h, color: Colors.red),
            axisLabelStyle: const GaugeTextStyle(
              color: Constants.color00f500,
              fontWeight: FontWeight.normal,
            ),
            onLabelCreated: handleLabelCreated,
          )
        ],
      ),
    );
  }

  static void handleLabelCreated(AxisLabelCreatedArgs args) {
    if (args.text == '0' || args.text == '360') {
      args.text = 'B';
    } else if (args.text == '90') {
      args.text = 'Đ';
    } else if (args.text == '180') {
      args.text = 'N';
    } else if (args.text == '270') {
      args.text = 'T';
    } else {
      args.text = '';
    }
  }

  static iconMenu(
      {required String title,
      required String subTitle,
      required String subTitle2,
      bool isTurnOn = true}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Text(
              title,
              style: TextStyles.tahoma400.copyWith(fontSize: 55.sp),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                itemMenu(title: subTitle, isSelect: isTurnOn),
                itemMenu(title: subTitle2, isSelect: !isTurnOn),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static itemMenu({required String title, bool isSelect = false}) {
    return Row(
      children: [
        Container(
          width: 90.w,
          height: 90.w,
          margin: EdgeInsets.only(right: 10.w),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
              border:
                  Border.all(color: Colors.white, width: isSelect ? 4.h : 2.h)),
          child: isSelect
              ? Padding(
                  padding: EdgeInsets.all(30.w),
                  child: CircleAvatar(
                    radius: 45.w,
                    backgroundColor: Colors.white,
                  ),
                )
              : const SizedBox.shrink(),
        ),
        Text(
          title,
          style: TextStyles.tahoma400.copyWith(fontSize: 55.sp),
        ),
      ],
    );
  }

  static List<GaugeRange> gaugeRangeCompass({required String direction}) {
    var coordinates = 0.0;

    if (direction == 'T') {
      coordinates = 45;
    } else if (direction == 'B') {
      coordinates = 135;
    } else if (direction == 'Đ') {
      coordinates = 225;
    } else if (direction == 'N') {
      coordinates = 360;
    }

    return [
      GaugeRange(
        startValue: coordinates - 0.5,
        endValue: coordinates + 0.5,
        startWidth: 10.w,
        endWidth: 10.w,
        color: Constants.color6c8cc7,
        rangeOffset: 0.w,
      ),

      ///Cực Tây
      GaugeRange(
        startValue: coordinates + 45 - 0.5,
        endValue: coordinates + 1 + 45 + 0.5,
        startWidth: 10.w,
        endWidth: 10.w,
        color: Constants.color6c8cc7,
        rangeOffset: 0.w,
      ),
      GaugeRange(
        startValue: coordinates + 45 - 0.5,
        endValue: coordinates + 1 + 45 + 0.5,
        color: Colors.transparent,
        rangeOffset: 10.w,
        label: direction,
        labelStyle: GaugeTextStyle(fontSize: 30.sp, color: Colors.white),
        sizeUnit: GaugeSizeUnit.logicalPixel,
      ),
      GaugeRange(
        startValue: coordinates + 90 - 0.5,
        endValue: coordinates + 90 + 0.5,
        startWidth: 10.w,
        endWidth: 10.w,
        color: Constants.color6c8cc7,
        rangeOffset: 0.w,
      ),
    ];
  }
}
