import 'package:collector/data/schemas/measurement.schema.dart';
import 'package:collector/state/status.dart';
import 'package:equatable/equatable.dart';

class MeasurementState extends Equatable {
  final StatusEnum status;
  final List<Measurement> data;

  const MeasurementState._({
    required this.status,
    this.data = const <Measurement>[],
  });

  const MeasurementState.loading() : this._(status: StatusEnum.loading);

  const MeasurementState.successful(List<Measurement> data)
      : this._(
          status: StatusEnum.successful,
          data: data,
        );

  const MeasurementState.failed() : this._(status: StatusEnum.failed);

  @override
  List<Object?> get props => [
        status,
        List<Measurement>.from(data),
      ];
}
