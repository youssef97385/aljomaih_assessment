import 'package:aljomaih_assessment/src/core/common/domain/entites/client_entity.dart';
import 'package:aljomaih_assessment/src/core/common/domain/entites/order_entity.dart';
import 'package:aljomaih_assessment/src/core/common/domain/entites/product_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/common/data/models/error_model/error_model.dart';


part 'products_state.freezed.dart';

@freezed
abstract class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.loading() = _Loading;

  const factory ProductsState.successFetchingData({
    required List<ProductEntity>? productsList,
  }) = _SuccessFetchingData;

  const factory ProductsState.error(ErrorModel error) = _Error;
}
