import 'package:flutter/material.dart';

class BlogCard extends StatelessWidget {
  final String topic, body;

  const BlogCard({Key key, @required this.topic, @required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                topic,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              body,
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
