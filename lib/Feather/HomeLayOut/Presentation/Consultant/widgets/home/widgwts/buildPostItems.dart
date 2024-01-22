import 'package:flutter/material.dart';

buildPostItems() {
  return Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    margin: const EdgeInsets.symmetric(horizontal: 8.0),
    elevation: 20.0,
    child: Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                "{post?.image}",
              ),
              radius: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "{post?.name}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      const CircleAvatar(
                        radius: 8,
                        child: Icon(
                          Icons.done_rounded,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  // Text(
                  //   "${post!.dateTime?.substring(0, 10)}",
                  //   style: const TextStyle(fontSize: 12, color: Colors.black38),
                  // ),
                ],
              ),
            ),
            PopupMenuButton<String>(
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
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: SizedBox(
            width: double.infinity,
            child: Text(
              "{post.text}",
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 14,
                height: 1.2,
                textBaseline: TextBaseline.ideographic,
              ),
            ),
          ),
        ),
        // if (post.postImage != "")
        Container(
          width: double.infinity,
          height: 220,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "{post.postImage}",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Container(
          width: double.infinity,
          height: 1,
          color: Colors.black38.withOpacity(0.2),
        ),
      ],
    ),
  );
}
