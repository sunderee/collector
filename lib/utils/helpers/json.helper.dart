import 'dart:convert';
import 'dart:io';

import 'package:collector/data/measurement.schema.dart';
import 'package:path_provider/path_provider.dart';

Future<File> jsonFileExporter(List<MeasurementSchema> schemas) async {
  final rawString = json.encode(
    schemas.map((MeasurementSchema item) => item.toJson()).toList(),
  );

  final temporaryDirectory = (await getTemporaryDirectory()).path;
  final file = File('$temporaryDirectory/collector-export.json');
  await file.writeAsString(rawString);

  return file;
}

List<MeasurementSchema> jsonFileImporter(String jsonFile) =>
    (json.decode(jsonFile) as List<dynamic>)
        .cast<Map<String, int>>()
        .map((Map<String, int> element) => MeasurementSchema.fromJson(element))
        .toList();
