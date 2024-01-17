class LampModel {
  final String id;
  final double width;
  final double height;
  final int color;
  final bool active;
  final double? left;
  final double? top;
  final double? bottom;
  final double? right;

  const LampModel({
    required this.id,
    required this.width,
    required this.height,
    required this.color,
    required this.active,
    this.left,
    this.top,
    this.bottom,
    this.right,
  });
}
