import 'package:flutter/material.dart';
import 'package:guvenlekirala/core/base/base_viewmodel.dart';

class EducationSelectionViewModel extends BaseViewModel {
  bool isInit = false;
  String education = "";

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  Future<void> init() async {
    if (!isInit) {
      changeStatus();
      isInit = !isInit;
    }
  }
}
