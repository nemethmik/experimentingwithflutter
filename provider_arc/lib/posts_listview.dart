import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_contstants.dart';
import 'user.dart';
import 'posts_model.dart';
import 'base_widget.dart';
import 'postlist_item.dart';

class PostingListView extends StatefulWidget {
  final Widget Function(BuildContext context, PostsModel model, Widget child) builder;
  final PostsModel model;
  final Widget child;
  final Function(PostsModel) onModelReady;
  PostingListView({Key key,this.builder,this.model,this.child,this.onModelReady,}) : super(key: key);
  _PostingListViewState createState() => _PostingListViewState();
}

class _PostingListViewState extends State<PostingListView> {
  // PostsModel model;
  @override
  void initState() {
    // model = widget.model;
    if (widget.onModelReady != null) {
      widget.onModelReady(widget.model);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PostsModel>(
      builder: (context) => widget.model,
      child: Consumer<PostsModel>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}

class PostsListView extends StatelessWidget {
  const PostsListView({Key key}) : super(key: key);
  _makeListViewDirectWay(BuildContext context) =>
    PostingListView(
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

  @override
  Widget build(BuildContext context) {
    return _makeListViewDirectWay(context);
//    return _makeListViewFilledStackWay(context);
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
