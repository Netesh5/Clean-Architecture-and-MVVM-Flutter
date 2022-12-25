import 'package:cleanarchmvvm/presentation/resources/assets_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/color_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/string_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late List<SliderObject> _list = getSliderObject();
  List<SliderObject> getSliderObject() => [
        SliderObject(
            title: AppString.onBoardingTitle1,
            subtitle: AppString.onBoardingSubtitle1,
            image: ImageAssets.onBoardingImage1),
        SliderObject(
            title: AppString.onBoardingTitle2,
            subtitle: AppString.onBoardingSubtitle2,
            image: ImageAssets.onBoardingImage2),
        SliderObject(
            title: AppString.onBoardingTitle3,
            subtitle: AppString.onBoardingSubtitle3,
            image: ImageAssets.onBoardingImage3),
        SliderObject(
            title: AppString.onBoardingTitle4,
            subtitle: AppString.onBoardingSubtitle4,
            image: ImageAssets.onBoardingImage4),
      ];
  int _currentIndex = 0;
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          elevation: AppSize.ap1_5,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
            itemBuilder: ((context, index) {}),
            itemCount: _list.length,
            controller: _pageController,
            onPageChanged: (value) {
              setState(
                () {
                  _currentIndex = value;
                },
              );
            }));
  }
}

class SliderObject {
  String title;
  String subtitle;
  String image;
  SliderObject(
      {required this.title, required this.subtitle, required this.image});
}
