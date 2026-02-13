import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/theme/app_theme.dart';
import '../features/analytics/presentation/analytics_page.dart';
import '../features/auth/presentation/login_page.dart';
import '../features/dashboard/presentation/dashboard_page.dart';
import '../features/settings/presentation/settings_page.dart';
import '../features/transactions/presentation/transactions_page.dart';
import '../features/wallet/presentation/wallet_page.dart';

class FinexiaApp extends StatelessWidget {
  const FinexiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Finexia SaaS',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
    GoRoute(path: '/dashboard', builder: (_, __) => const DashboardPage()),
    GoRoute(path: '/wallets', builder: (_, __) => const WalletPage()),
    GoRoute(path: '/transactions', builder: (_, __) => const TransactionsPage()),
    GoRoute(path: '/analytics', builder: (_, __) => const AnalyticsPage()),
    GoRoute(path: '/settings', builder: (_, __) => const SettingsPage()),
  ],
);
