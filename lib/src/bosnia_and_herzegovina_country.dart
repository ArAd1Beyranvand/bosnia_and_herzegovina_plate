import 'package:plate_core/plate_core.dart';

import 'bosnia_and_herzegovina_colors.dart';

/// Bosnia and Herzegovina as a `PlateCountry`: only the blue side band. `BIH`
/// is a [PlateLabel] on each spec, so [captionLines] is empty and there is no
/// flag.
abstract final class BosniaAndHerzegovinaCountry {
  // ignore: constant_identifier_names
  static const PlateCountry bosnia_and_herzegovina = PlateCountry(
    code: 'ba',
    captionLines: <String>[],
    panelColor: BosniaAndHerzegovinaColors.band,
    panelTextColor: BosniaAndHerzegovinaColors.white,
  );
}
