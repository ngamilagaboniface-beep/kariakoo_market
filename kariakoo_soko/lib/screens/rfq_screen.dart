import 'package:flutter/material.dart';

class RfqScreen extends StatelessWidget {
  const RfqScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('RFQ – Ombi la Nukuu')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(child: Padding(padding: const EdgeInsets.all(16), child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Chapisha RFQ Mpya', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
              const SizedBox(height:8),
              const TextField(decoration: InputDecoration(labelText: 'Bidhaa unayotaka', border: OutlineInputBorder())),
              const SizedBox(height:10),
              const Row(children: [
                Expanded(child: TextField(decoration: InputDecoration(labelText: 'Qty', border: OutlineInputBorder()))),
                SizedBox(width:10),
                Expanded(child: TextField(decoration: InputDecoration(labelText: 'Budget TZS', border: OutlineInputBorder()))),
              ]),
              const SizedBox(height:10),
              const TextField(decoration: InputDecoration(labelText: 'Mkoa wa Delivery (e.g. Mwanza)', border: OutlineInputBorder())),
              const SizedBox(height:12),
              SizedBox(width: double.infinity, child: FilledButton(onPressed: (){}, child: const Text('Chapisha RFQ Bure'))),
            ],
          ))),
          const SizedBox(height: 12),
          const Text('RFQ ZANGU', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.grey)),
          const SizedBox(height: 8),
          Card(child: ListTile(title: const Text('Sneakers 200 pairs'), subtitle: const Text('Arusha • Budget: TZS 4.5M • Bids 7'), trailing: Chip(label: Text('7 bids')), onTap: (){})),
          Card(child: ListTile(title: const Text('Vitenge 120 pcs'), subtitle: const Text('Mwanza • Closed – Al-Huda won'), trailing: Icon(Icons.check_circle, color: Colors.green), onTap: (){})),
        ],
      ),
    );
  }
}
