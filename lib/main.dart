// ignore_for_file: sort_child_properties_last
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_blog_club/article.dart';
import 'package:ui_blog_club/profile.dart';


import 'home.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const defaultFontFamily = 'Avenir';

  @override
  Widget build(BuildContext context) {
    const primaryTextColor = Color(0xff0D253C);
    const secondaryTextColor = Color(0xff2D4379);
    const primaryColor = Color(0xff376AED);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: primaryTextColor,
          elevation: 0,
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: primaryColor,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: defaultFontFamily),
            ),
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: primaryColor,
          onPrimary: Colors.white,
          onSurface: primaryTextColor,
          surface: Colors.white,
          background: Color(0xffFBFCFF),
          onBackground: primaryTextColor,
        ),
        textTheme: const TextTheme(
            subtitle1: TextStyle(
              fontFamily: defaultFontFamily,
              color: secondaryTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w200,
            ),
            subtitle2: TextStyle(
              fontFamily: defaultFontFamily,
              color: primaryTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            headline4: TextStyle(
              fontFamily: defaultFontFamily,
              fontSize: 24,
              color: primaryTextColor,
              fontWeight: FontWeight.w700,
            ),
            headline5: TextStyle(
              fontFamily: defaultFontFamily,
              fontSize: 20,
              color: primaryTextColor,
              fontWeight: FontWeight.w700,
            ),
            caption: TextStyle(
              fontFamily: defaultFontFamily,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: Color(0xff7B8BB2),
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
            ),
            bodyText1: TextStyle(
              fontFamily: defaultFontFamily,
              color: primaryTextColor,
              fontSize: 14,
            )
        ),
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
   MainScreen({Key? key}) : super(key: key);


  @override
  State<MainScreen> createState() => _MainScreenState();
}
const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _BottomNavigation(
      selectedIndex: selectedScreenIndex,
      onTap: (index){
        setState(() {
          selectedScreenIndex = index;
        });
      }),
      body: IndexedStack(
        index: selectedScreenIndex,
        children: [
          HomeScreen(),
          ArticleScreen(),
          SearchScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}


class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text(
        'Search Screen',
      style: Theme.of(context).textTheme.headline4 ,
    ));
  }
}



class _BottomNavigation extends StatelessWidget {
  final Function(int index) onTap;
  final int selectedIndex;
   _BottomNavigation({Key? key, required this.onTap, required this.selectedIndex}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 65,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _bottomNavigationItem(context, 'Home.png', 'Home.png', 'Home', () {
                  onTap(homeIndex);
                  },selectedIndex == homeIndex ?true : false),
                  _bottomNavigationItem(context, 'Articles.png', 'Article.png', 'Article', () {
                  onTap(articleIndex);
                  },selectedIndex == articleIndex ?true : false),
                  const SizedBox(width: 8,),
                  _bottomNavigationItem(context, 'Search.png', 'Search.png', 'Search', () {
                    onTap(searchIndex);
                  },selectedIndex == searchIndex ?true : false),
                  _bottomNavigationItem(context, 'Menu.png', 'Menu.png', 'Menu', () {
                    onTap(menuIndex);
                  },selectedIndex == menuIndex ?true : false),
                ],
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(bottom: 15.0),
              child: Image.asset('assets/img/icons/plus.png'),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.5),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 20,
                    color: Color(0xaa9B8487),
                  )
                ],
                color: const Color(0xff376AED),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationItem(
      BuildContext context,
      String iconFileName,
      String activeIconFileName,
      String title,
      Function() onTap,
      bool isActive,
      ) {
    final ThemeData themeData = Theme.of(context);
    return InkWell(
         onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/img/icons/$iconFileName',
          color: isActive? themeData.colorScheme.primary : Colors.grey,),
          const SizedBox(height: 4,),
          Text(
            title,
            style: Theme.of(context).textTheme.caption!.apply(
             color: isActive?themeData.colorScheme.primary :themeData.textTheme.caption!.color),),
        ],
      ),
    );
  }


}
