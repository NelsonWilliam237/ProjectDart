import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF1B2B7A); // adapte avec la vraie couleur Figma
    const lightBg = Color(0xFFEAF8F4); // fond vert très clair

    return Scaffold(
      backgroundColor: blue,
      body: Column(
        children: [
          // ==== HEADER BLEU ====
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Icon(Icons.arrow_back, color: Colors.white),
                  const Spacer(),
                  const Text(
                    'Catégories',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.more_horiz, color: Colors.white),
                ],
              ),
            ),
          ),

          // ==== PARTIE ARRONDIE DU BAS ====
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: lightBg,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 32),

                  // ===== GRID DES 8 ICONES (2 lignes x 4 colonnes) =====
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: GridView.count(
                        crossAxisCount: 4, // 4 colonnes
                        mainAxisSpacing: 28,
                        crossAxisSpacing: 24,
                        childAspectRatio: 0.8, // forme proche du Figma
                        children: const [
                          _CategoryItem(
                            icon: Icons.restaurant,
                            label: 'Nourriture',
                          ),
                          _CategoryItem(
                            icon: Icons.directions_bus,
                            label: 'Transport',
                          ),
                          _CategoryItem(
                            icon: Icons.medical_services,
                            label: 'Médicament',
                          ),
                          _CategoryItem(
                            icon: Icons.local_grocery_store,
                            label: 'Alimentation',
                          ),
                          _CategoryItem(icon: Icons.home, label: 'Loyer'),
                          _CategoryItem(
                            icon: Icons.card_giftcard,
                            label: 'Cadeaux',
                          ),
                          _CategoryItem(icon: Icons.savings, label: 'Épargne'),
                          _CategoryItem(
                            icon: Icons.sports_esports,
                            label: 'Divertissement',
                          ),
                        ],
                      ),
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
}

class _CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CategoryItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, size: 28, color: Colors.blueAccent),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
