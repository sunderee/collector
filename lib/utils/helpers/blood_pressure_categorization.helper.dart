enum BloodPressureCategory { normal, elevated, hypertension }

/// Categorization follows the official guidelines by CDC, in particular, The
/// American College of Cardiology/American Heart Association Guideline for the
/// Prevention, Detection, Evaluation, and Management of High Blood Pressure in
/// Adults (2017 Guideline). https://www.cdc.gov/bloodpressure/about.htm.
///
/// Normal: systolic less then 120 mmHg and diastolic less than 80 mmHg.
/// Elevated: systolic 120–129 mmHg and diastolic less than 80 mmHg.
/// Hypertension: systolic 130+ mmHg or diastolic 80+ mmHg.
BloodPressureCategory? categorizeBloodPressure(int systolic, int diastolic) {
  if (systolic < 120 && diastolic < 80) {
    return BloodPressureCategory.normal;
  } else if ((systolic >= 120 && systolic <= 129) && diastolic < 80) {
    return BloodPressureCategory.elevated;
  } else if (systolic >= 130 || diastolic >= 80) {
    return BloodPressureCategory.hypertension;
  }
  return null;
}
