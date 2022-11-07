import 'package:aljomaih_assessment/src/core/common/data/models/success_model/success_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/common/data/models/error_model/error_model.dart';
import '../../../../core/utils/helpers/error_parser.dart';
import '../../domain/repository/login_repository.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../data_source/remote_data_source/login_data_source.dart';


class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource loginDataSource;

  LoginRepositoryImpl({
    required this.loginDataSource,
  });

  @override
  Future<Either<ErrorModel, SuccessModel>> login(
    Params? params,
  ) async {
    try {
      final response = await loginDataSource.login(params?.value ?? {});

      // final AuthResponseModel authResponseModel =
      //     AuthResponseModel.fromJson(response);
      //
      // serviceLocator<AppSettings>().token = authResponseModel.data?.token;
      // serviceLocator<AppSettings>()
      //     .setProfilePicture(authResponseModel.data?.doctor?.image ?? '');
      // serviceLocator<AppSettings>().refreshToken =
      //     authResponseModel.data?.refreshToken;
      //
      // AuthEntity authEntity = AuthMapper(authResponseModel).toEntity();
      //
      // // save doctor information
      // serviceLocator<AppSettings>().doctor = authResponseModel.data?.doctor;

      return Right(SuccessModel());
    } on DioError catch (error, stackTrace) {
      return Left(errorParse(error, stackTrace));
    }
  }
}
