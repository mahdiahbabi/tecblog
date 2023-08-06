import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tecblog/component/my_string.dart';
import 'package:tecblog/controller/HomeScreenController.dart';
import 'package:tecblog/service/DioServise.dart';
import 'package:tecblog/view/profile_screen.dart';

import '../component/my_colors.dart';
import '../component/my_component.dart';
import '../gen/assets.gen.dart';
import 'home_screen.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  RxInt selectedPageIndex = 0.obs;
  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    DioService().getHomePageBlog(
        "https://techblog.sasansafari.com/Techblog/api/home/?command=index");

    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;
    return Obx(
      ()=>homeScreenController.loading.value == true ? spinkit(Colors.pink): SafeArea(
          child: Scaffold(
                  key: _key,
                  drawer: Drawer(
                    backgroundColor: SolidColors.scafoldBg,
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: bodyMargin, left: bodyMargin),
                      child: ListView(
                        children: [
                          DrawerHeader(
                              child: Center(
                            child: Image.asset(
                              Assets.images.logo.path,
                              scale: 3,
                            ),
                          )),
                          ListTile(
                            title: Text(
                              "پروفایل کاربری",
                              style: textTheme.headline4,
                            ),
                            onTap: () {},
                          ),
                          const Divider(
                            color: SolidColors.dividerColor,
                          ),
                          ListTile(
                            title: Text(
                              "درباره تک‌بلاگ",
                              style: textTheme.headline4,
                            ),
                            onTap: () {},
                          ),
                          const Divider(
                            color: SolidColors.dividerColor,
                          ),
                          ListTile(
                            title: Text(
                              "اشتراک گذاری تک بلاگ",
                              style: textTheme.headline4,
                            ),
                            onTap: () async {
                              await Share.share(MyStrings.share);
                            },
                          ),
                          const Divider(
                            color: SolidColors.dividerColor,
                          ),
                          ListTile(
                            title: Text(
                              "تک‌بلاگ در گیت هاب",
                              style: textTheme.headline4,
                            ),
                            onTap: () {
                              gitHubUrl(MyStrings.githuburl);
                            },
                          ),
                          const Divider(
                            color: SolidColors.dividerColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    elevation: 0,
                    backgroundColor: SolidColors.scafoldBg,
                    title: //appbar
                        Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: (() {
                            _key.currentState!.openDrawer();
                          }),
                          child: const Icon(
                            Icons.menu,
                            color: Colors.black,
                          ),
                        ),
                        Image(
                          image: Assets.images.logo.image().image,
                          height: size.height / 13.6,
                        ),
                        const Icon(Icons.search, color: Colors.black),
                      ],
                    ),
                  ),
                  body: Stack(
                    children: [
                      Positioned.fill(child:  IndexedStack(
                          index: selectedPageIndex.value,
                          children: [
                            HomeScreen(
                                size: size,
                                textTheme: textTheme,
                                bodyMargin: bodyMargin), //0
                            const ProfileScreen() //1
                          ],
                        )

  ),

                      BottomNavigation(
                        size: size,
                        bodyMargin: bodyMargin,
                        changeScreen: (int value) {
                          selectedPageIndex.value = value;
                        },
                      ),
                    ],
                  ),
                )),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  }) : super(key: key);

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 8,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradiantColors.bottomNavBackgroand,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              gradient: LinearGradient(
                colors: GradiantColors.bottomNav,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: (() => changeScreen(0)),
                    icon: ImageIcon(
                      Assets.icons.home.image().image,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: (() {}),
                    icon: ImageIcon(
                      Assets.icons.write.image().image,
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: (() => changeScreen(1)),
                    icon: ImageIcon(
                      Assets.icons.user.image().image,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
