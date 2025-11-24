import 'package:flutter/material.dart';
import 'main.dart';

// Couleurs de ton app
const kPrimaryBlue = Color(0xFF1B2B7A);
const kSoftMint = Color(0xFFEAF8F4);

InputDecoration _inputDecoration(String label, IconData icon) {
  return InputDecoration(
    labelText: label,
    prefixIcon: Icon(icon, color: kPrimaryBlue),
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: kPrimaryBlue, width: 1.6),
    ),
  );
}

// =========================
// PAGE LOGIN
// =========================
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Dégradé bleu → mint (comme ton app)
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kPrimaryBlue, Color(0xFF2345A0), kSoftMint],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isWide = constraints.maxWidth > 650;
                  return Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.96),
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.12),
                          blurRadius: 28,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: isWide
                        ? Row(
                            children: [
                              // Illustration à gauche
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        'Gestion Budget',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: kPrimaryBlue,
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      const Text(
                                        "Suivez vos dépenses, analysez vos revenus\net gardez le contrôle sur votre budget.",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.black54,
                                          height: 1.4,
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(24),
                                        child: AspectRatio(
                                          aspectRatio: 4 / 3,
                                          // 🔁 ICI : illustration en code (plus d'Image.asset)
                                          child: const _BudgetIllustration(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(width: 24),
                              // Formulaire à droite
                              SizedBox(
                                width: 360,
                                child: const _LoginForm(),
                              ),
                            ],
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Gestion Budget',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryBlue,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                "Connecte-toi pour gérer ton budget\net suivre tes transactions.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black54,
                                  height: 1.4,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(24),
                                child: AspectRatio(
                                  aspectRatio: 4 / 3,
                                  // 🔁 ICI AUSSI : même illustration en code
                                  child: const _BudgetIllustration(),
                                ),
                              ),
                              const SizedBox(height: 24),
                              const _LoginForm(),
                            ],
                          ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Illustration “budget” dessinée en code (pas d’asset, pas d’image)
class _BudgetIllustration extends StatelessWidget {
  const _BudgetIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1B2B7A), Color(0xFF2345A0), Color(0xFF3FB8AC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Cercle flou au centre
          Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.08),
              shape: BoxShape.circle,
            ),
          ),
          // Rond en haut
          Positioned(
            top: 30,
            left: 40,
            child: _circleIcon(
              icon: Icons.savings,
              color: Colors.greenAccent,
            ),
          ),
          // Rond à droite
          Positioned(
            right: 40,
            bottom: 40,
            child: _circleIcon(
              icon: Icons.pie_chart,
              color: Colors.orangeAccent,
            ),
          ),
          // Carte “balance” au centre
          Positioned(
            child: Container(
              width: 190,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.96),
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Solde actuel",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "\$7 783.00",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryBlue,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.arrow_upward,
                          size: 16, color: Colors.green),
                      SizedBox(width: 4),
                      Text(
                        "+ 12% ce mois",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _circleIcon({required IconData icon, required Color color}) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white24),
      ),
      child: Icon(icon, color: color, size: 26),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Welcome Back 👋",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          "Connecte-toi pour accéder à ton tableau de bord.",
          style: TextStyle(color: Colors.black54),
        ),
        const SizedBox(height: 24),

        // Email
        TextField(
          decoration: _inputDecoration('Email', Icons.email_outlined),
        ),
        const SizedBox(height: 14),

        // Password
        TextField(
          obscureText: true,
          decoration: _inputDecoration('Password', Icons.lock_outline),
        ),
        const SizedBox(height: 10),

        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Mot de passe oublié ?',
              style: TextStyle(color: kPrimaryBlue),
            ),
          ),
        ),
        const SizedBox(height: 8),

        // LOGIN BUTTON
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // On garde la possibilité de revenir avec le bouton "back"
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MainNavigation(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
            child: const Text(
              'Login',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),

        const SizedBox(height: 16),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Pas encore de compte ?"),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterPage()),
                );
              },
              child: const Text(
                'Créer un compte',
                style: TextStyle(color: kPrimaryBlue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

// =========================
// PAGE REGISTER
// =========================
class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kPrimaryBlue, Color(0xFF2345A0), kSoftMint],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.97),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.12),
                      blurRadius: 28,
                      offset: const Offset(0, 12),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "Inscris-toi pour commencer à gérer ton budget.",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black54),
                    ),
                    const SizedBox(height: 24),

                    TextField(
                      decoration:
                          _inputDecoration('Email', Icons.email_outlined),
                    ),
                    const SizedBox(height: 14),

                    TextField(
                      decoration: _inputDecoration(
                          'Username', Icons.person_outline),
                    ),
                    const SizedBox(height: 14),

                    TextField(
                      obscureText: true,
                      decoration:
                          _inputDecoration('Password', Icons.lock_outline),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // retour au login
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryBlue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Déjà un compte ? Se connecter',
                        style: TextStyle(color: kPrimaryBlue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
