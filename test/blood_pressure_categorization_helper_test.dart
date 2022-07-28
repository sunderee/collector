import 'package:collector/utils/helpers/blood_pressure_categorization.helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'blood pressure categorization',
    () {
      test('normal', () {
        const systolic = 118;
        const diastolic = 75;
        final category = categorizeBloodPressure(systolic, diastolic);

        expect(category, BloodPressureCategory.normal);
      });

      test('elevated', () {
        const systolic = 123;
        const diastolic = 75;
        final category = categorizeBloodPressure(systolic, diastolic);

        expect(category, BloodPressureCategory.elevated);
      });

      test('normal', () {
        const systolic = 131;
        const diastolic = 81;
        final category = categorizeBloodPressure(systolic, diastolic);

        expect(category, BloodPressureCategory.hypertension);
      });

      test('hypertension', () {
        const systolic = 123;
        const diastolic = 82;
        final category = categorizeBloodPressure(systolic, diastolic);

        expect(category, BloodPressureCategory.hypertension);
      });
    },
  );
}
