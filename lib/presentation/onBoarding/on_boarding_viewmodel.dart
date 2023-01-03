import 'dart:async';

import 'package:cleanarchmvvm/domain/model.dart';
import 'package:cleanarchmvvm/presentation/base/base_view_model.dart';
import 'package:cleanarchmvvm/presentation/resources/assets_manager.dart';
import 'package:cleanarchmvvm/presentation/resources/string_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController controller = StreamController<SliderViewObject>();
  late List<SliderObject> _list;
  int _currentIndex = 0;

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
  @override
  void dispode() {
    controller.close();
  }

  @override
  void start() {
    _list = getSliderObject();
    _postDataToView();
  }

  @override
  int next() {
    int nextIndex = _currentIndex++;
    if (nextIndex >= _list.length) {
      _currentIndex = 0;
    }
    _postDataToView();
    return _currentIndex;
  }

  @override
  void onPagedChange(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  int previous() {
    int previousIndex = _currentIndex--;
    if (previousIndex == -1) {
      _currentIndex = _list.length - 1;
    }
    _postDataToView();
    return _currentIndex;
  }

  @override
  Stream<SliderViewObject> get outputSliderViewModel =>
      controller.stream.map((SliderViewObject) => SliderViewObject);
  @override
  Sink get inputSliderViewModel => controller.sink;

  _postDataToView() {
    inputSliderViewModel.add(SliderViewObject(
        sliderObject: _list[_currentIndex],
        sliderCount: _list.length,
        currentIndex: _currentIndex));
  }
}

abstract class OnBoardingViewModelInputs {
  void next();
  void previous();
  void onPagedChange(int index);
  Sink get inputSliderViewModel;
}

abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewModel;
}

class SliderViewObject {
  SliderObject sliderObject;
  int sliderCount;
  int currentIndex;
  SliderViewObject(
      {required this.sliderObject,
      required this.sliderCount,
      required this.currentIndex});
}
