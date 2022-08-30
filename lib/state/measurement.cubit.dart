import 'package:collector/config.dart';
import 'package:collector/data/enums/emotion.enum.dart';
import 'package:collector/data/repositories/measurement.repository.dart';
import 'package:collector/data/schemas/measurement.schema.dart';
import 'package:collector/state/measurement.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeasurementCubit extends Cubit<MeasurementState> {
  final IMeasurementRepository _repository;

  MeasurementCubit(super.initialState)
      : _repository = getIt.get<IMeasurementRepository>();

  Future<void> fetchMeasurements() async {
    emit(const MeasurementState.loading());
    try {
      final data = await _repository.getAll();
      emit(MeasurementState.successful(data));
    } catch (_) {
      emit(const MeasurementState.failed());
    }
  }

  Future<void> addMeasurement({
    required EmotionEnum? emotion,
    required int systolic,
    required int diastolic,
    required int pulse,
    required DateTime date,
  }) async {
    await _repository.storeMeasurement(
      Measurement()
        ..emotion = emotion
        ..systolic = systolic
        ..diastolic = diastolic
        ..pulse = pulse
        ..timestamp = date,
    );
    fetchMeasurements();
  }
}
