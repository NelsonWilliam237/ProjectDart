import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const blue = Color(0xFF1B2B7A);
    const lightBg = Color(0xFFEAF8F4);

    final avril = [
      _TransactionData('Salaire', '20 avr - 20 avr', '+ 4 000,00', true),
      _TransactionData('Alimentation', '12 avr - 13 avr', '- 180,00', false),
      _TransactionData('Loyer', '01 avr - 01 avr', '- 1 000,00', false),
      _TransactionData('Transport', '05 avr - 06 avr', '- 34,15', false),
    ];

    final mars = [
      _TransactionData('Nourriture', '15 mar - 15 mar', '- 90,00', false),
      _TransactionData('Loyer', '01 mar - 01 mar', '- 1 000,00', false),
      _TransactionData('Transport', '02 mar - 03 mar', '- 24,13', false),
    ];

    return Scaffold(
      backgroundColor: blue,
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Icon(Icons.arrow_back, color: Colors.white),
                  const Spacer(),
                  const Text(
                    'Transaction',
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF243986),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _TopAmount(
                    label: 'Total des revenus',
                    amount: '\$8970,4',
                    color: Colors.greenAccent,
                  ),
                  _TopAmount(
                    label: 'Total des dépenses',
                    amount: '-\$1187,40',
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: lightBg,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8,
                      ),
                      children: [
                        const _MonthTitle('Avril'),
                        ...avril.map((t) => _TransactionTile(t)),
                        const SizedBox(height: 16),
                        const _MonthTitle('Mars'),
                        ...mars.map((t) => _TransactionTile(t)),
                        const SizedBox(height: 16),
                      ],
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

class _TopAmount extends StatelessWidget {
  final String label;
  final String amount;
  final Color color;

  const _TopAmount({
    required this.label,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Text(
          amount,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _MonthTitle extends StatelessWidget {
  final String month;
  const _MonthTitle(this.month);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        month,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TransactionData {
  final String title;
  final String period;
  final String amount;
  final bool isPositive;

  _TransactionData(this.title, this.period, this.amount, this.isPositive);
}

class _TransactionTile extends StatelessWidget {
  final _TransactionData data;

  const _TransactionTile(this.data);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.wallet_outlined),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  data.period,
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            data.amount,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: data.isPositive ? Colors.green : Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
