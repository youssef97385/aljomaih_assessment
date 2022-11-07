import 'package:aljomaih_assessment/src/core/common/data/models/error_model/error_model.dart';
import 'package:aljomaih_assessment/src/core/common/widgets/error_view.dart';
import 'package:aljomaih_assessment/src/features/orders_list/presentation/logic/orders_cubit/orders_cubit.dart';
import 'package:aljomaih_assessment/src/features/orders_list/presentation/logic/orders_cubit/orders_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/domain/entites/order_entity.dart';
import '../../../../core/common/widgets/card_view.dart';
import '../../../../core/common/widgets/loading_view.dart';
import '../../../../core/common/widgets/text_view.dart';

class OrdersListBody extends StatelessWidget {
  const OrdersListBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(builder: (context, state) => state.maybeWhen(
          orElse: () {return SizedBox();},
          successFetchingData: ( List<OrderEntity>? ordersList) {

             return CustomScrollView(
           slivers: <Widget>[
             SliverAppBar(
               automaticallyImplyLeading: false,
               flexibleSpace: Padding(
                 padding: const EdgeInsets.only(
                   left: 18.0,
                   right: 18.0,
                   top: 18.0,
                 ),
                 child: TextView(
                   text: "Orders".tr(),
                   style: Theme.of(context).textTheme.headline3,
                 ),
               ),
               expandedHeight: 50,
             ),
             SliverPadding(
               padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
               sliver: SliverGrid(
                 gridDelegate:
                 const SliverGridDelegateWithMaxCrossAxisExtent(
                   maxCrossAxisExtent: 180,
                   mainAxisSpacing: 12,
                   crossAxisSpacing: 12,
                 ),
                 delegate: SliverChildBuilderDelegate(
                       (BuildContext context, int index) {
                     return CardView(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             TextView(
                               text: '#${ordersList?[index].id}',
                               style: Theme.of(context).textTheme.headline3,
                             ),

                             TextView(
                               text: 'Amount ${ordersList?[index].ammount}',
                               style: Theme.of(context).textTheme.bodyMedium,
                             ),

                           ],
                         ));
                   },
                   childCount: ordersList?.length ??0 ,
                 ),
               ),
             )
           ],
         );
          },
          error: (ErrorModel errorModel) {
            return ErrorView(
              error: errorModel.error?.message ?? 'some thing went wrong',
              onRefresh: () {},
            );
          },
          loading: () {
            return LoadingView();
          }));
  }
}
