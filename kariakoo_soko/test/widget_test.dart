import 'package:flutter_test/flutter_test.dart';
import 'package:kariakoo_soko/main.dart';

void main() {
  testWidgets('Kariakoo app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const KariakooApp());
    expect(find.textContaining('Kariakoo'), findsWidgets);
  });
}
