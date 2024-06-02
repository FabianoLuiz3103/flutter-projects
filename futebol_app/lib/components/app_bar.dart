import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarra extends StatelessWidget implements PreferredSizeWidget {
  final String titulo;
  const AppBarra({super.key, required this.titulo});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  AppBar build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
        Text(
          titulo.toUpperCase(),
          style: GoogleFonts.permanentMarker(
              fontSize: 15.0,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
              color: const Color.fromARGB(255, 0, 0, 0)),
          textAlign: TextAlign.start,
        ),
        Container(
          width: 52.0,
          height: 52.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.black,
              width: 4.0,
            ),
          ),
          child: const CircleAvatar(
            radius: 24.0, 
            backgroundImage: AssetImage('images/pessoa.png'),
          ),
        ),
        
                  ],
                ),
                automaticallyImplyLeading: false
      );
  }
  
}