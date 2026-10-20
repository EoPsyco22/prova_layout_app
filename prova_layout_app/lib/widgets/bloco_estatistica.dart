
import 'package:flutter/material.dart';

// DESAFIO 7 - Componente da primeira linha
class BlocoEstatistica extends StatelessWidget {
  const BlocoEstatistica({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _CardEstatistica(
          icone: Icons.insert_drive_file,
          valor: '12',
          titulo: 'Docs',
        ),
        _CardEstatistica(
          icone: Icons.remove_red_eye,
          valor: '145',
          titulo: 'Visitas',
        ),
        _CardEstatistica(
          icone: Icons.camera_alt,
          valor: '45',
          titulo: 'Fotos',
        ),
      ],
    );
  }
}

// Widget reutilizável para cada card
class _CardEstatistica extends StatelessWidget {
  final IconData icone;
  final String valor;
  final String titulo;

  const _CardEstatistica({
    required this.icone,
    required this.valor,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(
          horizontal: 4,
        ),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(
              icone,
              color: Colors.blue,
            ),
            Text(
              valor,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(titulo),
          ],
        ),
      ),
    );
  }
}

