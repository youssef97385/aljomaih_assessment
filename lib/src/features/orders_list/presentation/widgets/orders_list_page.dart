import 'package:aljomaih_assessment/src/features/orders_list/presentation/logic/orders_cubit/orders_cubit.dart';
import 'package:aljomaih_assessment/src/features/orders_list/presentation/widgets/orders_list_body.dart';
import 'package:aljomaih_assessment/src/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersListPage extends StatelessWidget {
  const OrdersListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => Future.sync(() => null),
        child: BlocProvider(
          create: (context) => serviceLocator<OrdersCubit>()..tryGetOrders(),
          child: const OrdersListBody(),
        ),
      ),
    );
  }
}
