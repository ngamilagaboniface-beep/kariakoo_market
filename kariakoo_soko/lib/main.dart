import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'theme.dart';
import 'screens/buyer_home.dart';
import 'screens/chat_screen.dart';
import 'screens/supplier_dashboard.dart';
import 'screens/rfq_screen.dart';
import 'screens/orders_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const KariakooApp(),
    ),
  );
}

class KariakooApp extends StatelessWidget {
  const KariakooApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    return MaterialApp(
      title: 'Kariakoo Soko B2B',
      debugShowCheckedModeBanner: false,
      theme: kariakooTheme,
      locale: appState.locale,
      supportedLocales: const [Locale('sw'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: const RootShell(),
    );
  }
}

class RootShell extends StatefulWidget {
  const RootShell({super.key});
  @override
  State<RootShell> createState() => _RootShellState();
}

class _RootShellState extends State<RootShell> {
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final isSupplier = appState.mode == AppMode.supplier;

    final buyerTabs = [
      const BuyerHomeScreen(),
      const RfqScreen(),
      const ChatScreen(),
      const OrdersScreen(),
      const AccountPlaceholder(),
    ];
    final supplierTabs = [
      const SupplierDashboardScreen(),
      const ProductsPlaceholder(),
      const ChatScreen(),
      const PayoutsPlaceholder(),
      const AccountPlaceholder(),
    ];

    final tabs = isSupplier ? supplierTabs : buyerTabs;
    final index = appState.navIndex.clamp(0, tabs.length - 1);

    return Scaffold(
      body: tabs[index],
      bottomNavigationBar: NavigationBar(
        height: 72,
        selectedIndex: index,
        onDestinationSelected: (i) => appState.navIndex = i,
        destinations: isSupplier ? const [
          NavigationDestination(icon: Icon(Icons.dashboard_outlined), selectedIcon: Icon(Icons.dashboard), label: 'Dashboard'),
          NavigationDestination(icon: Icon(Icons.inventory_2_outlined), selectedIcon: Icon(Icons.inventory_2), label: 'Bidhaa'),
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), selectedIcon: Icon(Icons.chat_bubble), label: 'Chat'),
          NavigationDestination(icon: Icon(Icons.account_balance_wallet_outlined), selectedIcon: Icon(Icons.account_balance_wallet), label: 'Malipo'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Wasifu'),
        ] : const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Nyumbani'),
          NavigationDestination(icon: Icon(Icons.request_quote_outlined), selectedIcon: Icon(Icons.request_quote), label: 'RFQ'),
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), selectedIcon: Icon(Icons.chat_bubble), label: 'Chat'),
          NavigationDestination(icon: Icon(Icons.inventory_outlined), selectedIcon: Icon(Icons.inventory), label: 'Maagizo'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Akaunti'),
        ],
      ),
    );
  }
}

class AccountPlaceholder extends StatelessWidget {
  const AccountPlaceholder({super.key});
  @override
  Widget build(BuildContext context) {
    final appState = context.watch<AppState>();
    final t = appState.t;
    return Scaffold(
      appBar: AppBar(title: Text(t('account'))),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: const Text('Supplier Mode / Buyer Mode'),
            subtitle: Text(appState.mode == AppMode.supplier ? 'Supplier Dashboard' : 'Buyer Home'),
            value: appState.mode == AppMode.supplier,
            onChanged: (v) => appState.setMode(v ? AppMode.supplier : AppMode.buyer),
          ),
          const Divider(),
          ListTile(
            title: Text(t('language')),
            subtitle: Text(appState.locale.languageCode == 'sw' ? 'Kiswahili' : 'English'),
            trailing: SegmentedButton<String>(
              segments: const [
                ButtonSegment(value: 'sw', label: Text('SW')),
                ButtonSegment(value: 'en', label: Text('EN')),
              ],
              selected: {appState.locale.languageCode},
              onSelectionChanged: (s) => appState.setLocale(Locale(s.first)),
            ),
          ),
          const Divider(),
          ListTile(title: Text(t('trade_assurance')), subtitle: const Text('Malipo Salama Escrow - ClickPesa / Pesapal')),
          ListTile(title: Text(t('payments')), subtitle: const Text('M-Pesa • Tigo Pesa • Airtel Money • HaloPesa • CRDB/NMB')),
          const SizedBox(height: 24),
          Center(child: Text('Kariakoo Soko B2B v1.0', style: TextStyle(color: Colors.grey[600]))),
        ],
      ),
    );
  }
}

class ProductsPlaceholder extends StatelessWidget {
  const ProductsPlaceholder({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Bidhaa Zangu')), body: const Center(child: Text('Product & Tier Pricing Editor – see Dashboard'))));
}
class PayoutsPlaceholder extends StatelessWidget {
  const PayoutsPlaceholder({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('Malipo – Payouts')), body: const Center(child: Text('Escrow releases → NMB/CRDB T+1')));
}
