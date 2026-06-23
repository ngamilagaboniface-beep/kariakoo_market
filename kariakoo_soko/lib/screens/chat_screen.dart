import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_state.dart';
import '../theme.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final app = context.watch<AppState>();
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F0),
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Al-Huda Traders  GOLD', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
            Text('● Online • Anajibu kwa dk 4 • Swahili/EN', style: TextStyle(fontSize: 11, color: kGreen)),
          ],
        ),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.call_outlined)), IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))],
      ),
      body: Column(
        children: [
          Container(width: double.infinity, color: const Color(0xFFFFFBE9), padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: const Text('Order #KS-8821 - Vitenge Kitenge\nQty: 120 pcs • Dar → Mwanza\nHali: Inajadiliwa Bei', style: TextStyle(fontSize: 12)),
          ),
          Expanded(child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              bubble('Habari Fatuma, karibu Kariakoo Soko. Unahitaji rangi zipi?', false),
              bubble('Nahitaji pcs 120. Unaweza bei ya mwisho? Niko Mwanza.', true),
              bubble('Bei ya kawaida 21,000 kwa 100+. Kwa wewe 19,500. Usafiri ni wako.', false),
              const SizedBox(height: 8),
              // Offer Card
              Container(
                decoration: BoxDecoration(color: const Color(0xFFFFFBE6), borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFF5D67A))),
                padding: const EdgeInsets.all(14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('💬 ${app.t('offer_from_seller')}', style: const TextStyle(fontSize:11, fontWeight: FontWeight.w800, color: Color(0xFF92400E))),
                    const SizedBox(height:6),
                    const Text('Vitenge Kitenge - 120 pcs', style: TextStyle(fontWeight: FontWeight.w600)),
                    const SizedBox(height:6),
                    const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Bei ya unit:',style: TextStyle(fontSize:13)), Text('TZS 19,000 /pc', style: TextStyle(fontWeight: FontWeight.bold, fontSize:13))]),
                    const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Jumla bidhaa:',style: TextStyle(fontSize:13)), Text('TZS 2,280,000', style: TextStyle(fontSize:13))]),
                    const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Usafiri Mabasi:',style: TextStyle(fontSize:13)), Text('TZS 45,000', style: TextStyle(fontSize:13))]),
                    const Divider(),
                    const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Jumla:',style: TextStyle(fontWeight: FontWeight.bold)), Text('TZS 2,325,000', style: TextStyle(fontWeight: FontWeight.bold))]),
                    const SizedBox(height: 4),
                    Text(app.t('offer_expires'), style: TextStyle(fontSize:11, color: Colors.grey[700])),
                    const SizedBox(height: 10),
                    Row(children: [
                      Expanded(child: FilledButton(onPressed: ()=> _paySheet(context), child: Text(app.t('accept_pay')))),
                      const SizedBox(width: 8),
                      Expanded(child: OutlinedButton(onPressed: (){}, child: Text(app.t('counter')))),
                    ])
                  ],
                ),
              ),
              const SizedBox(height: 8),
              bubble('Sawa. Nitachukua. Unaweza fungasha leo? Nipe namba ya basi.', true),
              bubble('Ndiyo. Malipo yakikamilika nina pack. Nitakupa risiti ya MABASI.', false),
            ],
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Wrap(spacing: 6, children: const [
              Chip(label: Text('Bei ya mwisho?', style: TextStyle(fontSize:11))),
              Chip(label: Text('Nipo tayari', style: TextStyle(fontSize:11))),
              Chip(label: Text('Invoice tafadhali', style: TextStyle(fontSize:11))),
            ]),
          ),
          SafeArea(child: Padding(
            padding: const EdgeInsets.fromLTRB(12,4,12,8),
            child: TextField(
              decoration: InputDecoration(
                hintText: app.isSw ? 'Andika ujumbe... / Type message...' : 'Type message... / Andika ujumbe...',
                suffixIcon: const Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.attach_file), SizedBox(width:8),
                  Icon(Icons.monetization_on_outlined), SizedBox(width:8),
                  Icon(Icons.send, color: kGreen), SizedBox(width:12),
                ]),
                filled: true, fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: const BorderSide(color: Color(0xFFDDDDDD))),
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget bubble(String text, bool me) {
    return Align(
      alignment: me ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        constraints: const BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: me ? const Color(0xFFD6F5E1) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: me ? null : Border.all(color: const Color(0xFFE5E7EB)),
        ),
        child: Text(text, style: const TextStyle(fontSize: 13)),
      ),
    );
  }

  void _paySheet(BuildContext context) {
    showModalBottomSheet(context: context, showDragHandle: true, isScrollControlled: true,
      builder: (_) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('Lipa na Malipo Salama', style: TextStyle(fontSize:18, fontWeight: FontWeight.w800)),
          const SizedBox(height:8),
          const Text('TZS 2,325,000 • Order #KS-8821', style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 14),
          Wrap(spacing:8, runSpacing:8, children: [
            ChoiceChip(label: const Text('M-Pesa'), selected: true, onSelected: (_){}),
            ChoiceChip(label: const Text('Tigo Pesa'), selected: false, onSelected: (_){}),
            ChoiceChip(label: const Text('Airtel Money'), selected: false, onSelected: (_){}),
            ChoiceChip(label: const Text('HaloPesa'), selected: false, onSelected: (_){}),
            ChoiceChip(label: const Text('CRDB / NMB'), selected: false, onSelected: (_){}),
          ]),
          const SizedBox(height: 14),
          SizedBox(width: double.infinity, child: FilledButton(
            onPressed: (){
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('STK Push sent – Check your M-Pesa phone. (Mock – connect ClickPesa in production)'))
              );
            },
            child: const Text('Lipa TZS 2,325,000 – STK Push'),
          )),
          const SizedBox(height: 8),
          const Text('Fedha zitashikiliwa na Trade Assurance Escrow hadi uthibitishe delivery.', style: TextStyle(fontSize:11, color: Colors.black54)),
          const SizedBox(height: 20),
        ]),
      ));
  }
}
