#include "include/led_counter/led_counter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "led_counter_plugin.h"

void LedCounterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  led_counter::LedCounterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
