import 'package:infoodmacion_app/infraestructure/datasources/food_datasource_impl.dart';
import 'package:infoodmacion_app/infraestructure/repositories/food_repositiroy_impl.dart';

final foodRepositoryProvider = FoodRepositiroyImpl(datasource: FoodDatasourceImpl());