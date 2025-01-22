import 'package:infoodmacion_app/domain/entities/trainer.dart';

abstract class TrainerDatasource {
  Future<List<Trainer>> getTrainers();
}