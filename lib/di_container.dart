import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:image_and_video_editing/controller/home_screen_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/add_project_screen_controller.dart';
import 'controller/bottom_navbar_controller.dart';
import 'controller/edit_screen_controller.dart';
import 'controller/video_editing_controller.dart';
import 'controller/view_screen_controller.dart';
import 'data/datasource/remote/dio/logging_interceptor.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Core
  //sl.registerLazySingleton(() => DioClient(AppConstants.baseUri, sl(), loggingInterceptor: sl(), sharedPreferences: sl()));

  ///Repository
 // sl.registerLazySingleton(() => AuthRepo(dioClient: sl(), sharedPreferences: sl()));

  /// Controller
  //Get.lazyPut(() => SplashController(), fenix: true);
  Get.lazyPut(() => HomeScreenController(), fenix: true);
  Get.lazyPut(() => BottomNavController(), fenix: true);
  Get.lazyPut(() => AddProjectScreenController(), fenix: true);
  Get.lazyPut(() => ViewScreenController(), fenix: true);
  Get.lazyPut(() => EditScreenController(), fenix: true);
  Get.lazyPut(() => VideoEditingController(), fenix: true);


  /// External pocket lock
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
