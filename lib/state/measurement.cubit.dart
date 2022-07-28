import 'package:collector/config.dart';
import 'package:collector/data/measurement.repository.dart';
import 'package:collector/data/measurement.schema.dart';
import 'package:collector/state/measurement.state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeasurementCubit extends Cubit<MeasurementState> {
  final IMeasurementRepository _repository;

  MeasurementCubit(super.initialState)
      : _repository = getIt.get<IMeasurementRepository>();

  Future<void> addMeasurement(
    MeasurementSchema schema,
    String errorMessage,
  ) async {
    emit(const MeasurementState.loading());
    try {
      await _repository.storeNewMeasurement(schema);
      retrieveMeasurements(errorMessage);
    } catch (_) {
      emit(MeasurementState.failed(errorMessage));
    }
  }

  void retrieveMeasurements(String errorMessage) {
    try {
      final measurements = _repository.getMeasurements().toList();
      emit(MeasurementState.successful(measurements));
    } catch (_) {
      emit(MeasurementState.failed(errorMessage));
    }
  }
}
