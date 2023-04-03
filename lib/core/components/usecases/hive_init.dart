import 'dart:io';
import 'package:guvenlekirala/core/constants/hive_box_contants.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future hiveInit(Directory appDocumentDirectory) async {
  await Hive.initFlutter(appDocumentDirectory.path);

  await Hive.openBox(HiveBoxConstants.photoPath);
  await Hive.openBox(HiveBoxConstants.gender);
  await Hive.openBox(HiveBoxConstants.havePet);
  await Hive.openBox(HiveBoxConstants.petCount);
  await Hive.openBox(HiveBoxConstants.education);
  await Hive.openBox(HiveBoxConstants.salary);
  await Hive.openBox(HiveBoxConstants.haveIncome);
  await Hive.openBox(HiveBoxConstants.income);
  await Hive.openBox(HiveBoxConstants.currentRent);
  await Hive.openBox(HiveBoxConstants.min);
  await Hive.openBox(HiveBoxConstants.max);
  await Hive.openBox(HiveBoxConstants.aboutYours);
  await Hive.openBox(HiveBoxConstants.updateDate);
}
