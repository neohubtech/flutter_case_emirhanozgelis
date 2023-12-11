import 'package:flutter/material.dart';
import 'package:intertech/core/state/base_state.dart';
import 'package:mobx/mobx.dart';

// BaseView is a generic StatefulWidget that manages the state of a specific type of ViewModel (T extends Store)
class BaseView<T extends Store> extends StatefulWidget {
  const BaseView({
    super.key,
    required this.viewModel,
    required this.onPageBuilder,
    required this.onModelReady,
    this.onDispose,
  });

  final Widget Function(BuildContext context, T value) onPageBuilder; 
  final T viewModel; 
  final void Function(T model) onModelReady; 
  final VoidCallback? onDispose; 

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends Store> extends BaseState<BaseView<T>> {
  late T model; 

  @override
  void initState() {
    super.initState();
    model = widget.viewModel; // Initialize the model with the provided ViewModel

    // Callback function to notify that the model is ready
    widget.onModelReady(model);
  }

  @override
  void dispose() {
    super.dispose();
    // Check if onDispose callback is provided and call it when the widget is being disposed
    if (widget.onDispose != null) {
      widget.onDispose?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Build the page using the onPageBuilder callback and pass the context and model
    return widget.onPageBuilder(context, model);
  }
}
