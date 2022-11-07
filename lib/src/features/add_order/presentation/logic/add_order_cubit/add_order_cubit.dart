import 'package:aljomaih_assessment/src/core/common/data/models/order_model/order_model.dart';
import 'package:aljomaih_assessment/src/core/common/data/models/success_model/success_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/data/models/error_model/error_model.dart';
import '../../../domain/use_cases/add_order.dart';
import 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  final AddOrder addOrder;

  AddOrderCubit({required this.addOrder})
      : super(const AddOrderState.initial());

  Future<void> tryAddOrder(OrderModel orderModel) async {
    emit(const AddOrderState.loading());

    final result = await addOrder(orderModel);

    print("resss$result");
    result.fold(
          (ErrorModel error) => emit(AddOrderState.error(error)),
          (SuccessModel successModel) => emit(
        AddOrderState.successAdded(successModel: successModel),
      ),
    );
  }
}
