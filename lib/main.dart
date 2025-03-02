import 'package:aibuddy/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:aibuddy/features/auth/data/services/auth_service.dart';
import 'package:aibuddy/features/auth/domain/repositories/auth_repository.dart';
import 'package:aibuddy/features/auth/domain/usecases/sign_in_with_google.dart';
import 'package:aibuddy/features/auth/domain/usecases/sign_out_with_google.dart';
import 'package:aibuddy/features/auth/presentation/controllers/auth_controller.dart';
import 'package:aibuddy/features/auth/presentation/controllers/text_field_password_controller.dart';
import 'package:aibuddy/features/auth/presentation/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'firebase_options.dart';

void main() async {
  // await dotenv.load(fileName: '.env');
  // Env.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  // Gemini.init(apiKey: GEMINI_API_KEY);

  final authService = AuthService();
  final authRepository = AuthRepositoryImpl(authService);

  final signInWithGoogle = SignInWithGoogle(authRepository);
  final signOutUseCase = SignOutWithGoogle(authRepository);

  Get.put(TextFieldPasswordController());
  Get.put(AuthController(signInWithGoogle: signInWithGoogle, signOutUseCase: signOutUseCase));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
    );
  }
}
