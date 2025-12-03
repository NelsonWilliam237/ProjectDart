import 'package:flutter/material.dart';

// mêmes couleurs que le reste de l'app
const kPrimaryBlue = Color(0xFF1B2B7A);
const kSoftMint = Color(0xFFEAF8F4);

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSoftMint,
      body: Column(
        children: [
          // ===================== HEADER BLEU =====================
          SafeArea(
            bottom: false,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: const BoxDecoration(
                color: kPrimaryBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // ← BOUTON RETOUR FONCTIONNEL
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),

                  const Text(
                    "Profil",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Icon(Icons.settings_outlined, color: Colors.white),
                ],
              ),
            ),
          ),

          // ===================== CONTENU BLANC SCROLLABLE =====================
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),

              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Avatar
                    TweenAnimationBuilder<double>(
                      duration: const Duration(milliseconds: 500),
                      tween: Tween(begin: 0, end: 1),
                      builder: (context, val, child) => Opacity(
                        opacity: val,
                        child: Transform.translate(
                          offset: Offset(0, 20 * (1 - val)),
                          child: child,
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundColor: kSoftMint,
                        child: Icon(Icons.person, size: 40, color: kPrimaryBlue),
                      ),
                    ),
                    const SizedBox(height: 12),

                    const Text(
                      'Fatou Diane',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4),

                    Text(
                      'fatou.diane@example.com',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 8),

                    // ===================== LISTE OPTIONS =====================
                    const _ProfileOption(
                      icon: Icons.person_outline,
                      title: 'Modifier le profil',
                      subtitle: 'Nom, photo, informations personnelles',
                    ),
                    const _ProfileOption(
                      icon: Icons.lock_outline,
                      title: 'Sécurité',
                      subtitle: 'Mot de passe, validation, confidentialité',
                    ),
                    const _ProfileOption(
                      icon: Icons.notifications_none,
                      title: 'Notifications',
                      subtitle: 'Alertes de dépenses et rappels',
                    ),
                    const _ProfileOption(
                      icon: Icons.wallet_outlined,
                      title: 'Moyens de paiement',
                      subtitle: 'Cartes et comptes bancaires',
                    ),
                    const _ProfileOption(
                      icon: Icons.help_outline,
                      title: 'Aide & support',
                      subtitle: 'FAQ et assistance',
                    ),

                    const SizedBox(height: 24),

                    // ===================== BOUTON LOGOUT =====================
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xFFFF3B30)),
                          foregroundColor: const Color(0xFFFF3B30),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        icon: const Icon(Icons.logout),
                        label: const Text(
                          'Déconnexion',
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
//   WIDGET OPTION (Modifier profil, Sécurité, etc.)
// =====================================================
class _ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _ProfileOption({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 400),
      tween: Tween(begin: 0, end: 1),
      builder: (context, val, child) => Opacity(
        opacity: val,
        child: Transform.translate(
          offset: Offset(0, 15 * (1 - val)),
          child: child,
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 4),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: kSoftMint,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: kPrimaryBlue),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade600,
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
