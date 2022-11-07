import 'package:aljomaih_assessment/src/core/common/data/models/client_model/client_model.dart';
import 'package:aljomaih_assessment/src/core/common/domain/entites/client_entity.dart';
import 'package:aljomaih_assessment/src/core/common/widgets/card_view.dart';
import 'package:aljomaih_assessment/src/core/common/widgets/text_view.dart';
import 'package:aljomaih_assessment/src/features/add_order/presentation/logic/add_order_cubit/add_order_state.dart';
import 'package:aljomaih_assessment/src/features/add_order/presentation/logic/products_cubit/products_state.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/data/models/error_model/error_model.dart';
import '../../../../core/common/data/models/order_model/order_model.dart';
import '../../../../core/common/data/models/success_model/success_model.dart';
import '../../../../core/common/domain/entites/product_entity.dart';
import '../../../../core/common/widgets/alert_dialog.dart';
import '../../../../core/common/widgets/button_view.dart';
import '../../../../core/common/widgets/error_view.dart';
import '../../../../core/common/widgets/loading_view.dart';
import '../logic/add_order_cubit/add_order_cubit.dart';
import '../logic/products_cubit/products_cubit.dart';
import 'counter_view.dart';

class ProductsList extends StatefulWidget {
  final String selectedData;
  final ClientModel clientModel;

  const ProductsList({
    Key? key,
    required this.selectedData,
    required this.clientModel,
  }) : super(key: key);

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  List<int> itemCounts = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return state.when(
          successFetchingData: (List<ProductEntity>? productsList) {
            return Column(
              children: [
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: productsList?.length ?? 0,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CardView(
                            elevation: 1,
                            child: Row(
                              children: [
                                SizedBox(
                                    width: 100,
                                    child: Image.network(
                                        productsList?[index].avatar ?? '')),
                                const SizedBox(
                                  width: 8,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 18.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: '${productsList?[index].name}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3!
                                            .copyWith(
                                                fontWeight: FontWeight.bold),
                                      ),
                                      CounterView(
                                        initialValue:
                                            productsList?[index].count ?? 0,
                                        onValueChnage: (int value) {
                                          setState(() {
                                            productsList?[index].count = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )),
                      );
                    }),

                BlocConsumer<AddOrderCubit,AddOrderState>(builder: (context,state)=> state.maybeWhen(orElse: (){
                    return addOrderButton(productsList ?? []);
                  },loading: (){
                    return LoadingView();
                  }), listener: (context,state){
                  state.maybeWhen(orElse: (){},
                  successAdded: (SuccessModel successModel){
                  },error: (ErrorModel errorModel){
                        showDialog(
                            context: context,
                            barrierColor: Colors.black.withOpacity(0.6),
                            builder: (_) {
                              return AlertDialogView(
                                content: errorModel.error?.message ?? 'Error while adding order',
                              );
                            });
                      }
                  );
                })
              ],
            );
          },
          initial: () => const Padding(
            padding: EdgeInsets.all(8.0),
            child: SizedBox(),
          ),
          loading: () => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: LoadingView(
                loadingSize: 40,
              ),
            ),
          ),
          error: (ErrorModel? errorModel) => ErrorView(
            error: errorModel?.error?.message ?? "",
            onRefresh: () {
              BlocProvider.of<ProductsCubit>(context).tryGetProducts();
            },
          ),
        );
      },
    );
  }


  Widget addOrderButton(List<ProductEntity> productsList){
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 140.0),
        child: SizedBox(
          width: 280,
          height: 65,
          child: ButtonView(
            title: "Add order".tr(),
            buttonType: ButtonType.soldButton,
            onClick: () {
              int ammount = 0;
              for (int i = 0;
              i < (productsList?.length ?? 0);
              i++) {
                ammount += productsList?[i].count ?? 0;
              }
              OrderModel orderModel = OrderModel(
                date: widget.selectedData,
                ammount: ammount,
                clientModel: widget.clientModel,
              );

              BlocProvider.of<AddOrderCubit>(context)
                  .tryAddOrder(orderModel);
            },
          ),
        ),
      ),
    );
  }
}
