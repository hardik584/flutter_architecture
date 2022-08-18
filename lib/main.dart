import 'package:flutter/material.dart';

import 'di/injector.dart';
import 'features/gallery_view/presentation/gallery_view.dart';

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Flutter Demo', home: GalleryView());
  }
}
