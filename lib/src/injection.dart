import 'package:aljomaih_assessment/src/core/utils/managers/sql_database_manager/db_services.dart';
import 'package:aljomaih_assessment/src/features/add_order/domain/use_cases/add_order.dart';
import 'package:aljomaih_assessment/src/features/add_order/domain/use_cases/get_clients.dart';
import 'package:aljomaih_assessment/src/features/add_order/presentation/logic/add_order_cubit/add_order_cubit.dart';
import 'package:aljomaih_assessment/src/features/add_order/presentation/logic/clients_cubit/clients_cubit.dart';
import 'package:aljomaih_assessment/src/features/add_order/presentation/logic/products_cubit/products_cubit.dart';
import 'package:aljomaih_assessment/src/features/orders_list/domain/repository/orders_repository.dart';
import 'package:aljomaih_assessment/src/features/orders_list/domain/use_cases/get_orders.dart';
import 'package:aljomaih_assessment/src/features/orders_list/presentation/logic/orders_cubit/orders_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';


import 'app/logic/app_bloc.dart';
import 'app/logic/app_settings.dart';
import 'app/routes/router.gr.dart';
import 'core/utils/managers/database/database_manager.dart';
import 'core/utils/managers/http/check_endpoint_reachability.dart';
import 'core/utils/managers/http/domain_lookup.dart';
import 'core/utils/managers/http/http_manager.dart';
import 'features/add_order/data/remote_data_source/add_orders_data_source.dart';
import 'features/add_order/data/repository/clients_repository.dart';
import 'features/add_order/domain/repository/clients_repository.dart';
import 'features/add_order/domain/use_cases/get_products.dart';
import 'features/login/data/data_source/remote_data_source/login_data_source.dart';
import 'features/login/data/repository/login_repository_impl.dart';
import 'features/login/domain/repository/login_repository.dart';
import 'features/login/domain/use_cases/login_use_case.dart';
import 'features/login/presentation/logic/login_cubit.dart';
import 'features/orders_list/data/data_source/remote_data_source/orders_remote_data_source.dart';
import 'features/orders_list/data/repository/orders_repository.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  initInjections(serviceLocator);
  serviceLocator.allowReassignment = true;
}

void initInjections(GetIt serviceLocator) {
  //! Utls
  serviceLocator.registerLazySingleton<DomainLookup>(
    () => DomainLookupImpl(),
  );


  serviceLocator.registerLazySingleton<AppSettings>(
    () => AppSettings(databaseManager: serviceLocator()),
  );


  //! App

  //* Logic
  serviceLocator.registerLazySingleton<AppBloc>(
    () => AppBloc(domainLookup: serviceLocator()),
  );

  //* Router
  serviceLocator.registerLazySingleton<AppRouter>(
    () => AppRouter(),
  );

  //! core

  //* Database
  serviceLocator.registerLazySingleton<DatabaseManager>(
    () => DatabaseManagerImpl(),
  );


  //* Network
  serviceLocator.registerLazySingleton<BaseOptions>(
    () => BaseOptions(
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        "charset": "utf-8",
        "Accept-Charset": "utf-8",
      },
      responseType: ResponseType.plain,
    ),
  );

  serviceLocator.registerLazySingleton<HttpManager>(
    () => HttpManagerImpl(
      baseOptions: serviceLocator(),
      databaseManager: serviceLocator(),

    ),
  );

  serviceLocator.registerLazySingleton<CheckEndpointReachability>(
        () => CheckEndpointReachabilityImpl(),
  );

  ///login feature

  serviceLocator.registerFactory<LoginDataSource>(
        () => LoginDataSourceImpl(
      httpManager: serviceLocator(),
    ),
  );

  //* repositories

  serviceLocator.registerFactory<LoginRepository>(
        () => LoginRepositoryImpl(
      loginDataSource: serviceLocator(),
    ),
  );

  //* use cases

  serviceLocator.registerFactory<Login>(
        () => Login(
      repository: serviceLocator(),
    ),
  );

  //* bloc/cubit

  serviceLocator.registerFactory<LoginCubit>(
        () => LoginCubit(
      login: serviceLocator(),
    ),
  );



  ///orders feature

  serviceLocator.registerFactory<OrdersRemoteDataSource>(
        () => OrdersRemoteDataSourceImpl(
      httpManager: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<DBService>(
        () => DBService(

    ),
  );

  //* repositories

  serviceLocator.registerFactory<OrdersRepository>(
        () => OrdersRepositoryImpl(
      dataSource: serviceLocator(),
      dbServices: serviceLocator(),
      domainLookup: serviceLocator(),
    ),
  );

  //* use cases

  serviceLocator.registerFactory<GetOrders>(
        () => GetOrders(
      repository: serviceLocator(),
    ),
  );

  //* bloc/cubit

  serviceLocator.registerFactory<OrdersCubit>(
        () => OrdersCubit(
      getOrders: serviceLocator(),
    ),
  );





  ///add orders feature

  serviceLocator.registerFactory<AddOrdersDataSource>(
        () => AddOrdersDataSourceImpl(
      httpManager: serviceLocator(),
    ),
  );

  //* repositories

  serviceLocator.registerFactory<AddProductsRepository>(
        () => AddProductsRepositoryImpl(
      dataSource: serviceLocator(),
    ),
  );

  //* use cases

  serviceLocator.registerFactory<GetClients>(
        () => GetClients(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<GetProducts>(
        () => GetProducts(
      repository: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<AddOrder>(
        () => AddOrder(
      repository: serviceLocator(),
    ),
  );

  //* bloc/cubit

  serviceLocator.registerFactory<ClientsCubit>(
        () => ClientsCubit(
      getClients: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<ProductsCubit>(
        () => ProductsCubit(
      getProducts: serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<AddOrderCubit>(
        () => AddOrderCubit(
      addOrder: serviceLocator(),
    ),
  );




}
