import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:novelkaizen_project_lema_unda/src/pages/login_page.dart';
import 'package:novelkaizen_project_lema_unda/src/pages/signup_page.dart';
import 'package:novelkaizen_project_lema_unda/src/theme/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:novelkaizen_project_lema_unda/src/pages/home_page.dart';
import 'package:novelkaizen_project_lema_unda/src/providers/main_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => MainProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context);
    return FutureBuilder<bool>(
        future: mainProvider.initPrefs(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const SizedBox.square(
                dimension: 150.0, child: Text("Ha ocurrido un error!!"));
          }

          if (snapshot.hasData) {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              builder: () => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'NOVEL KAIZEN',
                theme: AppTheme.themeData(mainProvider.mode),
                routes: {
                  "/login": (context) => const LoginPage(),
                  "/signup": (context) => const SignUpPage()
                },
                home: mainProvider.token == ""
                    ? const LoginPage()
                    : JwtDecoder.isExpired(mainProvider.token)
                        ? const LoginPage()
                        : const HomePage(),
              ),
            );
          }

          return const SizedBox.square(
              dimension: 50.0, child: CircularProgressIndicator());
        });
  }
}
