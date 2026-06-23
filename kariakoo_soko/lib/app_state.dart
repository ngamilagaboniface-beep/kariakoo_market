import 'package:flutter/material.dart';

enum AppMode { buyer, supplier }

class AppState extends ChangeNotifier {
  AppMode mode = AppMode.buyer;
  Locale locale = const Locale('sw');
  int navIndex = 0;

  void setMode(AppMode m) { mode = m; navIndex = 0; notifyListeners(); }
  void setLocale(Locale l) { locale = l; notifyListeners(); }

  bool get isSw => locale.languageCode == 'sw';

  String t(String key) {
    const sw = {
      'app_name': 'Kariakoo Soko B2B',
      'search_hint': 'Tafuta jumla: vitenge, viatu, electronics...',
      'deliver_to': 'Deliver to',
      'rfq_title': 'Tuma Ombi la Nukuu / RFQ',
      'rfq_sub': 'Wauzaji 1,240+ wa Kariakoo wako tayari kukupatia bei',
      'rfq_btn': 'Chapisha RFQ Bure →',
      'gold_supplier': 'Wauzaji Waliothibitishwa • Gold Supplier',
      'moq': 'MOQ',
      'account': 'Akaunti',
      'language': 'Lugha / Language',
      'trade_assurance': 'Malipo Salama Trade Assurance',
      'payments': 'Malipo',
      'chat': 'Chat',
      'orders': 'Maagizo',
      'accept_pay': 'Kubali & Lipa',
      'counter': 'Pinga Bei',
      'offer_from_seller': 'OFA RASMI KUTOKA MUUZAJI',
      'offer_expires': 'Ofa inaisha masaa 24 • Malipo Salama Escrow',
    };
    const en = {
      'app_name': 'Kariakoo Soko B2B',
      'search_hint': 'Search wholesale: kitenge, shoes, electronics...',
      'deliver_to': 'Deliver to',
      'rfq_title': 'Post a Request for Quote / RFQ',
      'rfq_sub': '1,240+ Kariakoo suppliers ready to bid',
      'rfq_btn': 'Post RFQ Free →',
      'gold_supplier': 'Verified Suppliers • Gold Supplier',
      'moq': 'MOQ',
      'account': 'Account',
      'language': 'Language / Lugha',
      'trade_assurance': 'Malipo Salama Trade Assurance',
      'payments': 'Payments',
      'chat': 'Chat',
      'orders': 'Orders',
      'accept_pay': 'Accept & Pay',
      'counter': 'Counter Offer',
      'offer_from_seller': 'OFFICIAL SELLER OFFER',
      'offer_expires': 'Offer expires in 24h • Malipo Salama Escrow',
    };
    final map = locale.languageCode == 'sw' ? sw : en;
    return map[key] ?? key;
  }
}

class Product {
  final String name, supplier, badge, location, img;
  final int price, moq;
  Product(this.name, this.supplier, this.badge, this.location, this.price, this.moq, this.img);
}

final mockProducts = [
  Product('Vitenge Kitenge', 'Al-Huda Traders', 'GOLD', 'Kariakoo, Dar', 18000, 12, ''),
  Product('Solar Radio FM', 'Msimbazi Electronics', 'GOLD', 'Kariakoo, Dar', 14500, 50, ''),
  Product('Sneakers Jumla', 'City Shoes Ltd', 'GOLD', 'Kariakoo, Dar', 22000, 12, ''),
  Product('Blender 3-in-1', 'JMK Home', 'LOCAL MFG', 'Mbezi, Dar', 45000, 6, ''),
];
