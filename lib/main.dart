import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/inner_screens/feeds_screen.dart';
import 'package:store/inner_screens/on_sale_screen.dart';
import 'package:store/screens/btm_bar.dart';
import 'package:store/consts/theme_data.dart';
import 'package:store/screens/home_screen.dart';
import 'package:store/provider/dark_theme_provider.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
 const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  void getCurrentAppTheme()async {
    themeChangeProvider.setDarkTheme=
      await themeChangeProvider.darkThemePrefs.getTheme();
  }

  @override
  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_){
          return themeChangeProvider;
        })
      ],
      child:
      Consumer<DarkThemeProvider>(builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themeProvider.getDarkTheme, context),
            home: const BottomBarScreen(),
            routes: {
              OnSaleScreen.routeName: (ctx) => const OnSaleScreen(),
              FeedsScreen.routeName: (ctx) => const FeedsScreen(),
            });
        }),
    );
  }
}

