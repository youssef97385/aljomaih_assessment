import 'package:aljomaih_assessment/src/features/add_order/presentation/logic/add_order_cubit/add_order_cubit.dart';
import 'package:aljomaih_assessment/src/features/add_order/presentation/logic/clients_cubit/clients_cubit.dart';
import 'package:aljomaih_assessment/src/features/add_order/presentation/logic/products_cubit/products_cubit.dart';
import 'package:aljomaih_assessment/src/features/add_order/presentation/widgets/add_orders_body.dart';
import 'package:aljomaih_assessment/src/features/orders_list/presentation/logic/orders_cubit/orders_cubit.dart';
import 'package:aljomaih_assessment/src/features/orders_list/presentation/widgets/orders_list_body.dart';
import 'package:aljomaih_assessment/src/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddOrdersPage extends StatelessWidget {
  const AddOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(

       providers: [
         BlocProvider(
           lazy: false,
           create: (context) => serviceLocator<ClientsCubit>()..tryGetClients(),
         ),
         BlocProvider(
           lazy: false,
           create: (context) => serviceLocator<ProductsCubit>()..tryGetProducts(),
         ),
     BlocProvider(
           lazy: false,
           create: (context) => serviceLocator<AddOrderCubit>(),
         ),

       ],
        child: const AddOrdersBody(),
      ),
    );
  }
}
