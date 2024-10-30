import 'package:get/get.dart';
import 'dart:async';

class ProgressController extends GetxController {
  var progress = 0.0.obs; // Observable variable
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
}
