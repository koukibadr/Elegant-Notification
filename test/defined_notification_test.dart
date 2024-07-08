import 'package:elegant_notification/elegant_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Testing defined elegant notifications', () {
    testWidgets(
      'Success elegant notification',
      (tester) async {
        var basicElgantNotificaiton = ElegantNotification.success(
          description: const Text(
            'Simple success toast',
          ),
        );
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: basicElgantNotificaiton,
              ),
            ),
          ),
        );
        expect(
          find.byType(Text),
          findsOneWidget,
        );
        expect(
          find.byType(LinearProgressIndicator),
          findsOneWidget,
        );
        expect(
          find.byIcon(Icons.check_circle),
          findsOneWidget,
        );
        expect(
          basicElgantNotificaiton.background,
          equals(Colors.white),
        );
      },
    );

    testWidgets(
      'Info elegant notification',
      (tester) async {
        var basicElgantNotificaiton = ElegantNotification.info(
          description: const Text(
            'Simple info toast',
          ),
        );
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: basicElgantNotificaiton,
              ),
            ),
          ),
        );
        expect(
          find.byType(Text),
          findsOneWidget,
        );
        expect(
          find.byType(LinearProgressIndicator),
          findsOneWidget,
        );
        expect(
          find.byIcon(Icons.info),
          findsOneWidget,
        );
        expect(
          basicElgantNotificaiton.background,
          equals(Colors.white),
        );
      },
    );

    testWidgets(
      'Info elegant notification',
      (tester) async {
        var basicElgantNotificaiton = ElegantNotification.error(
          description: const Text(
            'Simple error toast',
          ),
        );
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: Center(
                child: basicElgantNotificaiton,
              ),
            ),
          ),
        );
        expect(
          find.byType(Text),
          findsOneWidget,
        );
        expect(
          find.byType(LinearProgressIndicator),
          findsOneWidget,
        );
        expect(
          find.byIcon(Icons.add_circle_outlined),
          findsOneWidget,
        );
        expect(
          basicElgantNotificaiton.background,
          equals(Colors.white),
        );
      },
    );
  });
}
