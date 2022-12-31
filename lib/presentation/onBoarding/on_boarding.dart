import 'package:cleanarchmvvm/domain/model.dart';
import 'package:cleanarchmvvm/presentation/resources/assets_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/color_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/routes_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/string_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/textstyle_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

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
  final PageController _pageController = PageController();
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
      body: SafeArea(
        child: PageView.builder(
            itemBuilder: ((context, index) {
              return OnBoardingPage(_list[index]);
            }),
            itemCount: _list.length,
            controller: _pageController,
            onPageChanged: (value) {
              setState(
                () {
                  _currentIndex = value;
                },
              );
            }),
      ),
      bottomSheet: Container(
        height: 100,
        color: ColorManager.primaryColor,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginScreen);
                  },
                  child: Text(AppString.skip,
                      textAlign: TextAlign.end,
                      style: getRegularTextStyle(
                        color: ColorManager.white,
                      ))),
            ),
            _getBottomSheetWidget()
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.all(PaddingManager.p8),
          child: GestureDetector(
            child: SizedBox(
                height: AppSize.as20,
                width: AppSize.as60,
                child: SvgPicture.asset(ImageAssets.left_arrow)),
            onTap: () {
              _getPreviousIndex();
              _pageController.animateToPage(_getNextIndex(),
                  duration: const Duration(seconds: Durationconst.d300),
                  curve: Curves.bounceInOut);
            },
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < _list.length; i++)
              Padding(
                padding: const EdgeInsets.all(PaddingManager.p8),
                child: _getCircle(i),
              ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(PaddingManager.p8),
          child: GestureDetector(
            child: SizedBox(
                height: AppSize.as20,
                width: AppSize.as60,
                child: SvgPicture.asset(ImageAssets.right_arrow)),
            onTap: () {
              //a
              _getNextIndex();
              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  int _getPreviousIndex() {
    int previousIndex = _currentIndex--;
    if (previousIndex == -1) {
      _currentIndex = _list.length - 1;
    }
    return _currentIndex;
  }

  int _getNextIndex() {
    int nextIndex = _currentIndex++;
    if (nextIndex >= _list.length) {
      _currentIndex = 0;
    }
    return _currentIndex;
  }

  Widget _getCircle(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.hollow_circle);
    } else {
      return SvgPicture.asset(ImageAssets.solid_circle);
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;

  OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: AppSize.as40,
        ),
        Padding(
          padding: const EdgeInsets.all(PaddingManager.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(PaddingManager.p8),
          child: Text(
            _sliderObject.subtitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
        const SizedBox(
          height: AppSize.as40,
        ),
        SvgPicture.asset(ImageAssets.onBoardingImage1)
      ],
    );
  }
}
