import '../../../../core/common/data/models/order_model/order_model.dart';
import '../../../../core/common/data/models/product_model/product_model.dart';
import '../../../../core/common/domain/entites/order_entity.dart';
import '../../../../core/common/domain/entites/product_entity.dart';
import '../models/orders_response_model.dart';

class  OrderMapper  {
  final List<OrdersResponseModel>?  ordersList;

  OrderMapper({this.ordersList});
  List<OrderEntity> toListOrdersEntity(){
    final List<OrderEntity> ordersEntity =
    List<OrderEntity>.generate(
        ordersList?.length ?? 0 ,
            (int index) {
          final OrdersResponseModel? item =
          ordersList?[index];
          return OrderEntity(
            id: item?.id,
            date: item?.date,
            ammount: item?.ammount,
            userId: item?.userId,
            client: item?.client?.toClientEntity(),
          );
        });

    return ordersEntity;
  }



}