import 'package:collector/config.dart';
import 'package:collector/data/measurement.model.dart';
import 'package:collector/data/measurement.repository.dart';
import 'package:collector/state/measurement.state.dart';
import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:collector/utils/helpers/nonce.helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeasurementCubit extends Cubit<MeasurementState> {
  final BuildContext context;
  final IMeasurementRepository _repository;

  MeasurementCubit(
    super.initialState,
    this.context,
  ) : _repository = getIt.get<IMeasurementRepository>();

  Future<void> write({
    required int systolic,
    required int diastolic,
    required int pulse,
    required DateTime timestamp,
  }) async {
    emit(const MeasurementState.loading());
    try {
      await _repository.write(
        MeasurementModel(
          id: generateNonce(),
          systolic: systolic,
          diastolic: diastolic,
          pulse: pulse,
          timestamp: timestamp.millisecondsSinceEpoch,
        ),
      );
      read();
    } catch (_) {
      emit(MeasurementState.failed(context.locale.error));
    }
  }

  void read() {
    try {
      final measurements = _repository.read().toList();
      emit(MeasurementState.successful(measurements));
    } catch (_) {
      emit(MeasurementState.failed(context.locale.error));
    }
  }

  Future<void> delete(String id) async {
    try {
      await _repository.delete(id);
      read();
    } catch (_) {
      emit(MeasurementState.failed(context.locale.error));
    }
  }
}
