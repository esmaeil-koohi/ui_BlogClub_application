import 'package:flutter/material.dart';
import 'package:ui_blog_club/home.dart';

import 'gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeData.colorScheme.background.withOpacity(0),
        title: const Text('Profile'),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded)),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body:
         SingleChildScrollView(
           physics: const BouncingScrollPhysics(),
           child:  Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Stack(
               children: [
                 cardBiography(themeData),
                 lowerShadow(themeData),
                 boxShowingTheNumberOfPostAndFollowerAndFollowing(themeData),
               ],
             ),
             const SizedBox(height: 10,),
             posts(themeData),
           ],
         ),),
    );
  }

  Container posts(ThemeData themeData) {
    return Container(
             decoration: BoxDecoration(
               color: themeData.colorScheme.surface,
               borderRadius: const BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
             ),
             child: Column(
               children: [
                 Padding(padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                   child:Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Expanded(
                         child: Text(
                           'My Posts',
                           style: themeData.textTheme.headline6,
                         ),
                       ),
                       IconButton(
                         onPressed: () {},
                         icon: Assets.img.icons.grid.svg(),
                       ),
                       IconButton(
                         onPressed: () {},
                         icon: Assets.img.icons.table.svg(),
                       ),
                     ],
                   ),
                 ),
                 const PostList(),
               ],
             ),
           );
  }

  Widget lowerShadow(ThemeData themeData) {
    return Positioned(
                bottom: 32,
                left: 96,
                right: 96,
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 30,
                        color: themeData.colorScheme.onBackground.withOpacity(0.8),
                      ),
                    ]
                  ),
                ));
  }

  Widget boxShowingTheNumberOfPostAndFollowerAndFollowing(ThemeData themeData) {
    return Positioned(
                bottom: 32,
                left: 64,
                right: 64,
                child: Container(
                  height: 68,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child:Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff2151CD),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: _itemShowingTheNumberOfPostAndFollowerAndFollowing(themeData, '52', 'Post'),
                      ),),
                      Expanded(flex: 1, child:_itemShowingTheNumberOfPostAndFollowerAndFollowing(themeData, '250', 'Following'),),
                      Expanded(flex: 1, child:_itemShowingTheNumberOfPostAndFollowerAndFollowing(themeData, '4.5K', 'Followers'),),
                    ],
                  ),
                ));
  }

  Widget _itemShowingTheNumberOfPostAndFollowerAndFollowing(ThemeData themeData , String count, String title) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            count,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: themeData.colorScheme.onPrimary),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: themeData.textTheme.bodyText1!.copyWith(
                color: themeData.colorScheme.onPrimary,
                fontWeight: FontWeight.w200),
          ),
        ],
      );
  }

  Widget cardBiography(ThemeData themeData) {
    return Container(
      margin: const EdgeInsets.fromLTRB(32, 10, 32, 64),
      padding: const EdgeInsets.fromLTRB(32, 24, 32, 32),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: themeData.colorScheme.surface,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: themeData.colorScheme.onBackground.withOpacity(0.1),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child:
                      Assets.img.stories.story8.image(width: 84, height: 84)),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('@joviedan'),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      'jovi Daniel',
                      style: themeData.textTheme.bodyText1!
                          .copyWith(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'UX Designer',
                      style: themeData.textTheme.bodyText1!
                          .apply(color: themeData.colorScheme.primary),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Text(
            'About me',
            style: themeData.textTheme.headline6,
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            'Madison Blackstone is a director of user experience design, with experience managing global teams.',
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }

}
