import 'package:flutter_test/flutter_test.dart';
import 'package:led_counter/binary_int32.dart';

void main() {
  test("expect true", () {
    var a = BinaryInt32("0000001");
    var b = BinaryInt32("0000001");

    expect(true, a.compare(b.value));
  });

  test("expect false", () {
    var a = BinaryInt32("0000010");
    var b = BinaryInt32("0000001");

    expect(false, a.compare(b.value));
  });

  test("expect true when shift 1", () {
    var a = BinaryInt32("0000010");
    var b = BinaryInt32("0000001");
    b.shift1();

    expect(false, a.compare(b.value));
  });

  test("shift", () {
    var a = BinaryInt32("0000001");
    a.shift1();
    a.shift1();
    a.shift1();
    a.shift1();
    a.shift1();
    a.shift1();

    expect(a.value, "1000000");
  });
}
