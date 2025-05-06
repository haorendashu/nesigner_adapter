import 'nesigner.dart';

import 'nesigner_helper.dart'
    if (dart.library.io) 'nesigner_io.dart'
    if (dart.library.js) 'nesigner_web.dart';

class NesignerUtil {
  static void setMacOSArchIsArm(bool isArm) {
    nesignerSetMacOSArchIsArm(isArm);
  }

  static bool checkNesignerExist() {
    return nesignerExist();
  }
}
