import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'nesigner_adapter_platform_interface.dart';

/// An implementation of [NesignerAdapterPlatform] that uses method channels.
class MethodChannelNesignerAdapter extends NesignerAdapterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('nesigner_adapter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
