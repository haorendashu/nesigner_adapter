import 'nesigner_adapter_platform_interface.dart';

export 'nesigner.dart';

class NesignerAdapter {
  Future<String?> getPlatformVersion() {
    return NesignerAdapterPlatform.instance.getPlatformVersion();
  }
}
