import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_cripto/core/errors/failure.dart';

part 'viewmodel_state.freezed.dart';

@freezed
class ViewModelState with _$ViewModelState {
  const factory ViewModelState.idle() = _Idle;
  const factory ViewModelState.error(Failure failure) = _Error;
  const factory ViewModelState.busy() = _Busy;
}
