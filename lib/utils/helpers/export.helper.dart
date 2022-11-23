import 'dart:convert';
import 'dart:io';

import 'package:collector/config.dart';
import 'package:collector/data/repositories/measurement.repository.dart';
import 'package:collector/data/schemas/measurement.schema.dart';
import 'package:collector/utils/extensions/measurement.ext.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

Future<void> exportAndShare() async {
  final jsonFile = await _jsonFileGenerator();
  Share.shareXFiles([XFile(jsonFile.path)]);
}

Future<File> _jsonFileGenerator() async {
  final data = (await getIt.get<IMeasurementRepository>().read())
      .map((Measurement measurement) => measurement.toJson())
      .toList();
  final jsonString = json.encode(data);

  final temporaryDirectory = (await getTemporaryDirectory()).path;
  final file = File('$temporaryDirectory/collector-export.json');
  await file.writeAsString(jsonString);

  return file;
}
