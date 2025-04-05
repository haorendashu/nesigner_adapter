import 'package:flutter_test/flutter_test.dart';
import 'package:nesigner_adapter/nesigner_adapter.dart';
import 'package:nesigner_adapter/nesigner_adapter_platform_interface.dart';
import 'package:nesigner_adapter/nesigner_adapter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNesignerAdapterPlatform
    with MockPlatformInterfaceMixin
    implements NesignerAdapterPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NesignerAdapterPlatform initialPlatform = NesignerAdapterPlatform.instance;

  test('$MethodChannelNesignerAdapter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNesignerAdapter>());
  });

  test('getPlatformVersion', () async {
    NesignerAdapter nesignerAdapterPlugin = NesignerAdapter();
    MockNesignerAdapterPlatform fakePlatform = MockNesignerAdapterPlatform();
    NesignerAdapterPlatform.instance = fakePlatform;

    expect(await nesignerAdapterPlugin.getPlatformVersion(), '42');
  });
}
