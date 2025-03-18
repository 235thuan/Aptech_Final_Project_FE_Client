// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../bloc/auth/auth_bloc.dart';
// import '../../../bloc/auth/auth_event.dart';
// import '../../../bloc/auth/auth_state.dart';
// import '../../../core/services/mock_data_service.dart';
//
// // Màn hình test để chuyển đổi giữa các vai trò
// class TestRoleScreen extends StatelessWidget {
//   const TestRoleScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Test Role'),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () {
//               context.read<AuthBloc>().add(LogoutEvent());
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Chọn vai trò để test',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 context.read<AuthBloc>().add(
//                   LoginEvent(
//                     email: 'student@example.com',
//                     password: 'password',
//                   ),
//                 );
//               },
//               child: const Text('Test vai trò Sinh viên'),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 context.read<AuthBloc>().add(
//                   LoginEvent(
//                     email: 'teacher@example.com',
//                     password: 'password',
//                   ),
//                 );
//               },
//               child: const Text('Test vai trò Giảng viên'),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 context.read<AuthBloc>().add(
//                   LoginEvent(
//                     email: 'admin@example.com',
//                     password: 'password',
//                   ),
//                 );
//               },
//               child: const Text('Test vai trò Giáo vụ'),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 context.read<AuthBloc>().add(
//                   LoginEvent(
//                     email: 'parent@example.com',
//                     password: 'password',
//                   ),
//                 );
//               },
//               child: const Text('Test vai trò Phụ huynh'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }