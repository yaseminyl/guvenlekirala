import 'package:flutter/material.dart';
import 'package:guvenlekirala/core/base/base_viewmodel.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T value, Widget?) pageBuilder;
  final T viewModel;
  final Function(T model) onModelReady;
  const BaseView({Key? key, required this.pageBuilder, required this.viewModel, required this.onModelReady}) : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late T model;

  @override
  void initState() {
    model = widget.viewModel;
    widget.onModelReady(model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: model,
      child: Consumer<T>(
        builder: (context, model, Widget? child) => model.isLoading
            ? const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : widget.pageBuilder(context, model, child),
      ),
    );
  }
}
