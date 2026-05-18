import 'package:flutter_test/flutter_test.dart';
import 'package:appli_etudiant/main.dart';

void main() {
  testWidgets('FlexFood démarre sans erreur', (WidgetTester tester) async {
    await tester.pumpWidget(const AppFlexFood(routeInitiale: '/connexion'));
  });
}
