import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_blog_club/gen/assets.gen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int signUpTab = 1;
  int selectionTabIndex = loginTab;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tabTextTitle = TextStyle(
      color: themeData.colorScheme.onPrimary,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 32, top: 32),
              child: Assets.img.icons.logo.svg(width:120),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                            setState(() {
                              selectionTabIndex = loginTab;
                            });
                          }, child: Text('LOGIN', style: tabTextTitle.apply(
                              color: selectionTabIndex == loginTab ? Colors.white : Colors.white54
                          )),),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectionTabIndex = signUpTab;
                              });
                          }, child: Text('SIGN UP', style: tabTextTitle.apply(
                              color: selectionTabIndex == signUpTab ? Colors.white : Colors.white54
                          )),),

                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: themeData.colorScheme.surface,
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32)),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(32,48,32,32),
                              child: selectionTabIndex == loginTab? _login(themeData) : signUp(themeData),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _login(ThemeData themeData){
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:  [
        Text('Welcome back', style: themeData.textTheme.headline4,),
        const SizedBox(height: 8,),
        Text('Sign in with your account',
            style: themeData.textTheme.subtitle1!.apply(fontSizeFactor: 0.80)),
        const SizedBox(height: 16,),
        usernameAndFullnameTextField('Username'),
         _passwordTextField(),
        const SizedBox(
          height: 24,
        ),
        _confirmInformationButton('LOGIN'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Forget your password?'),
            const SizedBox(width: 8,),
            TextButton(onPressed: () {}, child: const Text('Reset here'),),
          ],
        ),
        const SizedBox(height: 16,),
        const Center(child: Text('OR SING IN WITH', style:TextStyle(letterSpacing: 2),),),
        const SizedBox(height: 16,),
        _logos(),
      ],
    );
  }

  Widget usernameAndFullnameTextField(String nameTextField) {
    return TextField(
        decoration: InputDecoration(
          label: Text(nameTextField),
        ),
      );
  }

  Widget _logos() {
    return Row(
        mainAxisAlignment:MainAxisAlignment.center ,
        children: [
          Assets.img.icons.google.image(width: 36, height: 36),
          const SizedBox(width: 24,),
          Assets.img.icons.facebook.image(width: 36, height: 36),
          const SizedBox(width: 24,),
          Assets.img.icons.twitter.image(width: 36, height: 36),
        ],
      );
  }

  Widget _confirmInformationButton(String buttonName) {
    return ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              Size(MediaQuery.of(context).size.width, 60),
            ),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)))),
        child: Text(
          buttonName
        ),
      );
  }

  Widget _passwordTextField(){
    bool obscureText = true;
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        label: const Text('Password'),
        suffix: InkWell(onTap: () {
          setState(() {
            obscureText = !obscureText;
          });
        }, child:Text( obscureText? 'show' : 'hide',
          style: TextStyle(fontSize: 14,
              color: Theme.of(context).colorScheme.primary),)),
      ),
    );
  }

 Widget signUp(ThemeData themeData){
   return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children:  [
       Text('Welcome to clog club', style: themeData.textTheme.headline4,),
       const SizedBox(height: 8,),
       Text('please enter your information',
           style: themeData.textTheme.subtitle1!.apply(fontSizeFactor: 0.80)),
       const SizedBox(height: 16,),
       usernameAndFullnameTextField('Fullname'),
       usernameAndFullnameTextField('Username'),
       _passwordTextField(),
       const SizedBox(
         height: 24,
       ),
       _confirmInformationButton('SIGN IN'),
       const SizedBox(height: 16,),
       const Center(child: Text('OR SING UP WITH', style:TextStyle(letterSpacing: 2),),),
       const SizedBox(height: 16,),
       _logos(),
     ],
   );
 }

}



