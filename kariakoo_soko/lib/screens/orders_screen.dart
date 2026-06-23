import 'package:flutter/material.dart';
import '../theme.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Maagizo – Trade Assurance')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(child: Padding(padding: const EdgeInsets.all(14), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('#KS-8821', style: TextStyle(fontWeight: FontWeight.w800)),
                Container(padding: const EdgeInsets.symmetric(horizontal:8, vertical:3), decoration: BoxDecoration(color: const Color(0xFFEEFBF3), borderRadius: BorderRadius.circular(99)), child: const Text('Escrow Paid', style: TextStyle(fontSize:11, color: Color(0xFF067A3A), fontWeight: FontWeight.w700))),
              ]),
              const SizedBox(height:4),
              const Text('Vitenge Kitenge • 120 pcs • TZS 2,325,000'),
              const SizedBox(height:8),
              const Row(children: [
                Icon(Icons.check_circle, size:18, color: kGreen), SizedBox(width:6), Text('Paid', style: TextStyle(fontSize:12)),
                SizedBox(width:12),
                Icon(Icons.local_shipping, size:18, color: kGold), SizedBox(width:6), Text('Packing', style: TextStyle(fontSize:12)),
                SizedBox(width:12),
                Icon(Icons.radio_button_unchecked, size:18, color: Colors.grey), SizedBox(width:6), Text('Delivered', style: TextStyle(fontSize:12)),
              ]),
              const SizedBox(height:10),
              const Text('Usafiri: Mabasi ya Mikoani – Shabiby Bus – T123 DFG', style: TextStyle(fontSize:12)),
              const SizedBox(height:10),
              Row(children: [
                Expanded(child: FilledButton(onPressed: (){}, child: const Text('Nimepokea – Fungua Malipo'))),
                const SizedBox(width:8),
                Expanded(child: OutlinedButton(onPressed: (){}, child: const Text('Ripoti Tatizo'))),
              ])
            ],
          ))),
          const SizedBox(height: 8),
          Card(child: ListTile(title: const Text('#KS-8804 • Solar Radio'), subtitle: const Text('Imekamilika • Released TZS 725,000'), trailing: Icon(Icons.check_circle, color: Colors.green))),
        ],
      ),
    );
  }
}
