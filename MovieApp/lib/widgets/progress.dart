
import 'package:flutter/material.dart';

class IconCircularProgressIndicator extends StatelessWidget {
  final IconData icon;
  final double size;
  final Color color;
  final Color backgroundColor;

  IconCircularProgressIndicator({
    required this.icon,
    this.size = 50.0,
    this.color = Colors.blue,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularProgressIndicator(
          strokeWidth: 5.0,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
        Icon(
          icon,
          color: backgroundColor,
          size: size * 0.5, // Ajuste o tamanho do ícone conforme necessário
        ),
      ],
    );
  }
}

