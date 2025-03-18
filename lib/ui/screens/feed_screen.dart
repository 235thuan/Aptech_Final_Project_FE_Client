import 'package:flutter/material.dart';

// Màn hình hiển thị nguồn cấp dữ liệu
class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 10, // Số lượng bài viết mẫu
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header của bài viết
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/200/200?random=$index',
                  ),
                ),
                title: Text('Người dùng ${index + 1}'),
                subtitle: Text('${DateTime.now().subtract(Duration(hours: index)).toString().substring(0, 16)}'),
              ),
              // Nội dung bài viết
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Đây là nội dung bài viết mẫu ${index + 1}. Có thể chứa nhiều dòng văn bản khác nhau.',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 8),
              // Hình ảnh (nếu có)
              if (index % 2 == 0)
                Image.network(
                  'https://picsum.photos/400/300?random=$index',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              const SizedBox(height: 8),
              // Các nút tương tác
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.thumb_up_outlined),
                      label: Text('${(index + 1) * 10}'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.comment_outlined),
                      label: Text('${(index + 1) * 5}'),
                    ),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share_outlined),
                      label: const Text('Chia sẻ'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
} 