#ifndef FLUTTER_PLUGIN_LED_COUNTER_PLUGIN_H_
#define FLUTTER_PLUGIN_LED_COUNTER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace led_counter {

class LedCounterPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  LedCounterPlugin();

  virtual ~LedCounterPlugin();

  // Disallow copy and assign.
  LedCounterPlugin(const LedCounterPlugin&) = delete;
  LedCounterPlugin& operator=(const LedCounterPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace led_counter

#endif  // FLUTTER_PLUGIN_LED_COUNTER_PLUGIN_H_
