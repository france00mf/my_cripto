

import 'package:flutter/material.dart';
import 'package:my_cripto/utils/app_logger.dart';

import 'viewmodel_state.dart';

class BaseViewModel extends ChangeNotifier {
  late final _logger = appLogger(BaseViewModel);
  AppLogger get logger => _logger;


}