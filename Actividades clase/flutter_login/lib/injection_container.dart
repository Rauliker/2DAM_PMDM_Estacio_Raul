import 'package:flutter_listado/data/datasources/character_remote_datasource.dart';
import 'package:flutter_listado/data/repositories/character_repository_impl.dart';
import 'package:flutter_listado/domain/repositories/characte_repository.dart';
import 'package:flutter_listado/domain/usercase/get_all_characters_usecase.dart';
import 'package:flutter_listado/presentations/bloc/characters_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  // BloC
  sl.registerFactory(() => CharacterBloc(sl()));

  // Casos de uso
  sl.registerLazySingleton(() => GetAllCharacters(sl()));

  // Repositorios
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(sl()),
  );

  // Data sources
  sl.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSourceImpl(sl()),
  );

  // Cliente HTTP
  sl.registerLazySingleton(() => http.Client());
}
