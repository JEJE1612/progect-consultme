import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/Model/rating_model.dart';

class EditRate extends StatelessWidget {
  const EditRate({super.key, required this.rate});
  final RatingModel rate;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 'update',
          child: Row(
            children: [
              Icon(Icons.edit),
              SizedBox(width: 5),
              Text('Update'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 'remove',
          child: Row(
            children: [
              Icon(Icons.delete),
              SizedBox(width: 5),
              Text('Remove'),
            ],
          ),
        ),
      ],
      onSelected: (value) {
        // Handle selection here
        if (value == 'update') {
        } else if (value == 'remove') {}
      },
    );
  }
}