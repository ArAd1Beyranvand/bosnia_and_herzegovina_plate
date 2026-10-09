import 'package:flutter/widgets.dart' show Color, EdgeInsets;
import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'bosnia_and_herzegovina_country.dart';

/// Where the ink sits, in plate units: every plate is the 520×110 mm the
/// article gives. Each reference was flattened to it at 4 px per unit and its
/// ink runs read off.
///
/// Ink is 65–66 tall on the artwork plates (y 21.2–86.5) and 78–89 on the
/// photographs; a box that tall would need 120+, so every box is the full
/// canvas height and the ink lands near 60, about 90% of the artwork and 70%
/// of the photographed plates.
///
/// The artwork frame is 3.6 thick at x 8.75–511.5, y 6.25–101.75, i.e. inset
/// 6–9 from the artwork's edge; the theme's border sits at the plate edge, so
/// the white between is drawn by the background and the band keeps its
/// measured extent (x 12.5–57.5, y 9.8–98.2). `BIH` ink: x 13.2–56,
/// y 71.5–88.8.
///
/// Glyph centres (x), from ink runs:
/// - private `A12-A-345`: 91, 144, 198; dashes 238, 319.5; letter 279;
///   digits 362, 415, 468.
/// - taxi `TA-123456` / temporary `TT-123456`: letters 91.3, 144.3; dash
///   184.2; digits 223 + 49.5 i.
/// - agricultural `M80-T-096` (photo): 83, 134, 186; dashes 228.3, 316.6;
///   `T` 273; digits 363, 418.5, 475.
/// - EUPM (photo): `E U P M` 69, 111, 153, 202 (uneven, so fixed text);
///   digits 334.4, 375.4, 415.8, 456.4.
/// - diplomatic `14-A-094` (photo): 98, 154.6; dashes 199.3, 290.4;
///   `A` 245; digits 333.4, 384.6, 436.3.
abstract final class _Layout {
  static const double width = 520, height = 110;
  static const double slotWidth = 54;
}

/// The blue side band: x [left]..[end] and y [top]..[bottom], the rest of the
/// strip white. `BIH` sits in the box under it.
class _Band {
  const _Band(this.left, this.end, this.top, this.bottom, this.label);

  final double left, end, top, bottom;
  final PlateBox label;
}

/// Artwork plates: blue x 12.5–57.5, y 9.8–98.2.
const _Band _artworkBand = _Band(
  12.5,
  57.5,
  9.8,
  98.2,
  PlateBox(12.5, 69.5, 45, 21),
);

/// Agricultural photo: blue x 4–47, y 6.5–101.
const _Band _agriculturalBand = _Band(4, 47, 6.5, 101, PlateBox(4, 70, 43, 21));

/// A character printed on every plate of the design, placed by its centre.
class _Fixed {
  const _Fixed(this.text, this.cx);

  final String text;
  final double cx;
}

/// A keyed group of slots at the given centres.
class _Run {
  const _Run(this.key, this.alphabets, this.centres);

  final String key;
  final List<PlateAlphabet> alphabets;
  final List<double> centres;
}

/// The plates, one builder. [private] is `A12-A-345`; [taxi] `TA-123456` and
/// [temporary] `TT-123456` share a layout (`TT` red, the letters printed);
/// [agricultural] is the private format in green with the band inset;
/// [eupm] is `EUPM 0374`; [diplomatic] `14-A-094`.
///
/// Not implemented: the pre-1998 series (Herzeg-Bosna, Republika Srpska,
/// Yugoslav, UNPF, working road machine), which the article captions as
/// former, and the military and portable (`MT`) plates, which have no
/// reference. The EUPM star ring, rivets and the diplomatic plate's wave
/// line are not drawn.
abstract final class BosniaAndHerzegovinaPlates {
  static final PlateSpec private = _spec(
    id: 'ba.private',
    band: _artworkBand,
    fixed: const <_Fixed>[_Fixed('-', 238), _Fixed('-', 319.5)],
    runs: <_Run>[
      _Run('prefix', _serial, const <double>[91, 144, 198]),
      _Run('letter', _letter, const <double>[279]),
      _Run('digits', _threeDigits, const <double>[362, 415, 468]),
    ],
  );

  static final PlateSpec taxi = _twoLetter('ba.taxi', 'A');

  static final PlateSpec temporary = _twoLetter('ba.temporary', 'T');

  static final PlateSpec agricultural = _spec(
    id: 'ba.agricultural',
    band: _agriculturalBand,
    fixed: const <_Fixed>[_Fixed('-', 228.3), _Fixed('-', 316.6)],
    runs: <_Run>[
      _Run('prefix', _serial, const <double>[83, 134, 186]),
      _Run('letter', _letter, const <double>[273]),
      _Run('digits', _threeDigits, const <double>[363, 418.5, 475]),
    ],
  );

