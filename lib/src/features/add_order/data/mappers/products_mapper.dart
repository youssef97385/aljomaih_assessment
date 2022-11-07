import 'package:aljomaih_assessment/src/core/common/domain/entites/product_entity.dart';
import 'package:aljomaih_assessment/src/features/add_order/data/models/products_response_model.dart';

class  ProductsMapper  {
  final List<ProductsResponseModel>?  productsList;

  ProductsMapper({this.productsList});
  List<ProductEntity> toListProductsEntity(){
    final List<ProductEntity> productsEntity =
    List<ProductEntity>.generate(
        productsList?.length ?? 0 ,
            (int index) {
          final ProductsResponseModel? item =
          productsList?[index];
          return ProductEntity(
            id: item?.id,
            name: item?.name,
            avatar: item?.avatar,
            count:0,
          );
        });

    return productsEntity;
  }



}