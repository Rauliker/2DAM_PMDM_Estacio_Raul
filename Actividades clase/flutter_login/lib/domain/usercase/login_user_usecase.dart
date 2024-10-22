import 'package:dartz/dartz.dart';
import 'package:flutter_listado/domain/entities/users.dart';
import 'package:flutter_listado/domain/repositories/login_repisitory.dart';

class LoginUser {
  final LoginRepository repository;

  LoginUser(this.repository);

  Future<Either<Exception, User>> call(String email, String password) async {
    return await repository.login(email, password);
  }
}
