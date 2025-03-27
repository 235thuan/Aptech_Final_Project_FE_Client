import 'package:flutter/material.dart';
// import '../../../bloc/finance/finance_event.dart';
// import '../../../bloc/finance/finance_state.dart';
import '../../../core/services/mock_data_service.dart';

// Màn hình quản lý tài chính cho admin
class FinanceScreen extends StatefulWidget {
  const FinanceScreen({super.key});

  @override
  State<FinanceScreen> createState() => _FinanceScreenState();
}

class _FinanceScreenState extends State<FinanceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _descriptionController = TextEditingController();
  String _selectedType = 'income';
  String _selectedCategory = 'tuition';
  String _selectedStudent = '';
  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    _amountController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _showAddTransactionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Thêm giao dịch'),
        content: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DropdownButtonFormField<String>(
                  value: _selectedType,
                  decoration: const InputDecoration(labelText: 'Loại giao dịch'),
                  items: const [
                    DropdownMenuItem(value: 'income', child: Text('Thu nhập')),
                    DropdownMenuItem(value: 'expense', child: Text('Chi tiêu')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedType = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<String>(
                  value: _selectedCategory,
                  decoration: const InputDecoration(labelText: 'Danh mục'),
                  items: const [
                    DropdownMenuItem(value: 'tuition', child: Text('Học phí')),
                    DropdownMenuItem(value: 'salary', child: Text('Lương')),
                    DropdownMenuItem(value: 'equipment', child: Text('Thiết bị')),
                    DropdownMenuItem(value: 'maintenance', child: Text('Bảo trì')),
                    DropdownMenuItem(value: 'other', child: Text('Khác')),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value!;
                    });
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _amountController,
                  decoration: const InputDecoration(labelText: 'Số tiền'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập số tiền';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Vui lòng nhập số hợp lệ';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Mô tả'),
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập mô tả';
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
                  title: const Text('Ngày giao dịch'),
                  subtitle: Text(
                    '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                  ),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2030),
                    );
                    if (date != null) {
                      setState(() {
                        _selectedDate = date;
                      });
                    }
                  },
                ),
              ],
            ),
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
                // TODO: Implement add transaction functionality
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
    final mockFinances = MockDataService.getMockFinances();

    // Tính tổng thu nhập và chi tiêu
    double totalIncome = 0;
    double totalExpense = 0;
    for (var finance in mockFinances) {
      if (finance.type == 'income') {
        totalIncome += finance.amount;
      } else {
        totalExpense += finance.amount;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý tài chính'),
      ),
      body: Column(
        children: [
          // Tổng quan tài chính
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[200],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFinanceCard(
                  'Tổng thu nhập',
                  totalIncome,
                  Colors.green,
                  Icons.arrow_upward,
                ),
                _buildFinanceCard(
                  'Tổng chi tiêu',
                  totalExpense,
                  Colors.red,
                  Icons.arrow_downward,
                ),
                _buildFinanceCard(
                  'Cân bằng',
                  totalIncome - totalExpense,
                  totalIncome - totalExpense >= 0 ? Colors.blue : Colors.red,
                  totalIncome - totalExpense >= 0 ? Icons.trending_up : Icons.trending_down,
                ),
              ],
            ),
          ),
          // Danh sách giao dịch
          Expanded(
            child: ListView.builder(
              itemCount: mockFinances.length,
              itemBuilder: (context, index) {
                final finance = mockFinances[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: finance.type == 'income' ? Colors.green : Colors.red,
                      child: Icon(
                        finance.type == 'income' ? Icons.arrow_upward : Icons.arrow_downward,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(finance.description),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Danh mục: ${finance.category}'),
                        Text('Học sinh: ${finance.studentName}'),
                        Text('Ngày: ${DateTime.parse(finance.date).day}/${DateTime.parse(finance.date).month}/${DateTime.parse(finance.date).year}'),
                      ],
                    ),
                    trailing: Text(
                      '${finance.type == 'income' ? '+' : '-'}${finance.amount.toStringAsFixed(0)} VNĐ',
                      style: TextStyle(
                        color: finance.type == 'income' ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {
                      // TODO: Implement view transaction details functionality
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTransactionDialog,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildFinanceCard(String title, double amount, Color color, IconData icon) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              '${amount.toStringAsFixed(0)} VNĐ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
} 