import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_blog_club/gen/assets.gen.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: themeData.colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 32),
                child: Assets.img.background.onboarding.image(),
              ),
            ),
            Container(
              height: 324,
              child: Column(
                children: [
                Container(
                  height: 60,
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            )
                          )
                        ),
                        child: const Icon(CupertinoIcons.arrow_right),
                      )
                    ],
                  ),
                )
                ],
              ),
              decoration: BoxDecoration(
                color: themeData.colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ],
                borderRadius: const BorderRadius.only(topRight: Radius.circular(32), topLeft: Radius.circular(32)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
