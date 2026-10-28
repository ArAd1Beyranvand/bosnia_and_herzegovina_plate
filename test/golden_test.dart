import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bosnia_and_herzegovina_plate/bosnia_and_herzegovina_plate.dart';
import 'package:plate_core/plate_core.dart';

/// One golden per category, drawn with real bold faces so the ink can be
/// measured against the references (`platekit golden-check`).
///
/// Regenerate with `flutter test --update-goldens` after a deliberate change.
void main() {
  setUpAll(() async {
    final FontLoader loader = FontLoader('Roboto');
    for (final String path in const <String>[
      '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf',
    ]) {
      final File face = File(path);
      if (!face.existsSync()) continue;
      loader.addFont(face.readAsBytes().then((b) => ByteData.view(b.buffer)));
    }
    await loader.load();
  });

  /// category id -> (spec, theme, space-separated sample value)
  final Map<String, (PlateSpec, PlateTheme, String)> cases =
      <String, (PlateSpec, PlateTheme, String)>{
        'private': (
          BosniaAndHerzegovinaPlates.private,
          BosniaAndHerzegovinaThemes.private,
          'A 1 2 A 3 4 5',
        ),
        'taxi': (
          BosniaAndHerzegovinaPlates.taxiTemporary,
          BosniaAndHerzegovinaThemes.taxi,
          'A 1 2 3 4 5 6',
        ),
        'temporary': (
          BosniaAndHerzegovinaPlates.taxiTemporary,
          BosniaAndHerzegovinaThemes.temporary,
          'T 1 2 3 4 5 6',
        ),
        'agricultural': (
          BosniaAndHerzegovinaPlates.agricultural,
          BosniaAndHerzegovinaThemes.agricultural,
          'M 8 0 T 0 9 6',
        ),
        'eupm': (
          BosniaAndHerzegovinaPlates.eupm,
          BosniaAndHerzegovinaThemes.eupm,
          '0 3 7 4',
        ),
        'diplomatic': (
          BosniaAndHerzegovinaPlates.diplomatic,
          BosniaAndHerzegovinaThemes.diplomatic,
          '1 4 A 0 9 4',
        ),
      };

  for (final MapEntry<String, (PlateSpec, PlateTheme, String)> c
      in cases.entries) {
    testWidgets(c.key, (tester) async {
      final (PlateSpec spec, PlateTheme theme, String values) = c.value;
      final PlateController controller = PlateController.fromValues(
        spec,
        values.split(' '),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 680,
                height: 300,
                child: PlateThemeScope(
                  theme: theme,
                  child: PlateView(
                    controller: controller,
                    theme: theme,
                    country: BosniaAndHerzegovinaCountry.bosnia_and_herzegovina,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(PlateView),
        matchesGoldenFile('goldens/ba_${c.key}.png'),
      );
      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });
  }
}
