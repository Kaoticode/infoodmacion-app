import 'package:infoodmacion_app/api_services.dart';
import 'package:infoodmacion_app/domain/datasources/trainer_datasource.dart';
import 'package:infoodmacion_app/domain/entities/trainer.dart';
import 'package:infoodmacion_app/infraestructure/mappers/trainer_mapper.dart';
import 'package:infoodmacion_app/infraestructure/models/trainer_model.dart';

class TrainerDatasourceImpl implements TrainerDatasource {
  @override
  Future<List<Trainer>> getTrainers() async {
    final trainers = entrenadores.map((trainer) => TrainerModel.fromJson(trainer)).toList();
    return trainers.map((trainerModel) => TrainerMapper.trainerModelToEntity(trainerModel)).toList();
  }
  
  @override
  Future<List<Trainer>> getTrainersByName(String name) async {
    final trainers = entrenadores.where((trainer) => trainer['nombre'].toString().toLowerCase().contains(name.toLowerCase()))
      .map((trainer) => TrainerModel.fromJson(trainer)).toList();
    return trainers.map((trainerModel) => TrainerMapper.trainerModelToEntity(trainerModel)).toList();
  }
}