import 'package:infoodmacion_app/infraestructure/datasources/food_datasource_impl.dart';
import 'package:infoodmacion_app/infraestructure/datasources/trainer_datasource_impl.dart';
import 'package:infoodmacion_app/infraestructure/repositories/food_repository_impl.dart';
import 'package:infoodmacion_app/infraestructure/repositories/trainer_repository_impl.dart';

final foodRepositoryProvider = FoodRepositiroyImpl(datasource: FoodDatasourceImpl());
final trainerRepositoryProvider = TrainerRepositoryImpl(datasource: TrainerDatasourceImpl());