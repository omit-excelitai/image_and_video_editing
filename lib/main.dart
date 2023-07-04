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


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_painter/image_painter.dart';
// import 'package:path_provider/path_provider.dart';
//
// void main() => runApp(ExampleApp());
//
// class ExampleApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Image Painter Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: ImagePainterExample(),
//     );
//   }
// }

// class ImagePainterExample extends StatefulWidget {
//   @override
//   _ImagePainterExampleState createState() => _ImagePainterExampleState();
// }
//
// class _ImagePainterExampleState extends State<ImagePainterExample> {
//   final _imageKey = GlobalKey<ImagePainterState>();
//   final _key = GlobalKey<ScaffoldState>();
//
//   void saveImage() async {
//     final image = await _imageKey.currentState?.exportImage();
//     final directory = (await getApplicationDocumentsDirectory()).path;
//     await Directory('$directory/sample').create(recursive: true);
//     final fullPath =
//         '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.png';
//     final imgFile = File('$fullPath');
//     imgFile.writeAsBytesSync(image!.toList()); // Convert Uint8List? to List<int>
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         backgroundColor: Colors.grey[700],
//         padding: const EdgeInsets.only(left: 10),
//         content: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text(
//               "Image Exported successfully.",
//               style: TextStyle(color: Colors.white),
//             ),
//             TextButton(
//               onPressed: () => Process.run('open', [fullPath]),
//               child: Text(
//                 "Open",
//                 style: TextStyle(
//                   color: Colors.blue[200],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _key,
//       appBar: AppBar(
//         title: const Text("Image Painter Example"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.save_alt),
//             onPressed: saveImage,
//           )
//         ],
//       ),
//       body:
//       ImagePainter.asset(
//         "assets/images/1.png",
//         key: _imageKey,
//         scalable: true,
//         initialStrokeWidth: 2,
//         //textDelegate: DutchTextDelegate(),
//         initialColor: Colors.green,
//         initialPaintMode: PaintMode.line,
//       ),
//     );
//   }
// }



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

