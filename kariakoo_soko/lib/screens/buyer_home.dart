import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../theme.dart';

class BuyerHomeScreen extends StatelessWidget {
  const BuyerHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppState>();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Inapatikana Kariakoo', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
            const Text('Kariakoo Soko B2B', style: TextStyle(fontWeight: FontWeight.w800)),
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.notifications_outlined)),
          IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart_outlined)),
          const SizedBox(width: 4),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16,0,16,12),
            child: TextField(
              decoration: InputDecoration(
                hintText: app.t('search_hint'),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: const Color(0xFFF0F2F5),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('${app.t('deliver_to')}: Mwanza • Badilisha', style: TextStyle(fontSize: 12, color: Colors.grey[700])),
          const SizedBox(height: 12),
          // RFQ Banner
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(colors: [kGreen, Color(0xFF007030)], begin: Alignment.topLeft, end: Alignment.bottomRight),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(app.t('rfq_title'), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 16)),
                const SizedBox(height: 4),
                Text(app.t('rfq_sub'), style: const TextStyle(color: Colors.white70, fontSize: 12)),
                const SizedBox(height: 10),
                FilledButton(
                  style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFF007030)),
                  onPressed: () => context.read<AppState>().navIndex = 1,
                  child: Text(app.t('rfq_btn')),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: ['Zote','Vitenge & Mitumba','Electronics','Viatu','Vifaa vya Jikoni','Vipodozi'].map((c) => Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(label: Text(c), selected: c=='Zote', onSelected: (_){}),
              )).toList(),
            ),
          ),
          const SizedBox(height: 16),
          Text(app.t('gold_supplier'), style: TextStyle(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w700)),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12, childAspectRatio: 0.68
            ),
            itemCount: mockProducts.length,
            itemBuilder: (_, i) {
              final p = mockProducts[i];
              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFE5E7EB),
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                      ),
                      alignment: Alignment.center,
                      child: Text(p.name, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('TZS ${p.price}', style: const TextStyle(fontWeight: FontWeight.w800)),
                          Text('${app.t('moq')} ${p.moq} pcs', style: TextStyle(fontSize: 11, color: Colors.grey[600])),
                          const SizedBox(height: 4),
                          Wrap(spacing:4, children:[
                            Text(p.supplier, style: TextStyle(fontSize: 11, color: Colors.grey[700])),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal:6, vertical:2),
                              decoration: BoxDecoration(color: p.badge=='GOLD'?kGold:const Color(0xFFE0F2FE), borderRadius: BorderRadius.circular(6)),
                              child: Text(p.badge, style: const TextStyle(fontSize:9, fontWeight: FontWeight.w800)),
                            )
                          ]),
                          Text(p.location, style: TextStyle(fontSize: 10, color: Colors.grey[500])),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
