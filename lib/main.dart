import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_app/controllers/main_prov.dart';
import 'package:music_app/controllers/navigation_prov.dart';
import 'package:music_app/views/navigation/main_nav_bar.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NavigationProv(),
        ),
        ChangeNotifierProvider(
          create: (context) => MainProv(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFF212A32),
          appBarTheme: const AppBarTheme(color: Colors.transparent),
          iconTheme: const IconThemeData(color: Color(0xFFFFFFFF)),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
                fontFamily: 'Poppins', fontSize: 18, color: Color(0xFFFFFFFF)),
            bodyMedium: TextStyle(
                fontFamily: 'Poppins', fontSize: 16, color: Color(0xFFFFFFFF)),
            bodySmall: TextStyle(
                fontFamily: 'Poppins Light',
                fontSize: 13,
                color: Color(0xFFFFFFFF)),
            labelSmall: TextStyle(
                fontFamily: 'Lato Regular',
                fontSize: 16,
                color: Color(0xFFFFFFFF)),
            labelMedium: TextStyle(
                fontFamily: 'Lato Bold',
                fontSize: 13,
                color: Color(0xFFFFFFFF)),
          ),
        ),
        home: const BottomNavBar(),
      ),
    );
  }
}
