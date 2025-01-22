import 'package:infoodmacion_app/domain/datasources/trainer_datasource.dart';
import 'package:infoodmacion_app/domain/entities/trainer.dart';
import 'package:infoodmacion_app/domain/repositories/trainer_repository.dart';

class TrainerRepositoryImpl implements TrainerRepository{
  final TrainerDatasource datasource;

  TrainerRepositoryImpl({required this.datasource});

  @override
  Future<List<Trainer>> getTrainers() => datasource.getTrainers();

}