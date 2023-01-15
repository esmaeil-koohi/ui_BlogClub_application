// ignore_for_file: sort_child_properties_last

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_blog_club/carousel/carousel_slider.dart';
import 'package:ui_blog_club/data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const defaultFontFamily = 'Avenir';

  @override
  Widget build(BuildContext context) {
    final primaryTextColor = Color(0xff0D253C);
    final secondaryTextColor = Color(0xff2D4379);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: TextTheme(
            subtitle1: TextStyle(
              fontFamily: defaultFontFamily,
              color: secondaryTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w200,
            ),
            headline4: TextStyle(
              fontFamily: defaultFontFamily,
              fontSize: 24,
              color: primaryTextColor,
              fontWeight: FontWeight.w700,
            ),
            headline6: TextStyle(
              fontFamily: defaultFontFamily,
              fontWeight: FontWeight.bold,
              color: primaryTextColor,
              fontSize: 18,
            ),
            bodyText2: TextStyle(
              fontFamily: defaultFontFamily,
              color: secondaryTextColor,
              fontSize: 14,
            )),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, Jonathan!',
                      style: themeData.textTheme.subtitle1,
                    ),
                    Image.asset(
                      'assets/img/icons/notification.png',
                      width: 32,
                      height: 32,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 16),
                child: Text("Explore today's ",
                    style: themeData.textTheme.headline4),
              ),
              _storyList(context, stories),
              const SizedBox(height: 16,),
              const _CategoryList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _storyList(BuildContext context, List<StoryData> stories) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: stories.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.fromLTRB(30, 2, 30, 0),
        itemBuilder: (context, index) {
          final story = stories[index];
          return _story(story);
        },
      ),
    );
  }

  Widget _story(StoryData story) {
    return Column(
      children: [
        Stack(
          children: [
            story.isViewed
                ? _profileImageViewed(story)
                : _profileImageNormal(story),
            Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/img/icons/${story.iconFileName}',
                  width: 24,
                  height: 24,
                )),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(story.name),
      ],
    );
  }

  Widget _profileImageNormal(StoryData story) {
    return Container(
      width: 68,
      height: 68,
      margin: const EdgeInsets.fromLTRB(4, 0, 4, 0),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          gradient: LinearGradient(begin: Alignment.topLeft, colors: [
            Color(0xff376AED),
            Color(0xff49B0E2),
            Color(0xff9CECFB),
          ])),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        padding: const EdgeInsets.all(2),
        child: _profileImage(story),
      ),
    );
  }

  Widget _profileImageViewed(StoryData story) {
    return Container(
      width: 68,
      height: 68,
      padding: EdgeInsets.all(2),
      margin: EdgeInsets.fromLTRB(4, 0, 4, 0),
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        radius: const Radius.circular(24),
        color: const Color(0xff7B8BB2),
        dashPattern: [8, 3],
        padding: EdgeInsets.all(3),
        child: _profileImage(story),
      ),
    );
  }

  Widget _profileImage(StoryData story) {
    return Container(
      margin: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
      ),
      padding: const EdgeInsets.all(1),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(17),
          child: Image.asset('assets/img/stories/${story.imageFileName}')),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
        itemCount: categories.length,
        itemBuilder: (context, index, realIndex) {
          return _CategoryItem(
            category: categories[realIndex],
            leftSpace: index ==0 ? 32 : 8,
            righrSpace:  index == categories.length-1 ? 32 : 8,
          );
        },
        options: CarouselOptions(
          scrollDirection: Axis.horizontal,
          viewportFraction: 0.80,
          initialPage: 0,
          disableCenter: true,
          scrollPhysics: const BouncingScrollPhysics(),
          enableInfiniteScroll: false,
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          enlargeCenterPage: true,
          height: MediaQuery.of(context).size.height * 0.40,
        ));
  }
}

class _CategoryItem extends StatelessWidget {
  final Category category;
  final double leftSpace;
  final double righrSpace;
  const _CategoryItem({
    Key? key,
    required this.category,
    required this.leftSpace,
    required this.righrSpace
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(leftSpace, 0, righrSpace, 0),
      child: Stack(
        children: [
          Positioned.fill(
            top: 100,
            right: 65,
            left: 65,
            bottom: 16,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 20, color: Color(0xaa0D253C)),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(
                    'assets/img/posts/large/${category.imageFileName}',
                    fit: BoxFit.cover,
                  )),
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Color(0xff0D253C),
                      Colors.transparent,
                    ]),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
          Positioned(
              bottom: 35,
              left: 32,
              child: Text(
                category.title,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .apply(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
