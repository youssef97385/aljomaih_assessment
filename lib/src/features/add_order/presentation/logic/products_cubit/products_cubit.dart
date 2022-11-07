import 'package:aljomaih_assessment/src/core/common/domain/entites/product_entity.dart';
import 'package:aljomaih_assessment/src/features/add_order/domain/use_cases/get_products.dart';
import 'package:aljomaih_assessment/src/features/add_order/presentation/logic/products_cubit/products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/data/models/error_model/error_model.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final GetProducts getProducts;

  ProductsCubit({required this.getProducts})
      : super(const ProductsState.initial());

  Future<void> tryGetProducts() async {
    emit(const ProductsState.loading());

    final result = await getProducts();

    result.fold(
          (ErrorModel error) => emit(ProductsState.error(error)),
          (List<ProductEntity> productsList) => emit(
        ProductsState.successFetchingData(productsList: productsList),
      ),
    );
  }
}
