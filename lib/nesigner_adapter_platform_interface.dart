import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'nesigner_adapter_method_channel.dart';

abstract class NesignerAdapterPlatform extends PlatformInterface {
  /// Constructs a NesignerAdapterPlatform.
  NesignerAdapterPlatform() : super(token: _token);

  static final Object _token = Object();

  static NesignerAdapterPlatform _instance = MethodChannelNesignerAdapter();

  /// The default instance of [NesignerAdapterPlatform] to use.
  ///
  /// Defaults to [MethodChannelNesignerAdapter].
  static NesignerAdapterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NesignerAdapterPlatform] when
  /// they register themselves.
  static set instance(NesignerAdapterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
