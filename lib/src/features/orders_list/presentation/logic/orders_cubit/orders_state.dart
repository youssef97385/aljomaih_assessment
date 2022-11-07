import 'package:aljomaih_assessment/src/core/common/domain/entites/order_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/common/data/models/error_model/error_model.dart';


part 'orders_state.freezed.dart';

@freezed
abstract class OrdersState with _$OrdersState {
  const factory OrdersState.initial() = _Initial;
  const factory OrdersState.loading() = _Loading;

  const factory OrdersState.successFetchingData({
    required List<OrderEntity>? ordersList,
  }) = _SuccessFetchingData;

  const factory OrdersState.error(ErrorModel error) = _Error;
}
