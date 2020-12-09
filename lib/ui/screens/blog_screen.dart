import 'package:flutter/material.dart';
import 'package:newsapp/logic/models/blogResponse.dart';
import 'package:newsapp/ui/widgets/app_bar.dart';
import 'package:newsapp/ui/widgets/blogCard.dart';
import 'package:newsapp/viewmodels/blogViewModel.dart';
import 'package:provider/provider.dart';

class BlogScreen extends StatefulWidget {
  @override
  _BlogScreenState createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  List<NewsList> newsLists = List();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<BlogViewModel>(context, listen: false).blogState();
    });
  }

  @override
  Widget build(BuildContext context) {
    BlogViewModel blogViewModel = Provider.of<BlogViewModel>(context);
    newsLists = blogViewModel.blogResponses;

    return Scaffold(
        appBar: normalAppBar(),
        body: blogViewModel.getBlogState == BlogState.Busy
            ? Center(child: CircularProgressIndicator())
            : Container(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: newsLists.length,
                    itemBuilder: (context, i) {
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: BlogCard(
                          topic: newsLists[i].topic,
                          body: newsLists[i].body,
                        ),
                      );
                    }),
              ));
  }
}
