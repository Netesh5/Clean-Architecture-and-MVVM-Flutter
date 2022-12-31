import 'dart:async';

import 'package:cleanarchmvvm/domain/model.dart';
import 'package:cleanarchmvvm/presentation/base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  final StreamController controller = StreamController<SliderViewObject>();
  @override
  void dispode() {}

  @override
  void start() {}

  @override
  void next() {}

  @override
  void onPagedChange(int index) {}

  @override
  void previous() {}

  @override
  Stream<SliderViewObject> get outputSliderViewModel =>
      controller.stream.map((SliderViewObject) => SliderViewObject);
  @override
  Sink get inputSliderViewModel => controller.sink;
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
