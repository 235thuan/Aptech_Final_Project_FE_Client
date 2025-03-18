// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';
import 'package:aptech_final_project_fe_client_v2/main.dart';
import 'package:aptech_final_project_fe_client_v2/bloc/auth/auth_bloc.dart';
import 'package:aptech_final_project_fe_client_v2/bloc/auth/auth_event.dart';
import 'package:aptech_final_project_fe_client_v2/bloc/auth/auth_state.dart';

// Mock AuthBloc
class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  late MockAuthBloc mockAuthBloc;

  setUp(() {
    mockAuthBloc = MockAuthBloc();
  });

  testWidgets('Login screen shows email and password fields', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      BlocProvider<AuthBloc>.value(
        value: mockAuthBloc,
        child: const MyApp(),
      ),
    );

    // Verify that email field exists
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text('Email'), findsOneWidget);
    expect(find.text('Mật khẩu'), findsOneWidget);

    // Verify that login button exists
    expect(find.text('Đăng nhập'), findsOneWidget);
  });

  testWidgets('Login button triggers login event when form is valid', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      BlocProvider<AuthBloc>.value(
        value: mockAuthBloc,
        child: const MyApp(),
      ),
    );

    // Enter email
    await tester.enterText(find.byType(TextFormField).first, 'test@example.com');
    
    // Enter password
    await tester.enterText(find.byType(TextFormField).last, 'password123');

    // Tap login button
    await tester.tap(find.text('Đăng nhập'));
    await tester.pump();

    // Verify that login event was added
    verify(() => mockAuthBloc.add(
      LoginEvent(
        email: 'test@example.com',
        password: 'password123',
      ),
    )).called(1);
  });

  testWidgets('Login button shows loading state when AuthBloc is loading', (WidgetTester tester) async {
    // Mock AuthBloc to emit loading state
    when(() => mockAuthBloc.state).thenReturn(AuthLoading());

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      BlocProvider<AuthBloc>.value(
        value: mockAuthBloc,
        child: const MyApp(),
      ),
    );

    // Verify that loading indicator is shown
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
