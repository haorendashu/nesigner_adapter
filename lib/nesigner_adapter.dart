
import 'nesigner_adapter_platform_interface.dart';

class NesignerAdapter {
  Future<String?> getPlatformVersion() {
    return NesignerAdapterPlatform.instance.getPlatformVersion();
  }
}
