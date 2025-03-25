import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../bloc/certificates/certificate_bloc.dart';
// import '../../../bloc/certificates/certificate_event.dart';
// import '../../../bloc/certificates/certificate_state.dart';
import '../../../core/models/certificate.dart';
import '../../../core/services/mock_data_service.dart';

// Màn hình quản lý chứng chỉ cho admin
class CertificateScreen extends StatefulWidget {
  const CertificateScreen({super.key});

  @override
  State<CertificateScreen> createState() => _CertificateScreenState();
}

class _CertificateScreenState extends State<CertificateScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String _selectedStudent = '';
  DateTime _selectedIssueDate = DateTime.now();
  DateTime _selectedExpiryDate = DateTime.now().add(const Duration(days: 365));
  String _selectedStatus = 'active';

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _showAddCertificateDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm chứng chỉ'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Tên chứng chỉ'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập tên chứng chỉ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedStudent,
                decoration: const InputDecoration(labelText: 'Học sinh'),
                items: const [
                  DropdownMenuItem(value: 'Nguyễn Văn A', child: Text('Nguyễn Văn A')),
                  DropdownMenuItem(value: 'Trần Thị B', child: Text('Trần Thị B')),
                  DropdownMenuItem(value: 'Lê Văn C', child: Text('Lê Văn C')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedStudent = value!;
                  });
                },
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Ngày cấp'),
                subtitle: Text(
                  '${_selectedIssueDate.day}/${_selectedIssueDate.month}/${_selectedIssueDate.year}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _selectedIssueDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (date != null) {
                    setState(() {
                      _selectedIssueDate = date;
                    });
                  }
                },
              ),
              ListTile(
                title: const Text('Ngày hết hạn'),
                subtitle: Text(
                  '${_selectedExpiryDate.day}/${_selectedExpiryDate.month}/${_selectedExpiryDate.year}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: _selectedExpiryDate,
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2030),
                  );
                  if (date != null) {
                    setState(() {
                      _selectedExpiryDate = date;
                    });
                  }
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedStatus,
                decoration: const InputDecoration(labelText: 'Trạng thái'),
                items: const [
                  DropdownMenuItem(value: 'active', child: Text('Đang hoạt động')),
                  DropdownMenuItem(value: 'expired', child: Text('Đã hết hạn')),
                  DropdownMenuItem(value: 'revoked', child: Text('Đã thu hồi')),
                ],
                onChanged: (value) {
                  setState(() {
                    _selectedStatus = value!;
                  });
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // TODO: Implement add certificate functionality
                Navigator.pop(context);
              }
            },
            child: const Text('Thêm'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Sử dụng mock data thay vì gọi API
    final mockCertificates = MockDataService.getMockCertificates();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý chứng chỉ'),
      ),
      body: ListView.builder(
        itemCount: mockCertificates.length,
        itemBuilder: (context, index) {
          final certificate = mockCertificates[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: ExpansionTile(
              title: Text(certificate.name),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Học sinh: ${certificate.studentName}'),
                  Text('Trạng thái: ${certificate.status}'),
                ],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ngày cấp: ${certificate.issuedDate.day}/${certificate.issuedDate.month}/${certificate.issuedDate.year}'),
                      Text('Ngày hết hạn: ${certificate.expiryDate.day}/${certificate.expiryDate.month}/${certificate.expiryDate.year}'),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // TODO: Implement edit certificate functionality
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              // TODO: Implement delete certificate functionality
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCertificateDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
} 