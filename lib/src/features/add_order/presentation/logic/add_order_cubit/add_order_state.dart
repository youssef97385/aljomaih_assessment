import 'package:aljomaih_assessment/src/core/common/data/models/success_model/success_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/common/data/models/error_model/error_model.dart';


part 'add_order_state.freezed.dart';

@freezed
abstract class AddOrderState with _$AddOrderState {
  const factory AddOrderState.initial() = _Initial;
  const factory AddOrderState.loading() = _Loading;

  const factory AddOrderState.successAdded({
    required SuccessModel successModel,
  }) = _SuccessAdded;

  const factory AddOrderState.error(ErrorModel error) = _Error;
}
