import 'package:aljomaih_assessment/src/core/common/data/models/success_model/success_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/common/data/models/error_model/error_model.dart';
import '../use_cases/login_use_case.dart';

abstract class LoginRepository {
  Future<Either<ErrorModel, SuccessModel>> login(
    Params? params,
  );
}
