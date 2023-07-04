import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:image_and_video_editing/view/screen/add_project_screen.dart';
import 'package:image_and_video_editing/view/screen/edit_screen.dart';
import 'package:image_and_video_editing/view/screen/bottom_navbar_screen.dart';
import 'package:image_and_video_editing/view/screen/home_screen.dart';
import 'package:image_and_video_editing/view/screen/view_screen.dart';
import 'di_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            //home: VideoEditingScreen(),
            initialRoute: BottomNavBarScreen.routeName,
            getPages: [
              GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),
              GetPage(name: ViewScreen.routeName, page: () => ViewScreen()),
              GetPage(name: EditScreen.routeName, page: () => EditScreen()),
              GetPage(
                  name: AddProjectScreen.routeName,
                  page: () => AddProjectScreen()),
              GetPage(
                  name: BottomNavBarScreen.routeName,
                  page: () => BottomNavBarScreen()),
            ],
          );
        });
  }
}


// import 'package:flutter/material.dart';
// import 'package:image_and_video_editing/view/screen/audio_player_page.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Image with Music',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: ImageWithMusic(),
//     );
//   }
// }

