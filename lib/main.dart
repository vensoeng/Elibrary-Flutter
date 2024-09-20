import 'package:Elibrary/components/homebody.dart';
import 'package:Elibrary/provider/nav_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      // statusBarIconBrightness: Brightness.dark,
      // systemNavigationBarContrastEnforced: true,
      // systemStatusBarContrastEnforced: true,
      // statusBarColor: Colors.transparent,
      // systemNavigationBarColor: Colors.transparent,
      // statusBarIconBrightness: Brightness.dark,
      // systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  //change name
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PlaylistProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Khmer library',
      // theme: ThemeData(
      //   appBarTheme: const AppBarTheme(
      //     systemOverlayStyle: SystemUiOverlayStyle.light,
      //   ),
      // ),
      home: Mybody(),
    );
  }
}
