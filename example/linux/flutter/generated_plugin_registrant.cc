//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <led_counter/led_counter_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) led_counter_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "LedCounterPlugin");
  led_counter_plugin_register_with_registrar(led_counter_registrar);
}
