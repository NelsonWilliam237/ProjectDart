import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/dashboard_kpi.dart';

final dashboardKpisProvider = Provider<List<DashboardKpi>>((_) => const [
      DashboardKpi(title: 'Net Worth', value: '€124,340', delta: '+5.8%'),
      DashboardKpi(title: 'Monthly Spend', value: '€3,210', delta: '-2.1%'),
      DashboardKpi(title: 'Financial Score', value: '82/100', delta: '+4 pts'),
    ]);
