import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Image.asset(
              'assets/splash.jpeg',
              fit: BoxFit.cover,
              width: size.width,
              height: size.height,
            ),
            const _TitelAndSubtitle(),
            const _Btn(),
          ],
        ),
      ),
    );
  }
}

class _TitelAndSubtitle extends StatelessWidget {
  const _TitelAndSubtitle(
  );


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: size.height * 0.1),
      width: size.width,
      height: size.height * 0.2,
      child: BounceInDown(
        duration: const Duration(milliseconds: 1000),
        child: Column(
          children: [
            Text(
              'Cocktails',
              style: GoogleFonts.outfit(
                fontSize: 50,
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'The best way to find\n amazing cocktail recipes',
              style: GoogleFonts.outfit(
                fontSize: 30,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _Btn extends StatelessWidget {
  const _Btn();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
          margin: EdgeInsets.only(top: size.height * 0.8),
          height: 60,
          width: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 249, 211, 87),
                  Color.fromARGB(255, 230, 179, 70),
                  Color.fromARGB(255, 221, 137, 41),
                ]),
          ),
          child: TextButton(
            onPressed: () {
              context.go('/home');
            },
            child: Text(
              'Let\'s Explore!',
              style: GoogleFonts.outfit(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
