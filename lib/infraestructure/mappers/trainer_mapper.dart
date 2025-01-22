import 'package:infoodmacion_app/domain/entities/trainer.dart';
import 'package:infoodmacion_app/infraestructure/models/trainer_model.dart';

class TrainerMapper {
  static Trainer trainerModelToEntity(TrainerModel model) => Trainer(
    name: model.name, 
    image: model.image, 
    isLocalImage: model.isLocalImage, 
    ig: model.ig, 
    isPromoted: model.isPromoted
  );
}