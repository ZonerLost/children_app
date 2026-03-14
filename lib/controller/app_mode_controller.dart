import 'package:get/get.dart';

class AppModeController extends GetxController {
  static AppModeController get to => Get.find<AppModeController>();

  final RxBool isParentMode = false.obs;

  void toggleMode() {
    isParentMode.value = !isParentMode.value;
  }

  void setParentMode() {
    isParentMode.value = true;
  }

  void setChildMode() {
    isParentMode.value = false;
  }

  /// Returns 0 for child mode, 1 for parent mode (for tab index usage).
  int get modeIndex => isParentMode.value ? 1 : 0;
}
