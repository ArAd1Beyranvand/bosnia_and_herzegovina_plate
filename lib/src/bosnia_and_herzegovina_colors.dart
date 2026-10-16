import 'package:flutter/widgets.dart';

/// Modal pixels of the reference images. `band`, `ink` and `red` come from
/// vector artwork; the agricultural, EUPM and diplomatic values come from
/// photographs and carry their lighting.
abstract final class BosniaAndHerzegovinaColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color ink = Color(0xFF1F1A17);
  static const Color band = Color(0xFF0093DD);
  static const Color red = Color(0xFFDA251D);

  static const Color agriculturalField = Color(0xFFF0F0F0);
  static const Color agriculturalInk = Color(0xFF387440);

  static const Color eupmField = Color(0xFFF6EA29);
  static const Color eupmInk = Color(0xFF684038);

  static const Color diplomaticField = Color(0xFF48B8E8);
  static const Color diplomaticInk = Color(0xFFF4A438);

  static const Color inactive = Color(0xFFB0B0B0);
}
