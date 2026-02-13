import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/dashboard_provider.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final kpis = ref.watch(dashboardKpisProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Smart Finance Dashboard')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: kpis
                .map(
                  (kpi) => SizedBox(
                    width: 180,
                    child: Card(
                      child: ListTile(
                        title: Text(kpi.title),
                        subtitle: Text(kpi.value, style: const TextStyle(fontWeight: FontWeight.bold)),
                        trailing: Text(kpi.delta),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 24),
          const Text('Monthly expenses', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          SizedBox(
            height: 220,
            child: LineChart(
              LineChartData(
                minX: 1,
                maxX: 6,
                minY: 0,
                maxY: 4000,
                lineBarsData: [
                  LineChartBarData(
                    isCurved: true,
                    barWidth: 3,
                    spots: const [
                      FlSpot(1, 2500),
                      FlSpot(2, 3100),
                      FlSpot(3, 2700),
                      FlSpot(4, 3200),
                      FlSpot(5, 2900),
                      FlSpot(6, 2800),
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
}
