#ifndef FLUTTER_PLUGIN_NESIGNER_ADAPTER_PLUGIN_H_
#define FLUTTER_PLUGIN_NESIGNER_ADAPTER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace nesigner_adapter {

class NesignerAdapterPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  NesignerAdapterPlugin();

  virtual ~NesignerAdapterPlugin();

  // Disallow copy and assign.
  NesignerAdapterPlugin(const NesignerAdapterPlugin&) = delete;
  NesignerAdapterPlugin& operator=(const NesignerAdapterPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace nesigner_adapter

#endif  // FLUTTER_PLUGIN_NESIGNER_ADAPTER_PLUGIN_H_
