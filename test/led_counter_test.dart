import 'package:flutter_test/flutter_test.dart';
import 'package:led_counter/led_counter.dart';
import 'package:led_counter/led_counter_platform_interface.dart';
import 'package:led_counter/led_counter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLedCounterPlatform
    with MockPlatformInterfaceMixin
    implements LedCounterPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final LedCounterPlatform initialPlatform = LedCounterPlatform.instance;

  test('$MethodChannelLedCounter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLedCounter>());
  });

  test('getPlatformVersion', () async {
    // LedCounter ledCounterPlugin = LedCounter();
    // MockLedCounterPlatform fakePlatform = MockLedCounterPlatform();
    // LedCounterPlatform.instance = fakePlatform;

    // expect(await ledCounterPlugin.getPlatformVersion(), '42');
  });
}
