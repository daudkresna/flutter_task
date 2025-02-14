import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String index;
  final String title;
  final String body;
  const PostCard({
    super.key,
    required this.title,
    required this.body,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        tileColor: Colors.grey[300],
        title: Text(
          '$index. $title',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        subtitle: Text(body),
      ),
    );
  }
}
