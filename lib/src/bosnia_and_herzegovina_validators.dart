import 'package:plate_core/plate_core.dart';

/// Judges a plate by its groups. Reports, never bars a keystroke.
///
/// A private or agricultural serial is `X00-X-000`: a digit or one of
/// `A E J K M O T`, two digits, one of those letters, three digits. Taxi,
/// temporary and EUPM plates carry fixed text and are judged on six or four
/// digits; a diplomatic plate is a two-digit code from 10 to 49 (not 31),
/// a letter and three digits.
class BosniaAndHerzegovinaValidator extends GatedPlateValidator {
  const BosniaAndHerzegovinaValidator();

  @override
  String get gateGroup => 'digits';

  static const String reasonSerial = 'A plate is X00-X-000.';
  static const String reasonSix = 'The plate carries six digits.';
  static const String reasonFour = 'An EUPM plate carries four digits.';
  static const String reasonDiplomatic =
      'A diplomatic plate is a code from 10 to 49, a letter and three digits.';

  @override
  PlateValidation judge(PlateEntry entry) {
    final String digits = entry.group('digits');
    final String prefix = entry.group('prefix');
    final String letter = entry.group('letter');
    final String code = entry.group('code');
    if (code.isNotEmpty) {
      final int? n = int.tryParse(code);
      return n != null &&
              n >= 10 &&
              n <= 49 &&
              n != 31 &&
              letter.length == 1 &&
              isDigitsOfLength(digits, 3)
          ? const PlateValidation.valid()
          : const PlateValidation.invalid(reasonDiplomatic);
    }
    if (prefix.isNotEmpty) {
      return prefix.length == 3 && letter.length == 1 && isDigitsOfLength(digits, 3)
          ? const PlateValidation.valid()
          : const PlateValidation.invalid(reasonSerial);
    }
    if (isDigitsOfLength(digits, 6)) return const PlateValidation.valid();
    return isDigitsOfLength(digits, 4)
        ? const PlateValidation.valid()
        : const PlateValidation.invalid(reasonSix);
  }
}
