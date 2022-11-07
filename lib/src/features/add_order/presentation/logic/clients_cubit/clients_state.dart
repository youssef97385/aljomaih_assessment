import 'package:aljomaih_assessment/src/core/common/domain/entites/client_entity.dart';
import 'package:aljomaih_assessment/src/core/common/domain/entites/order_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/common/data/models/error_model/error_model.dart';


part 'clients_state.freezed.dart';

@freezed
abstract class ClientsState with _$ClientsState {
  const factory ClientsState.initial() = _Initial;
  const factory ClientsState.loading() = _Loading;

  const factory ClientsState.successFetchingData({
    required List<ClientEntity>? clientsList,
  }) = _SuccessFetchingData;

  const factory ClientsState.error(ErrorModel error) = _Error;
}
