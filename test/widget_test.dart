import 'package:flutter_test/flutter_test.dart';
import 'package:kopinusa/main.dart';

void main() {
  testWidgets('Aplikasi KopiNusa dapat dibuka', (WidgetTester tester) async {
    await tester.pumpWidget(const KopiNusaApp());
    expect(find.byType(KopiNusaApp), findsOneWidget);
  });
}