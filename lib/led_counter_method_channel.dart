import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'led_counter_platform_interface.dart';

/// An implementation of [LedCounterPlatform] that uses method channels.
class MethodChannelLedCounter extends LedCounterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('led_counter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
