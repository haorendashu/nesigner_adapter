#include "include/nesigner_adapter/nesigner_adapter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "nesigner_adapter_plugin.h"

void NesignerAdapterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  nesigner_adapter::NesignerAdapterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
