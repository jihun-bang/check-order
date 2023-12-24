import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data/remote/datasource/auth_remote_data_source.dart';
import '../../../domain/repositories/auth_repository.dart';
import '../../exception/exception.dart';
import '../models/user/sign_in_request_model.dart';
import '../models/user/user_model.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final AuthDataSource _authDataSource;

  AuthRepositoryImpl(this._authDataSource);

  @override
  Future<Either<ServerFailure, UserModel>> fetchUser(
      {required SignInRequestModel model}) {
    return _authDataSource.fetchUser(model: model);
  }

  @override
  Future<Either<ServerFailure, UserModel>> fetchUserWithEmail(
      {required String email}) {
    return _authDataSource.fetchUserWithEmail(email: email);
  }
}
