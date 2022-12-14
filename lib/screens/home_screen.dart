import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:store/inner_screens/feeds_screen.dart';
import 'package:store/inner_screens/on_sale_screen.dart';
import 'package:store/provider/dark_theme_provider.dart';
import 'package:store/services/global_methods.dart';
import 'package:store/services/utils.dart';
import 'package:store/widgets/feed_items.dart';
import 'package:store/widgets/on_sale_widget.dart';
import 'package:store/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<String> _offerImages = [
    'assets/images/offers1.jpg',
    'assets/images/offers2.jpg',
    'assets/images/offers3.jpg',
    'assets/images/offers4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = utils.getTheme;
    final Color color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height *0.33,
                child: Swiper(
              itemBuilder: (BuildContext context,int index){
            return Image.asset(_offerImages[index],fit: BoxFit.fill,);
    },
    autoplay: true,
    itemCount: _offerImages.length,
    pagination: const SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
                color: Colors.white,activeColor: Colors.red)),
                  //control: const SwiperControl(color: Colors.black26),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            TextButton(
                onPressed: (){
                  GlobalMethods.navigateTo(
                        ctx: context,
                        routeName: OnSaleScreen.routeName);
                },
                child: TextWidget(
                  text: 'View all',
                  maxLines: 1,
                  color: Colors.blue,
                  textSize: 20,
                ),
            ),
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(children: [
                    TextWidget(
                      text: 'On Sale'.toUpperCase(),
                      color: Colors.red,
                      textSize: 22,
                      isTitle: true,
                      ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      IconlyLight.discount,
                      color: Colors.red,
                    ),
                  ],
              ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height*0.24,
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) {
                      return const OnSaleWidget();
                    }),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                TextWidget(text: 'Our products', color: color, textSize: 22, isTitle: true,),
                const Spacer(),
                TextButton(
                  onPressed: (){
                    GlobalMethods.navigateTo(
                        ctx: context,
                        routeName: FeedsScreen.routeName);
                  },
                  child: TextWidget(
                    text: 'Browse all',
                    maxLines: 1,
                    color: Colors.blue,
                    textSize: 20,
                  ),
                ),
              ],
            ),
          ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              padding: EdgeInsets.zero,
              childAspectRatio: size.width / (size.height * 0.59),
              children: List.generate(4, (index) {
                return const FeedsWidget();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
