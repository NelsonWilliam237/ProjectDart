import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Aide / Support"),
        backgroundColor: const Color(0xFF1B2B7A),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "Comment utiliser l'application ?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "• Accueil : Voir le résumé de vos finances\n"
              "• Catégories : Voir vos types de dépenses\n"
              "• Transactions : Ajouter / consulter les dépenses\n"
              "• Analyse : Graphiques et statistiques\n"
              "• Notifications : Rappels automatiques\n\n"
              "Si vous avez besoin d'aide supplémentaire, contactez votre équipe.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
