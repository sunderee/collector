import 'package:collector/data/schemas/measurement.schema.dart';
import 'package:collector/state/measurement.cubit.dart';
import 'package:collector/ui/screens/home/components/molecules/detail_inputs.dart';
import 'package:collector/ui/screens/new_record/components/molecules/date.container.dart';
import 'package:collector/utils/extensions/build_context.ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateDialog extends StatefulWidget {
  final Measurement data;

  const UpdateDialog({super.key, required this.data});

  @override
  State<UpdateDialog> createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  final _systolicController = TextEditingController();
  final _diastolicController = TextEditingController();
  final _pulseController = TextEditingController();

  late DateTime _currentDateTime;

  @override
  void initState() {
    super.initState();
    _systolicController.text = widget.data.systolic.toString();
    _diastolicController.text = widget.data.diastolic.toString();
    _pulseController.text = widget.data.pulse.toString();
    _currentDateTime = widget.data.timestamp;
  }

  @override
  void dispose() {
    _systolicController.dispose();
    _diastolicController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          DetailInputs(
            systolicController: _systolicController,
            diastolicController: _diastolicController,
            pulseController: _pulseController,
          ),
          DateContainer(
            date: _currentDateTime,
            onDateChanged: (DateTime newTime) {
              setState(() => _currentDateTime = newTime);
            },
          ),
          const SizedBox(height: 32.0),
          MaterialButton(
            minWidth: MediaQuery.of(context).size.width,
            color: Theme.of(context).colorScheme.primary,
            child: Text(
              context.locale.screenDetailsUpdate,
              style: const TextStyle(color: Colors.black87),
            ),
            onPressed: () {
              final model = Measurement()
                ..id = widget.data.id
                ..emotion = widget.data.emotion
                ..systolic = int.parse(_systolicController.text)
                ..diastolic = int.parse(_diastolicController.text)
                ..pulse = int.parse(_pulseController.text)
                ..timestamp = _currentDateTime;
              BlocProvider.of<MeasurementCubit>(context)
                  .updateMeasurement(model);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
