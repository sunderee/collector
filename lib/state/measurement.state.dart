import 'package:collector/data/measurement.model.dart';
import 'package:equatable/equatable.dart';

enum StatusEnum { initial, loading, successful, failed }

class MeasurementState extends Equatable {
  final StatusEnum status;
  final List<MeasurementModel> data;
  final String errorMessage;

  const MeasurementState._({
    required this.status,
    this.data = const <MeasurementModel>[],
    this.errorMessage = '',
  });

  const MeasurementState.initial() : this._(status: StatusEnum.initial);

  const MeasurementState.loading() : this._(status: StatusEnum.loading);

  const MeasurementState.successful(List<MeasurementModel> data)
      : this._(
          status: StatusEnum.successful,
          data: data,
        );

  const MeasurementState.failed(String errorMessage)
      : this._(
          status: StatusEnum.failed,
          errorMessage: errorMessage,
        );

  @override
  List<Object?> get props => [
        status,
        List<MeasurementModel>.from(data),
        errorMessage,
      ];
}
