import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'led_counter_method_channel.dart';

abstract class LedCounterPlatform extends PlatformInterface {
  /// Constructs a LedCounterPlatform.
  LedCounterPlatform() : super(token: _token);

  static final Object _token = Object();

  static LedCounterPlatform _instance = MethodChannelLedCounter();

  /// The default instance of [LedCounterPlatform] to use.
  ///
  /// Defaults to [MethodChannelLedCounter].
  static LedCounterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LedCounterPlatform] when
  /// they register themselves.
  static set instance(LedCounterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
