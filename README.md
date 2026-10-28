FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the resilient people of Bosnia and Herzegovina to view examples:

https://platexample.ir/#/discover/bosniaandherzegovina

# bosnia_and_herzegovina_plate

Bosnia and Herzegovina's licence plates for the `plate_core` library. Six plates (private, taxi, temporary, agricultural, EUPM, diplomatic) with the blue BIH band, themes, a Latin–Cyrillic letter alphabet and an advisory validator.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  bosnia_and_herzegovina_plate: ^0.1.0
```

## Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:bosnia_and_herzegovina_plate/bosnia_and_herzegovina_plate.dart';

PlateCanvas(
  spec: BosniaAndHerzegovinaPlates.private,
  theme: BosniaAndHerzegovinaThemes.private,
  validator: const BosniaAndHerzegovinaValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Contains

- `BosniaAndHerzegovinaCountry` — country panel: `bosnia_and_herzegovina`.
- `BosniaAndHerzegovinaPlates` — 5 plate specs: `private`, `taxiTemporary`, `agricultural`, `eupm`, `diplomatic`.
- `BosniaAndHerzegovinaThemes` — 6 themes: `private`, `taxi`, `temporary`, `agricultural`, `eupm`, `diplomatic`.
- `BosniaAndHerzegovinaValidator` — advisory validator; flags the frame, never blocks a keystroke.

## Plates

`private` is `A12-A-345`; `taxiTemporary` is `TA-` / `TT-123456`; `agricultural` is the private format with the band inset;
`eupm` is `EUPM 0374`; `diplomatic` is `14-A-094`.

Not implemented: the pre-1998 series (Herzeg-Bosna, Republika Srpska,
Yugoslav, UNPF, working road machine), which the article captions as
former, and the military and portable (`MT`) plates, which have no
reference. The EUPM star ring, rivets and the diplomatic plate's wave
line are not drawn.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

