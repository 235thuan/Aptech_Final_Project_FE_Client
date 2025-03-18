import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/auth/auth_bloc.dart';
import 'bloc/auth/auth_event.dart';
import 'bloc/auth/auth_state.dart';
import 'bloc/course/course_bloc.dart';
import 'bloc/timetable/timetable_bloc.dart';
import 'bloc/grade/grade_bloc.dart';
import 'bloc/user/user_bloc.dart';
import 'core/services/auth_service.dart';
import 'core/services/course_service.dart';
import 'core/services/timetable_service.dart';
import 'core/services/grade_service.dart';
import 'core/services/user_service.dart';
import 'core/services/navigation_service.dart';
import 'ui/screens/auth/login_screen.dart';
import 'ui/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(AuthService())..add(CheckAuthStatusEvent()),
        ),
        BlocProvider(
          create: (context) => UserBloc(UserService()),
        ),
        BlocProvider(
          create: (context) => CourseBloc(CourseService()),
        ),
        BlocProvider(
          create: (context) => TimetableBloc(TimetableService()),
        ),
        BlocProvider(
          create: (context) => GradeBloc(GradeService()),
        ),
      ],
      child: MaterialApp(
        title: 'Student Management System',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthInitial) {
              return const SplashScreen();
            } else if (state is AuthAuthenticated) {
              return NavigationService.getHomeScreenByRole(state.role);
            } else if (state is AuthUnauthenticated) {
              return const LoginScreen();
            }
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}