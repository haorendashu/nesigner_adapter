import 'nesigner_adapter_platform_interface.dart';

export 'nesigner.dart';
export 'nesigner_util.dart';

class NesignerAdapter {
  Future<String?> getPlatformVersion() {
    return NesignerAdapterPlatform.instance.getPlatformVersion();
  }
}
