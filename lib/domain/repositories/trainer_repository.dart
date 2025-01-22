import 'package:infoodmacion_app/domain/entities/trainer.dart';

abstract class TrainerRepository {
  Future<List<Trainer>> getTrainers();
}