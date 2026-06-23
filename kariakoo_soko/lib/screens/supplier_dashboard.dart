import 'package:flutter/material.dart';
import '../theme.dart';

class SupplierDashboardScreen extends StatelessWidget {
  const SupplierDashboardScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Al-Huda Traders', style: TextStyle(fontWeight: FontWeight.w800)),
            Text('GOLD SUPPLIER • Trust 4.8 ★', style: TextStyle(fontSize: 12, color: kGreen)),
          ],
        ),
        actions: [
          Stack(
            children: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_outlined)),
              const Positioned(right: 10, top: 10, child: CircleAvatar(radius: 8, backgroundColor: Colors.red, child: Text('5', style: TextStyle(color: Colors.white, fontSize: 9)))),
            ],
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1.6,
            children: const [
              _Kpi('TZS 8.4M', 'Mauzo Mwezi huu'),
              _Kpi('14', 'Maagizo Hai'),
              _Kpi('23', 'RFQ Mpya'),
              _Kpi('98%', 'On-time Dispatch'),
            ],
          ),
          const SizedBox(height: 16),
          Text('MAAGIZO YANAYOSUBIRI HATUA', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.grey[600])),
          const SizedBox(height: 8),
          Card(child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('#KS-8821 • Fatuma M.', style: TextStyle(fontWeight: FontWeight.w700)),
                Container(padding: const EdgeInsets.symmetric(horizontal:8, vertical:3), decoration: BoxDecoration(color: const Color(0xFFEEFBF3), borderRadius: BorderRadius.circular(99)), child: const Text('Malipo Salama', style: TextStyle(fontSize:11, color: Color(0xFF067A3A), fontWeight: FontWeight.w700))),
              ]),
              const SizedBox(height: 4),
              const Text('120x Vitenge • TZS 2,280,000 • Mwanza', style: TextStyle(fontSize: 13)),
              Text('Escrow imelipwa. Fungasha & weka namba ya basi.', style: TextStyle(fontSize: 12, color: Colors.grey[700])),
              const SizedBox(height: 10),
              SizedBox(width: double.infinity, child: FilledButton(onPressed: (){}, child: const Text('Thibitisha & Weka Usafiri →'))),
            ]),
          )),
          Card(child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('#KS-8819 • Juma Stores', style: TextStyle(fontWeight: FontWeight.w700)),
                Container(padding: const EdgeInsets.symmetric(horizontal:8, vertical:3), decoration: BoxDecoration(color: const Color(0xFFFEF3C7), borderRadius: BorderRadius.circular(99)), child: const Text('Inajadiliwa', style: TextStyle(fontSize:11, color: Color(0xFF92400E), fontWeight: FontWeight.w700))),
              ]),
              const SizedBox(height: 4),
              const Text('RFQ: Sneakers 200 pairs • Arusha', style: TextStyle(fontSize: 13)),
              const SizedBox(height: 10),
              SizedBox(width: double.infinity, child: OutlinedButton(onPressed: (){}, child: const Text('Tuma Ofa Chat 💬'))),
            ]),
          )),
          const SizedBox(height: 16),
          Text('BIDHAA ZANGU & BEI YA TIER', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.grey[600])),
          const SizedBox(height: 8),
          const Card(child: Padding(
            padding: EdgeInsets.all(14),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Vitenge Kitenge', style: TextStyle(fontWeight: FontWeight.w700)),
              SizedBox(height: 6),
              Text('1-11 pcs: 25,000 TZS\n12-99 pcs: 21,000 TZS\n100+ pcs: 18,000 TZS', style: TextStyle(fontSize: 13)),
              SizedBox(height: 4),
              Text('Stock: 840 pcs • Maoni: 127', style: TextStyle(fontSize: 11, color: Colors.grey)),
            ]),
          )),
          const SizedBox(height: 8),
          Card(
            color: const Color(0xFFF0FDF4),
            child: Padding(padding: const EdgeInsets.all(14),
              child: Text('✓ BRELA: 123456 ✓ TIN: 123-456-789\n✓ Duka: Msimbazi St, Kariakoo - Geo-verified\n✓ Muagizaji Aliyethibitishwa\nTrust Score: 92/100', style: TextStyle(color: Colors.grey[800], fontSize: 13)),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(width: double.infinity, child: FilledButton(onPressed: (){}, child: const Text('+ Ongeza Bidhaa Mpya'))),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class _Kpi extends StatelessWidget {
  final String value, label;
  const _Kpi(this.value, this.label);
  @override
  Widget build(BuildContext context) {
    return Card(child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
      Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
      const SizedBox(height: 2),
      Text(label, style: TextStyle(fontSize: 11, color: Colors.grey[600]), textAlign: TextAlign.center),
    ])));
  }
}
