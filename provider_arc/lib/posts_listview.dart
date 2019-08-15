import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_contstants.dart';
import 'user.dart';
import 'posts_model.dart';
import 'base_widget.dart';
import 'postlist_item.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _makeListViewFilledStackWay(context);
  }
  _makeListViewFilledStackWay(BuildContext context) =>
    BaseWidget<PostsModel>(
      model: PostsModel(api: Provider.of(context)),
      onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
      builder: (context, model, child) => model.busy
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: model.posts.length,
            itemBuilder: (context, index) => PostListItem(
              post: model.posts[index],
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RoutePaths.Post,
                  arguments: model.posts[index],
                );
              },
            ),
          ));

}
