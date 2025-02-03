import 'package:arobaze/colors.dart';
import 'package:arobaze/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: AppColors.transparant,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: AppColors.black,
    systemNavigationBarIconBrightness: Brightness.light
  ));

  //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);  

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        /* textTheme: TextTheme(
          bodySmall: GoogleFonts.cabin(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.gray
          ),
          bodyMedium: GoogleFonts.cabin(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.white
          ),
          bodyLarge: GoogleFonts.cabin(
            fontSize: 45,
            fontWeight: FontWeight.w700,
            color: AppColors.white
          ),
        ) */
       textTheme: const TextTheme(
          bodySmall: TextStyle(
            fontFamily: 'Larsseit',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.gray
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Larsseit',
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: AppColors.white
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Larsseit',
            fontSize: 45,
            fontWeight: FontWeight.w700,
            color: AppColors.white
          ),
        )
      ),
      
      routes: {
        '/': (context) => const HomeScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return PageRouteBuilder(
            settings: settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
            pageBuilder: (_, __, ___) => HomeScreen(),
            transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
          );
        }
        // Unknown route
        return MaterialPageRoute(builder: (_) => HomeScreen());
      },
    );
  }
}
