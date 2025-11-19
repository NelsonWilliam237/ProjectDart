import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF1B2B7A);      // adapte avec la vraie couleur Figma
    const lightBg = Color(0xFFEAF8F4);   // fond vert très clair

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
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 32),

                  // ===== GRID DES 8 ICONES (2 lignes x 4 colonnes) =====
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: GridView.count(
                        crossAxisCount: 4,                  // 4 colonnes
                        mainAxisSpacing: 28,
                        crossAxisSpacing: 24,
                        childAspectRatio: 0.8,              // forme proche du Figma
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
                          _CategoryItem(
                            icon: Icons.home,
                            label: 'Loyer',
                          ),
                          _CategoryItem(
                            icon: Icons.card_giftcard,
                            label: 'Cadeaux',
                          ),
                          _CategoryItem(
                            icon: Icons.savings,
                            label: 'Épargne',
                          ),
                          _CategoryItem(
                            icon: Icons.sports_esports,
                            label: 'Divertissement',
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ===== BOTTOM NAV STYLE FIGMA =====
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color(0xFFDFF1E7),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          _BottomItem(icon: Icons.home, selected: false),
                          _BottomItem(
                            icon: Icons.notifications_none,
                            selected: false,
                          ),
                          _BottomItem(icon: Icons.bar_chart, selected: false),
                          _BottomItem(icon: Icons.category, selected: true),
                          _BottomItem(
                            icon: Icons.receipt_long,
                            selected: false,
                          ),
                          _BottomItem(
                            icon: Icons.person_outline,
                            selected: false,
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
          child: Icon(
            icon,
            size: 28,
            color: Colors.blueAccent,
          ),
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

class _BottomItem extends StatelessWidget {
  final IconData icon;
  final bool selected;

  const _BottomItem({required this.icon, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 22,
      color: selected ? Colors.blueAccent : Colors.grey,
    );
  }
}
