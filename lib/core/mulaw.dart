import 'dart:typed_data';

/// G.711 µ-law codec: halves the size of 16-bit PCM and is cheap enough to run
/// on every 20 ms packet in Dart. Good fit for voice over a local network.
class MuLaw {
  static const int _bias = 0x84;
  static const int _clip = 32635;
  static final Int16List _decodeTable = _buildDecodeTable();

  static Int16List _buildDecodeTable() {
    final table = Int16List(256);
    for (var i = 0; i < 256; i++) {
      final u = ~i & 0xFF;
      final exponent = (u >> 4) & 0x07;
      final mantissa = u & 0x0F;
      final magnitude = (((mantissa << 3) + _bias) << exponent) - _bias;
      table[i] = (u & 0x80) != 0 ? -magnitude : magnitude;
    }
    return table;
  }

  static int encodeSample(int pcm) {
    final sign = (pcm >> 8) & 0x80;
    var value = sign != 0 ? -pcm : pcm;
    if (value > _clip) value = _clip;
    value += _bias;
    var exponent = 7;
    for (var mask = 0x4000; (value & mask) == 0 && exponent > 0; mask >>= 1) {
      exponent--;
    }
    final mantissa = (value >> (exponent + 3)) & 0x0F;
    return ~(sign | (exponent << 4) | mantissa) & 0xFF;
  }

  static int decodeSample(int code) => _decodeTable[code & 0xFF];

  static Uint8List encode(Int16List pcm) {
    final out = Uint8List(pcm.length);
    for (var i = 0; i < pcm.length; i++) {
      out[i] = encodeSample(pcm[i]);
    }
    return out;
  }

  static Int16List decode(Uint8List data) {
    final out = Int16List(data.length);
    for (var i = 0; i < data.length; i++) {
      out[i] = _decodeTable[data[i]];
    }
    return out;
  }
}
