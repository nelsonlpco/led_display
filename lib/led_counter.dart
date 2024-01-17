import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:led_counter/binary_int32.dart';
import 'package:led_counter/lamp_model.dart';

final numbers = [
  BinaryInt32("1110111"),
  BinaryInt32("1000100"),
  BinaryInt32("0111110"),
  BinaryInt32("1101110"),
  BinaryInt32("1001101"),
  BinaryInt32("1101011"),
  BinaryInt32("1111001"),
  BinaryInt32("1000110"),
  BinaryInt32("1111111"),
  BinaryInt32("1001111"),
];

class LedCounter extends StatelessWidget {
  final double width;
  final double height;
  late double margin = 10;
  final int number;

  LedCounter({
    super.key,
    required this.width,
    required this.height,
    required this.number,
  });

  makeLamp() {
    margin = width / 10;
    var lamps = [
      LampModel(
        id: "A",
        left: 0,
        top: 0,
        active: false,
        height: height / 2.2,
        width: margin,
        color: 0xFFFF0000,
      ),
      LampModel(
        id: "B",
        top: 0,
        left: margin,
        active: false,
        height: margin,
        width: width - margin * 2,
        color: 0xFFFF0000,
      ),
      LampModel(
        id: "C",
        right: 0,
        top: 0,
        active: false,
        height: height / 2.2,
        width: margin,
        color: 0xFFFF0000,
      ),
      LampModel(
        id: "D",
        bottom: height / 2,
        left: margin,
        active: false,
        height: margin,
        width: width - margin * 2,
        color: 0xFFFF0000,
      ),
      LampModel(
        id: "E",
        bottom: margin,
        active: false,
        height: height / 2.2,
        width: margin,
        color: 0xFFFF0000,
      ),
      LampModel(
        id: "F",
        bottom: margin,
        left: margin,
        active: false,
        height: margin,
        width: width - margin * 2,
        color: 0xFFFF0000,
      ),
      LampModel(
        id: "G",
        right: 0,
        bottom: margin,
        active: false,
        height: height / 2.2,
        width: margin,
        color: 0xFFFF0000,
      ),
    ];

    if (number < 0 || number > 9) {
      return lamps
          .map(
            (l) => LampSocket(
              active: l.active,
              height: l.height,
              width: l.width,
              color: l.color,
              id: l.id,
              left: l.left,
              right: l.right,
              top: l.top,
              bottom: l.bottom,
            ),
          )
          .toList();
    }

    var currentBit = BinaryInt32("0000001");
    var currentNumber = numbers[number];

    var result = <LampSocket>[];

    for (int i = 0; i < lamps.length; i++) {
      var on = currentNumber.compare(currentBit.value);
      currentBit.shift1();
      result.add(
        LampSocket(
          active: on,
          height: lamps[i].height,
          width: lamps[i].width,
          color: lamps[i].color,
          id: lamps[i].id,
          left: lamps[i].left,
          right: lamps[i].right,
          bottom: lamps[i].bottom,
          top: lamps[i].top,
        ),
      );
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    margin = width / 8;
    return Container(
      color: Colors.black87,
      padding: const EdgeInsets.all(10),
      child: SizedBox(
          width: width,
          height: height,
          child: Stack(
            children: makeLamp(),
          )),
    );
  }
}

class LampSocket extends StatelessWidget {
  final bool active;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double height;
  final double width;
  final int color;
  final String id;

  const LampSocket({
    super.key,
    required this.active,
    required this.height,
    required this.width,
    required this.color,
    required this.id,
    this.top,
    this.left,
    this.right,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Led(
        id: id,
        active: active,
        color: color,
        height: height,
        width: width,
      ),
    );
  }
}

class Led extends StatelessWidget {
  final int color;
  final bool active;
  final double width;
  final double height;
  final String id;

  const Led({
    super.key,
    required this.id,
    required this.color,
    required this.active,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          color: active ? Color(color) : Colors.white24,
        ),
      ),
    );
  }
}
