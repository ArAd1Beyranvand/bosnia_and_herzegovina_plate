import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';

import 'bosnia_and_herzegovina_colors.dart';

/// One ink on one field. Only the artwork plates carry a rounded frame in the
/// ink colour (3.6 on 110).
abstract final class BosniaAndHerzegovinaThemes {
  static final PlateTheme private = _theme(
    BosniaAndHerzegovinaColors.white,
    BosniaAndHerzegovinaColors.ink,
    0.033,
  );

  static final PlateTheme taxi = private;

  static final PlateTheme temporary = _theme(
    BosniaAndHerzegovinaColors.white,
    BosniaAndHerzegovinaColors.red,
    0.033,
  );

  /// The class letter picks the ink: `A` taxi, `T` temporary.
  static PlateTheme byClass(
    PlateTheme base,
    String Function(String key) group,
  ) {
    final PlateTheme t = group('class') == 'T' ? temporary : taxi;
    return base.copyWith(
      plateBackground: t.plateBackground,
      plateBorder: t.plateBorder,
      ink: t.ink,
      dividerColor: t.dividerColor,
      activeColor: t.activeColor,
      inactiveColor: t.inactiveColor,
    );
  }

  static final PlateTheme agricultural = _theme(
    BosniaAndHerzegovinaColors.agriculturalField,
    BosniaAndHerzegovinaColors.agriculturalInk,
    0,
  );

  static final PlateTheme eupm = _theme(
    BosniaAndHerzegovinaColors.eupmField,
    BosniaAndHerzegovinaColors.eupmInk,
    0,
  );

  static final PlateTheme diplomatic = _theme(
    BosniaAndHerzegovinaColors.diplomaticField,
    BosniaAndHerzegovinaColors.diplomaticInk,
    0,
  );
}

PlateTheme _theme(Color field, Color ink, double border) =>
    PlateTheme.monochrome(
      field: field,
      ink: ink,
      inactive: BosniaAndHerzegovinaColors.inactive,
      borderWidthRatio: border,
      plateRadiusRatio: 0.07,
    );
