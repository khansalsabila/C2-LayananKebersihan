import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:login_app/ui/home_page.dart';
import 'package:integration_test/integration_test.dart';
import 'package:login_app/main.dart' as app;
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Login Test', () {
    testWidgets('Test Login ketika password salah', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).at(0), 'tasya@gmail.com');
      await Future.delayed(Duration(seconds: 2));
      FocusScope.of(tester.element(find.byType(TextFormField).at(0))).unfocus();
      await Future.delayed(Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).at(1), '123456');
      await Future.delayed(Duration(seconds: 2));
      FocusScope.of(tester.element(find.byType(TextFormField).at(1))).unfocus();
      await Future.delayed(Duration(seconds: 2));
      await tester.tap(find.byType(ElevatedButton));
      await Future.delayed(Duration(seconds: 2));
      await tester.pumpAndSettle();

      // Tambahkan penundaan atau langkah berikutnya setelah pumpAndSettle
      await Future.delayed(Duration(seconds: 2));

      // Verifikasi bahwa HomeView ditemukan
      expect(find.byType(Homepage), findsOneWidget);
    });
  });
}