// lib/home_page.dart
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String greeting() {
  final hour = DateTime.now().hour;
  if (hour < 12) {
    return "Bonjour";
  } else if (hour < 18) {
    return "Bonne après-midi";
  } else {
    return "Bonsoir";
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final Color backgroundBlue = const Color(0xFF1730A2); // bleu foncé
  final Color panelMint = const Color(0xFFEFFCF5); // fond mint clair
  final Color accentGreen = const Color(0xFF00B04B); // montant positif
  final Color accentRed = const Color(0xFFFF3B30); // montant négatif
  final Color softLine = const Color(0xFF00C48B); // ligne verte claire

  String money(double v) {
    final f = NumberFormat.currency(locale: 'en_US', symbol: '\$');
    return f.format(v);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: panelMint,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            return Stack(
              children: [
                // Main column
                SingleChildScrollView(
                  child: Column(
                    children: [
                      // Top rounded blue header
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.fromLTRB(20, 18, 20, 24),
                        decoration: BoxDecoration(
                          color: backgroundBlue,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(28),
                            bottomRight: Radius.circular(28),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // top row (time + maybe right icon)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(width: 1), // left spacer
                                // right icon (bell)
                                Icon(
                                  Icons.notifications_none,
                                  color: Colors.white70,
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '${greeting()}, Fatou 👋',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),

                            const SizedBox(height: 14),

                            // Total du compte card (mint rounded rectangle)
                            Center(
                              child: Container(
                                width: w * 0.78,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: panelMint,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      'Total Du Compte',
                                      style: TextStyle(
                                        color: Colors.grey[700],
                                        fontSize: 13,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      money(7783.00),
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            const SizedBox(height: 18),

                            // Two columns: total du compte / total dépense
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Total Du Compte',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      money(7783.00),
                                      style: TextStyle(
                                        color: accentGreen,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 1,
                                  height: 36,
                                  color: Colors.white24,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    const Text(
                                      'Total Dépense',
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 12,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      '-${money(1187.40)}',
                                      style: TextStyle(
                                        color: accentRed,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Inner curved white container (rounded with insets)
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 12),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(26),
                        ),
                        child: Column(
                          children: [
                            // Top rounded blue card inside white area
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: backgroundBlue,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Row(
                                children: [
                                  // left circle area
                                  Container(
                                    width: 66,
                                    height: 66,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.savings,
                                        color: Color(0xFF00C48B),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  // right texts
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Revenu section
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Revenu de la semaine dernière',
                                                    style: TextStyle(
                                                      color: Colors.white70,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 6),
                                                  Text(
                                                    money(4000),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // small vertical divider
                                            Container(width: 10),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        // alimentation negative
                                        Row(
                                          children: [
                                            const Text(
                                              'Alimentation la semaine dernière',
                                              style: TextStyle(
                                                color: Colors.white70,
                                                fontSize: 12,
                                              ),
                                            ),
                                            const Spacer(),
                                            Text(
                                              '-${money(100)}',
                                              style: TextStyle(
                                                color: accentRed,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 18),

                            // thin green line
                            Container(height: 2, color: softLine),

                            const SizedBox(height: 14),

                            // "Ce mois" header
                            Row(
                              children: const [
                                Text(
                                  'Ce mois',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 14),

                            // List of items (Salary, Course, Loyer)
                            Column(
                              children: [
                                _TransactionRow(
                                  icon: Icons.account_balance_wallet,
                                  title: 'Salaire',
                                  subtitle: '18:27 - Avril 30',
                                  category: 'Mois',
                                  amount: money(4000),
                                  amountPositive: true,
                                ),
                                const SizedBox(height: 12),
                                _TransactionRow(
                                  icon: Icons.restaurant,
                                  title: 'Course',
                                  subtitle: '17:00 - Avril 24',
                                  category: 'Alimentation',
                                  amount: '-${money(100)}',
                                  amountPositive: false,
                                ),
                                const SizedBox(height: 12),
                                _TransactionRow(
                                  icon: Icons.home,
                                  title: 'Loyer',
                                  subtitle: '8:30 - Avril 15',
                                  category: 'Loyer',
                                  amount: '-${money(674.40)}',
                                  amountPositive: false,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),

                // Optional: tiny preview of the uploaded screenshot in top-left corner (for reference)
                Positioned(
                  right: 18,
                  top: 8,
                  child: GestureDetector(
                    onTap: () {
                      // no action: preview only
                    },
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white24),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: _buildLocalPreviewImage(),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildLocalPreviewImage() {
    final path = '/mnt/data/Capture.png'; // chemin local fourni
    try {
      final f = File(path);
      if (!f.existsSync()) {
        return Container(
          color: Colors.grey.shade200,
          child: const Center(child: Icon(Icons.image_not_supported)),
        );
      }
      return Image.file(f, fit: BoxFit.cover);
    } catch (e) {
      return Container(
        color: Colors.grey.shade200,
        child: const Center(child: Icon(Icons.broken_image)),
      );
    }
  }
}

class _TransactionRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String category;
  final String amount;
  final bool amountPositive;

  const _TransactionRow({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.category,
    required this.amount,
    required this.amountPositive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color accentGreen = const Color(0xFF00B04B);
    final Color accentRed = const Color(0xFFFF3B30);

    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, size: 30, color: const Color(0xFF0061C8)),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 4),
              Text(subtitle, style: TextStyle(color: Colors.grey[600])),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(category, style: TextStyle(color: Colors.grey[700])),
            const SizedBox(height: 4),
            Text(
              amount,
              style: TextStyle(
                color: amountPositive ? accentGreen : accentRed,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
