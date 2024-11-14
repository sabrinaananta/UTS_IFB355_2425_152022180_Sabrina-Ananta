import 'package:flutter/material.dart';
import 'package:jamparing_aplikasi/screens/signin_screen.dart';
import 'package:jamparing_aplikasi/screens/signup_screen.dart';
import 'package:jamparing_aplikasi/theme/theme.dart';
import 'package:jamparing_aplikasi/widgets/custom_scaffold.dart';
import 'package:jamparing_aplikasi/widgets/welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const Spacer(flex: 6), 
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  // Tombol Sign in dengan teks berwarna hitam dan ukuran font kecil
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign in',
                      onTap: () {
                        Navigator.of(context).push(_transitionAnimation(context, const SignInScreen()));
                      },
                      color: Colors.transparent,
                      textColor: Colors.black,
                      textStyle: const TextStyle(fontSize: 14.0), // Mengatur ukuran font lebih kecil
                    ),
                  ),
                  // Tombol Sign up dengan latar coklat tua, teks putih, dan ukuran font kecil
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign up',
                      onTap: () {
                        Navigator.of(context).push(_transitionAnimation(context, const SignUpScreen()));
                      },
                      color: Colors.brown[800]!,
                      textColor: Colors.white,
                      textStyle: const TextStyle(fontSize: 14.0), // Mengatur ukuran font lebih kecil
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi untuk membuat animasi transisi
  Route _transitionAnimation(BuildContext context, Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0); // Animasi dari kanan ke kiri
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }
}
