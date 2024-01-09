import 'package:flutter/material.dart';
import 'package:konsultanku/widget/appBar.dart';

class CreatePost extends StatefulWidget {
  const CreatePost({Key? key}) : super(key: key);

  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CircleAvatar(
              // Your CircleAvatar here
            ),
            SizedBox(height: 20),
            TextField(
              controller: _descriptionController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle post creation functionality here
                final description = _descriptionController.text;
                final category = _categoryController.text;
                // Perform actions with the description and category
              },
              child: Text('Create Post'),
            ),
          ],
        ),
      ),
    );
  }
}

