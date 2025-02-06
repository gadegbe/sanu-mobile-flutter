import 'package:flutter_test/flutter_test.dart';
import 'package:sanu/ui/app/app.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(App());
      expect(find.byType(App), findsOneWidget);
    });
  });
}
