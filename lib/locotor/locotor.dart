
import 'package:appcent_news_app/ApiClient/NewsApiClient.dart';
import 'package:appcent_news_app/repository/repository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;//.registerLazySingleton(() => BlocRepository());

void setUplocotor(){
  getIt.registerLazySingleton(() => Repository());
  getIt.registerLazySingleton(() =>NewsApiClient());
}