class BinaryInt32 {
  var _binary = <String>[];

  get value => _binary.join("");

  BinaryInt32(String binary) {
    _binary = binary.split("");
  }

  bool compare(String binary) {
    var binaryArr = binary.split("");

    for (var i = 0; i < binaryArr.length; i++) {
      if (_binary[i] == "1" && binaryArr[i] == "1") {
        return true;
      }
    }

    return false;
  }

  void shift1() {
    for (var i = 6; i >= 0; i--) {
      if (_binary[i] == "1") {
        _binary[i] = "0";
        if (i > 0) {
          _binary[i - 1] = "1";
        }
        break;
      }
    }
  }
}
