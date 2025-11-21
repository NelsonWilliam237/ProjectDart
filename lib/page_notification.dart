import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF7EB),

      // -------------------------- APPBAR -------------------------
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E3A8A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Notification",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),

      // -------------------------- BODY --------------------------
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hier",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),

            _buildNotificationCard(
              title: "Transactions",
              subtitle: "Une nouvelle transaction a été enregistrée.",
              category: "Épicerie | Garde-Manger",
              amount: "-\$100.00",
              amountColor: Colors.red,
              time: "17:00 - Avril 24",
            ),

            const SizedBox(height: 25),

            const Text(
              "Cette semaine",
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 10),

            _buildNotificationCard(
              title: "Rappel !",
              subtitle: "Terminez la configuration de votre profil.",
              category: "",
              amount: "",
              time: "17:00 - Avril 24",
            ),

            const SizedBox(height: 12),

            _buildNotificationCard(
              title: "Registre Des Dépenses",
              subtitle:
                  "Nous vous recommandons d’être plus attentif à vos finances.",
              category: "",
              amount: "",
              time: "17:00 - Avril 24",
            ),

            const SizedBox(height: 12),

            _buildNotificationCard(
              title: "Transactions",
              subtitle: "Une nouvelle transaction a été enregistrée.",
              category: "Food | Dinner",
              amount: "-\$70.40",
              amountColor: Colors.red,
              time: "17:00 - Avril 24",
            ),
          ],
        ),
      ),
    );
  }

  // -------------------------- CARD WIDGET --------------------------
  Widget _buildNotificationCard({
    required String title,
    required String subtitle,
    required String category,
    required String amount,
    required String time,
    Color amountColor = Colors.black,
  }) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ICON LEFT
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFEAF7EB),
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Icon(Icons.attach_money, color: Colors.green),
          ),
          const SizedBox(width: 12),

          // TEXTS
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.black54, fontSize: 13),
                ),

                if (category.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    category,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],

                if (amount.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text(
                    amount,
                    style: TextStyle(
                      color: amountColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ],
            ),
          ),

          // TIME RIGHT
          Column(
            children: [
              Text(
                time,
                style: const TextStyle(
                  color: Colors.black38,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
