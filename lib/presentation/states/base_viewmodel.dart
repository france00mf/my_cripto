

import 'package:flutter/material.dart';
import 'package:my_cripto/utils/app_logger.dart';

import 'viewmodel_state.dart';

class BaseViewModel extends ChangeNotifier {
  late final _logger = appLogger(BaseViewModel);
  AppLogger get logger => _logger;

    ViewModelState _state = const ViewModelState.idle();
  ViewModelState get state => _state;

    bool get isBusy =>
      _state.maybeWhen<bool>(busy: () => true, orElse: () => false);

    bool get isIdle =>
      _state.maybeWhen<bool>(idle: () => true, orElse: () => false);

  bool get isError =>
      _state.maybeWhen<bool>(error: (value) => true, orElse: () => false);

    String get getError => _state.maybeWhen<String>(
      error: (value) => value.message, orElse: () => "");

        changeState(ViewModelState newState) {
    _state = newState;
    if (!isDisposed) notifyListeners();
    
  }

    ViewModelState _secondaryState = const ViewModelState.idle();
  ViewModelState get secondaryState => _secondaryState;

    bool get isSecondaryBusy =>
      _secondaryState.maybeWhen<bool>(busy: () => true, orElse: () => false);

    bool get isSecondaryIdle =>
      _secondaryState.maybeWhen<bool>(idle: () => true, orElse: () => false);

      bool get isSecondaryError => _secondaryState.maybeWhen<bool>(
      error: (value) => true, orElse: () => false);

        String get getSecondaryError => _secondaryState.maybeWhen<String>(
      error: (value) => value.message, orElse: () => "");

      changeSecondaryState(ViewModelState newState) {
    _secondaryState = newState;
    if (!isDisposed) notifyListeners();

    
  }

  bool _disposed = false;
  bool get isDisposed => _disposed;
  @override
  void dispose() {
    super.dispose();
    _disposed = true;
  }



}