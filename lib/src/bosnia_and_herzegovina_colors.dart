import 'package:flutter/widgets.dart';

/// Colours of the Bosnian and Herzegovinian plates. `band`, `ink` and `red`
/// are modal pixels of the vector artwork (`Registarske_tablice…`,
/// `Probne_registarske_tablice…`). The agricultural, EUPM and diplomatic
/// values are modal pixels of photographs (EUPM and the diplomatic plate
/// flattened off-axis) and carry their lighting; the EUPM field is the
/// brief's colour-balanced value.
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
