import 'dart:async';

import 'package:get/get.dart';

class ProgressController2 extends GetxController {
  var progress = 0.0.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startProgress();
  }

  void _startProgress() {
    const duration = Duration(milliseconds: 100);
    _timer = Timer.periodic(duration, (timer) {
      if (progress.value >= 2.0) {
        timer.cancel();
      } else {
        progress.value += 0.02; // Update observable variable
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel(); // Clean up the timer
    super.onClose();
  }

  var progress1 = 0.0.obs;

  void startProgress1() {
    if (progress1.value < 1.0) {
      progress1.value += 0.01;
    }
  }

  void resetProgress() {
    progress1.value = 0.0;
  }
}
