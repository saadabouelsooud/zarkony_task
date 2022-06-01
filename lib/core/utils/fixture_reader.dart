
import 'dart:io';

import 'package:flutter/services.dart';

Future<String> fixture(String name) async => await rootBundle.loadString('json_data/$name');
    // await File('lib/json_data/$name').readAsStringSync();