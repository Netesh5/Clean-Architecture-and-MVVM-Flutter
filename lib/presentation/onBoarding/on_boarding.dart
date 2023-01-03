import 'package:cleanarchmvvm/domain/model.dart';
import 'package:cleanarchmvvm/presentation/onBoarding/on_boarding_viewmodel.dart';
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
  final PageController _pageController = PageController();
  OnBoardingViewModel viewModel = OnBoardingViewModel();

  bind() {
    viewModel.start();
  }

  @override
  void initState() {
    bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: viewModel.outputSliderViewModel,
      builder: (BuildContext context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
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
                return OnBoardingPage(sliderViewObject.sliderObject);
              }),
              itemCount: sliderViewObject.sliderCount,
              controller: _pageController,
              onPageChanged: (value) {
                setState(
                  () {
                    viewModel.onPagedChange(value);
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
                      Navigator.pushReplacementNamed(
                          context, Routes.loginScreen);
                    },
                    child: Text(AppString.skip,
                        textAlign: TextAlign.end,
                        style: getRegularTextStyle(
                          color: ColorManager.white,
                        ))),
              ),
              _getBottomSheetWidget(sliderViewObject)
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
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
              viewModel.previous();
              _pageController.animateToPage(viewModel.next(),
                  duration: const Duration(seconds: Durationconst.d300),
                  curve: Curves.bounceInOut);
            },
          ),
        ),
        Row(
          children: [
            for (int i = 0; i < sliderViewObject.sliderCount; i++)
              Padding(
                padding: const EdgeInsets.all(PaddingManager.p8),
                child: _getCircle(i, sliderViewObject.currentIndex),
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

              setState(() {});
            },
          ),
        ),
      ],
    );
  }

  // int _getPreviousIndex() {

  // }

  // int _getNextIndex() {

  // }

  Widget _getCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollow_circle);
    } else {
      return SvgPicture.asset(ImageAssets.solid_circle);
    }
  }

  @override
  void dispose() {
    viewModel.dispode();
    super.dispose();
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
