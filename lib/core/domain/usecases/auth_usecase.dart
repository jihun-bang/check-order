import 'package:injectable/injectable.dart';

import '../../data/local/datasource/auth_storage.dart';
import '../../data/remote/models/user/sign_in_request_model.dart';
import '../../data/remote/models/user/user_model.dart';
import '../repositories/auth_repository.dart';

@injectable
class AuthUseCase {
  final AuthRepository _repository;
  final AuthStorage _storage;

  const AuthUseCase(this._repository, this._storage);

  Future<UserModel> signInRecoveryAttempt() async {
    final savedEmail = _storage.userEmail;
    if (savedEmail != null) {
      return _signInWithEmail(savedEmail);
    } else {
      _storage.reset().ignore();
      return const UserModel.signedOut();
    }
  }

  Future<UserModel> logout() async {
    await _storage.reset();
    return const UserModel.signedOut();
  }

  Future<UserModel> signIn(SignInRequestModel model) async {
    return await _repository.fetchUser(model: model).then(
          (value) => value.fold(
            (l) {
              _storage.reset().ignore();
              return UserModel.signedOut(l.message);
            },
            (r) {
              _storage.saveUser(r as SignedIn);
              return r;
            },
          ),
        );
  }

  Future<UserModel> _signInWithEmail(String savedEmail) async {
    final user = await _repository.fetchUserWithEmail(email: savedEmail).then(
          (value) => value.fold(
            (l) {
              _storage.reset().ignore();
              return UserModel.signedOut(l.message);
            },
            (r) {
              _storage.saveUser(r as SignedIn);
              return r;
            },
          ),
        );
    return user;
  }
}