  static final PlateSpec eupm = _spec(
    id: 'ba.eupm',
    fixed: const <_Fixed>[
      _Fixed('E', 69),
      _Fixed('U', 111),
      _Fixed('P', 153),
      _Fixed('M', 202),
    ],
    runs: <_Run>[
      _Run('digits', _digits(4), const <double>[334.4, 375.4, 415.8, 456.4]),
    ],
  );

  static final PlateSpec diplomatic = _spec(
    id: 'ba.diplomatic',
    fixed: const <_Fixed>[_Fixed('-', 199.3), _Fixed('-', 290.4)],
    runs: <_Run>[
      _Run('code', _digits(2), const <double>[98, 154.6]),
      _Run('letter', _letter, const <double>[245]),
      _Run('digits', _threeDigits, const <double>[333.4, 384.6, 436.3]),
    ],
  );

  static List<PlateSpec> get all => <PlateSpec>[
    private,
    taxi,
    temporary,
    agricultural,
    eupm,
    diplomatic,
  ];

  static const List<PlateAlphabet> _serial = <PlateAlphabet>[
    BosniaAndHerzegovinaAlphabets.first,
    BosniaAndHerzegovinaAlphabets.digits,
    BosniaAndHerzegovinaAlphabets.digits,
  ];
  static const List<PlateAlphabet> _letter = <PlateAlphabet>[
    BosniaAndHerzegovinaAlphabets.letters,
  ];
  static const List<PlateAlphabet> _threeDigits = <PlateAlphabet>[
    BosniaAndHerzegovinaAlphabets.digits,
    BosniaAndHerzegovinaAlphabets.digits,
    BosniaAndHerzegovinaAlphabets.digits,
  ];

  static List<PlateAlphabet> _digits(int n) => <PlateAlphabet>[
    for (int i = 0; i < n; i++) BosniaAndHerzegovinaAlphabets.digits,
  ];

  static PlateSpec _twoLetter(String id, String second) => _spec(
    id: id,
    band: _artworkBand,
    fixed: <_Fixed>[
      const _Fixed('T', 91.3),
      _Fixed(second, 144.3),
      const _Fixed('-', 184.2),
    ],
    runs: <_Run>[
      _Run('digits', _digits(6), <double>[
        for (int i = 0; i < 6; i++) 223 + 49.5 * i,
      ]),
    ],
  );

  static PlateSpec _spec({
    required String id,
    required List<_Run> runs,
    required List<_Fixed> fixed,
    _Band? band,
  }) {
    int next = 0;
    final List<PlateTextGroup> groups = <PlateTextGroup>[];
    for (final _Run run in runs) {
      groups.add(
        PlateTextGroup(<int>[
          for (int i = 0; i < run.centres.length; i++) next + i,
        ], key: run.key),
      );
      next += run.centres.length;
    }
    return PlateSpec(
      id: id,
      country: BosniaAndHerzegovinaCountry.bosnia_and_herzegovina,
      canvasWidth: _Layout.width,
      canvasHeight: _Layout.height,
      // The country draws nothing (no flag, no caption); the box only has to
      // lie on the canvas. The band itself is the background's.
      panel: PlatePanel(
        box: band == null
            ? const PlateBox(0, 0, 1, 1)
            : PlateBox(
                band.left,
                band.top,
                band.end - band.left,
                band.bottom - band.top,
              ),
        padding: EdgeInsets.zero,
      ),
      background: band == null
          ? PlateSection.plain
          : PlateSection.columns(<PlatePart>[
              PlatePart(PlateSection.plain, end: band.left),
              PlatePart(
                PlateSection.rows(<PlatePart>[
                  PlatePart(PlateSection.plain, end: band.top),
                  PlatePart(
                    const PlateSection.fill(PlateFill.panel),
                    end: band.bottom,
                  ),
                  const PlatePart(PlateSection.plain),
                ]),
                end: band.end,
              ),
              const PlatePart(PlateSection.plain),
            ]),
      slots: <PlateSlot>[
        for (final _Run run in runs)
          for (int i = 0; i < run.centres.length; i++)
            PlateSlot(
              alphabet: run.alphabets[i],
              box: PlateBox(
                run.centres[i] - _Layout.slotWidth / 2,
                0,
                _Layout.slotWidth,
                _Layout.height,
              ),
            ),
      ],
      labels: <PlateLabel>[
        if (band != null)
          PlateLabel(
            text: 'BIH',
            box: band.label,
            glyphHeight: 30,
            color: const Color(0xFFFFFFFF),
          ),
        for (final _Fixed f in fixed)
          PlateLabel(
            text: f.text,
            box: PlateBox(f.cx - 25, 0, 50, _Layout.height),
            glyphHeight: _Layout.height,
          ),
      ],
      textGroups: groups,
    );
  }
}
