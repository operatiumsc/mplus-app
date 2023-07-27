import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.isVisible = false});

  const AppLogo.full({super.key, this.isVisible = true});

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Visibility(
        //   visible: isVisible,
        //   child: Text(
        //     'Borneo',
        //     style: GoogleFonts.inter(fontSize: 16),
        //   ),
        // ),
        CircleAvatar(
          backgroundColor: Colors.amber,
          child: Text(
            'M',
            style: GoogleFonts.inter(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        Visibility(
          visible: isVisible,
          child: Text(
            'plus',
            style: GoogleFonts.inter(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
