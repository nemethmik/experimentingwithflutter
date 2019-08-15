import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user.dart';
import 'app_colors.dart';
import 'text_styles.dart';
import 'ui_helpers.dart';
import 'posts_listview.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          UIHelper.verticalSpaceLarge,
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              'Welcome ${Provider.of<User>(context).name}',
              style: headerStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text('Here are all your posts', style: subHeaderStyle),
          ),
          UIHelper.verticalSpaceSmall,
          Expanded(child: PostsListView(),)
        ],
      ),
    );
  }
}
