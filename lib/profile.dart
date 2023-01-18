import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'gen/assets.gen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      backgroundColor:themeData.colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: themeData.colorScheme.background.withOpacity(0),
        title: const Text('Profile'),
        actions:  [
         IconButton(onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded)),
          const SizedBox(width: 16,),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
     cardBioGraghi(themeData),
        ],
      ),
    );
  }

  Container cardBioGraghi(ThemeData themeData) {
    return Container(
     margin:  EdgeInsets.fromLTRB(32, 0, 32, 32),
     padding: EdgeInsets.fromLTRB(32, 24, 32, 32),
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(16),
       color: themeData.colorScheme.surface,
       boxShadow: [
         BoxShadow(
           blurRadius: 20,
           color: themeData.colorScheme.onBackground.withOpacity(0.1),
         ),
       ]
     ),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Row(
           children: [
             ClipRRect(
                 borderRadius: BorderRadius.circular(12),
                 child: Assets.img.stories.story8.image(width: 84, height: 84)),
             const SizedBox(width: 16,),
             Expanded(
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                  const Text('@joviedan'),
                   const SizedBox(height: 4,),
                  Text('jovi Daniel', style: themeData.textTheme.bodyText1!.copyWith( fontSize: 16,fontWeight: FontWeight.w700),),
                    const SizedBox(height: 8,),
                   Text('UX Designer',
                     style: themeData.textTheme.bodyText1!.apply(color: themeData.colorScheme.primary),),
               ],),
             ),
           ],
         ),
         const SizedBox(height: 24,),
         Text('About me', style: themeData.textTheme.headline6,),
         const SizedBox(height: 4,),
          Text('Madison Blackstone is a director of user experience design, with experience managing global teams.',
          ),
       ],
     ),
   );
  }
}
