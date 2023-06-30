import 'package:casino/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> main() async {
  testWidgets('Test d\'interface utilisateur du jeu de Casino',
      (WidgetTester tester) async {
    // Construire notre application et déclencher un frame.
    await tester.pumpWidget(CasinoApp());

    // Vérifier que le titre est affiché.
    expect(find.text('Casino'), findsOneWidget);

    // Vérifier que le message initial est vide.
    expect(find.text(''), findsOneWidget);

    // Vérifier que le bouton "Play" est affiché.
    expect(find.text('Play'), findsOneWidget);

    // Appuyer sur le bouton "Play".
    await tester.tap(find.text('Play'));
    await tester.pump();

    // Vérifier qu'un message est affiché après avoir joué.
    expect(find.text(''), findsNothing);
    expect(find.byType(Text), findsWidgets);
  });
}
