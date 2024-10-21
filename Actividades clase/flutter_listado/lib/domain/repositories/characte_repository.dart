import 'package:dartz/dartz.dart';
import 'package:flutter_listado/domain/entities/character.dart';

abstract class CharacterRepository {
  Future<Either<Exception, List<Character>>> getAllCharacters();
}
