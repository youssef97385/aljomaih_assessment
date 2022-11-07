import 'package:aljomaih_assessment/src/features/orders_list/domain/use_cases/get_orders.dart';
import 'package:aljomaih_assessment/src/features/orders_list/presentation/logic/orders_cubit/orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/data/models/error_model/error_model.dart';
import '../../../../../core/common/domain/entites/order_entity.dart';

class OrdersCubit extends Cubit<OrdersState> {
  final GetOrders getOrders;

  OrdersCubit({required this.getOrders}) : super(const OrdersState.initial());

  Future<void> tryGetOrders() async {
    emit(const OrdersState.loading());

    final result = await getOrders();

    result.fold(
      (ErrorModel error) => emit(OrdersState.error(error)),
      (List<OrderEntity> ordersList) => emit(
        OrdersState.successFetchingData(ordersList: ordersList),
      ),
    );
  }
}
