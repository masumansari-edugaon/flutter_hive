import 'package:flutter/material.dart';
import 'package:flutter_hive/models/nots_model.dart';
import 'package:flutter_hive/views/screens/splash_screen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'views/screens/home_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(NotsModelAdapter());
  await Hive.openBox<NotesModel>("notes");
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SplashScreen()
    );
  }
}
