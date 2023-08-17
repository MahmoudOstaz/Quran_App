import 'package:flutter/material.dart';
import 'package:holy_quran/core/constants/gloabals.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:holy_quran/view/screens/home.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Holy Quran App",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Learn Quran and \n Recite once everyday",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: text,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 48),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                          height: 450,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xff672CBC)),
                          child:
                              SvgPicture.asset("assets/svgs/splash-quran.svg")),
                      Positioned(
                        left: 0,
                        bottom: -23,
                        right: 0,
                        child: Center(
                          child: GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Home()));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 16),
                              decoration: BoxDecoration(
                                  color: orange,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Text(
                                "Get Started",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
