import 'package:aibuddy/features/auth/binding/auth_binding.dart';
import 'package:aibuddy/features/auth/view/auth_page.dart';
import 'package:aibuddy/features/chat_page/binding/chat_binding.dart';
import 'package:aibuddy/features/chat_page/view/chat_page.dart';
import 'package:aibuddy/features/sign_up/binding/signup_binding.dart';
import 'package:aibuddy/features/sign_up/view/signup_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

enum AppRoute {
  authPage('/'),
  chatPage('/chat-page'),
  signupPage('/signup-page');

  const AppRoute(this.path);
  final String path;

  // Helper to get route name without parameters
  String get name => path.split('?').first;
}

class AppRoutes {
  static List<GetPage> get routes => [
        GetPage(
          name: AppRoute.authPage.path,
          page: () => const AuthPage(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: AppRoute.chatPage.path,
          page: () => const ChatPage(),
          binding: ChatBinding(),
        ),
        GetPage(
          name: AppRoute.signupPage.path,
          page: () => const SignupPage(),
          binding: SignupBinding(),
        ),
      ];
}
