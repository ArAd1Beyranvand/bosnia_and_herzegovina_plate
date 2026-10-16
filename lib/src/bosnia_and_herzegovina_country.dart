import 'package:plate_core/plate_core.dart';

import 'bosnia_and_herzegovina_colors.dart';

/// Only the blue side band; `BIH` is a [PlateLabel] on each spec, so there is
/// no caption or flag.
abstract final class BosniaAndHerzegovinaCountry {
  // ignore: constant_identifier_names
  static const PlateCountry bosnia_and_herzegovina = PlateCountry(
    code: 'ba',
    captionLines: <String>[],
    panelColor: BosniaAndHerzegovinaColors.band,
    panelTextColor: BosniaAndHerzegovinaColors.white,
  );
}
