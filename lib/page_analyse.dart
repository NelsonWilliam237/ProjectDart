import 'package:flutter/material.dart';

class AnalysePage extends StatelessWidget {
  const AnalysePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2FFE9), // Fond vert très pâle
      body: Column(
        children: [
          _buildHeader(context),
          Expanded(child: SingleChildScrollView(child: _buildContent())),
        ],
      ),
    );
  }

  // ----------------------------
  // HEADER
  // ----------------------------
  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 55, left: 20, right: 20, bottom: 25),
      decoration: const BoxDecoration(
        color: Color(0xFF15227A), // Bleu exact du design
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(Icons.arrow_back, color: Colors.white, size: 26),
          Text(
            "Analyse",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          Icon(Icons.notifications_outlined, color: Colors.white, size: 26),
        ],
      ),
    );
  }

  // ----------------------------
  // CONTENU
  // ----------------------------
  Widget _buildContent() {
    return Column(
      children: [
        const SizedBox(height: 25),
        _buildChartCard(),
        const SizedBox(height: 20),
        _buildTransaction(
          icon: Icons.monetization_on,
          iconColor: Colors.blue,
          title: "Salaire",
          subtitle: "18:27 – Avril 30",
          category: "Mois",
          amount: "+4,000.00",
          amountColor: Color(0xFF11A64A),
        ),
        const Divider(indent: 60, endIndent: 20),
        _buildTransaction(
          icon: Icons.restaurant_menu,
          iconColor: Color(0xFF0059FF),
          title: "Course",
          subtitle: "17:00 – Avril 24",
          category: "Alimentation",
          amount: "-100.00",
          amountColor: Color(0xFFD8322A),
        ),
        const Divider(indent: 60, endIndent: 20),
        _buildTransaction(
          icon: Icons.house,
          iconColor: Color(0xFF0059FF),
          title: "Loyer",
          subtitle: "8:30 – Avril 15",
          category: "Loyer",
          amount: "-674.40",
          amountColor: Color(0xFFD8322A),
        ),
        const SizedBox(height: 50),
      ],
    );
  }

  // ----------------------------
  // CHART CARD
  // ----------------------------
  Widget _buildChartCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Image.asset(
          'lib/assets/chart.png', // 🔥 Mets ton image du graphique ici
          height: 180,
        ),
      ),
    );
  }

  // ----------------------------
  // Ligne d'historique (salaire, course…)
  // ----------------------------
  Widget _buildTransaction({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String category,
    required String amount,
    required Color amountColor,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32, color: iconColor),

          const SizedBox(width: 15),

          // TITRE & DATE
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF1E3BCC),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          // CATÉGORIE
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                category,
                style: const TextStyle(color: Colors.black54, fontSize: 13),
              ),
              const SizedBox(height: 5),
              Text(
                amount,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: amountColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
