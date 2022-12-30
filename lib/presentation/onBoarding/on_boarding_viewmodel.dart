import 'package:cleanarchmvvm/presentation/base/base_view_model.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  @override
  void dispode() {}

  @override
  void start() {}

  @override
  void next() {
    // TODO: implement next
  }

  @override
  void onPagedChange(int index) {
    // TODO: implement onPagedChange
  }

  @override
  void previous() {
    // TODO: implement previous
  }
}

abstract class OnBoardingViewModelInputs {
  void next();
  void previous();
  void onPagedChange(int index);
}

abstract class OnBoardingViewModelOutputs {}
