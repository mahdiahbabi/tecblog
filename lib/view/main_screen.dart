import 'package:flutter/material.dart';

import '../gen/assets.gen.dart';
import '../model/fake_data.dart';

import '../my_colors.dart';
import '../my_string.dart';

final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return SafeArea(
      child: Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 13,right: 13),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () => _scaffoldkey.currentState!.openDrawer(),
                    color: Colors.black,
                  ),
          
                  Image(
                    image: Assets.images.logo.image().image,
                    height: size.height / 13.6,
                  ),
          
                  const Icon(Icons.search, color: Colors.black),
              ],
            ),
          ),
          backgroundColor: SolidColors.scafoldBg,
         
        ),
        drawer: const Drawer(
          backgroundColor: Colors.amber,
          child: Text('heelo'),
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Column(
                  children: [
                    //poster
                    Stack(
                      children: [
                        Container(
                          width: size.width / 1.25,
                          height: size.height / 4.2,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              image: DecorationImage(
                                  image: AssetImage(
                                      homePagePosterMap["imageAsset"]),
                                  fit: BoxFit.cover)),
                          foregroundDecoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              gradient: LinearGradient(
                                colors: GradiantColors.homePosterCoverGradiant,
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              )),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 0,
                          right: 0,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    homePagePosterMap["writer"] +
                                        " - " +
                                        homePagePosterMap["date"],
                                    style: textTheme.subtitle1,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        homePagePosterMap["view"],
                                        style: textTheme.subtitle1,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      const Icon(
                                        Icons.remove_red_eye_sharp,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                "دوازده قدم برنامه نویسی یک دوره ی...س",
                                style: textTheme.headline1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                    const SizedBox(
                      height: 16,
                    ),
                    //tag list
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: tagList.length,
                          itemBuilder: ((context, index) {
                            return Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0, 8, index == 0 ? bodyMargin : 15, 8),
                              child: Container(
                                height: 60,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(24)),
                                  gradient: LinearGradient(
                                      colors: GradiantColors.tags,
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft),
                                ),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(16, 8, 8, 8),
                                  child: Row(
                                    children: [
                                      ImageIcon(
                                        Assets.icons.hashtagicon.image().image,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                      const SizedBox(
                                        width: 8,
                                      ),
                                      Text(
                                        tagList[index].title,
                                        style: textTheme.headline2,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          })),
                    ),
                    const SizedBox(
                      height: 32,
                    ),

                    //see more
                    Padding(
                      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
                      child: Row(
                        children: [
                          ImageIcon(
                            Assets.icons.bluePen.image().image,
                            color: SolidColors.seeMore,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            MyStrings.viewHotestBlog,
                            style: textTheme.headline3,
                          )
                        ],
                      ),
                    ),

                    //blog lis
                    SizedBox(
                      height: size.height / 3.5,
                      child: ListView.builder(
                          itemCount: blogList.getRange(0, 5).length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            //blog item
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: index == 0 ? bodyMargin : 15),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: size.height / 5.3,
                                      width: size.width / 2.4,
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(16)),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      blogList[index].imageUrl),
                                                  fit: BoxFit.cover),
                                            ),
                                            foregroundDecoration:
                                                const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(16)),
                                              gradient: LinearGradient(
                                                  begin: Alignment.bottomCenter,
                                                  end: Alignment.topCenter,
                                                  colors:
                                                      GradiantColors.blogPost),
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 8,
                                            left: 0,
                                            right: 0,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  blogList[index].writer,
                                                  style: textTheme.subtitle1,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      blogList[index].views,
                                                      style:
                                                          textTheme.subtitle1,
                                                    ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    const Icon(
                                                      Icons
                                                          .remove_red_eye_sharp,
                                                      color: Colors.white,
                                                      size: 16,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width: size.width / 2.4,
                                      child: Text(
                                        blogList[index].title,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ))
                                ],
                              ),
                            );
                          })),
                    ),

                    const SizedBox(
                      height: 32,
                    ),
                    //see more
                    Padding(
                      padding: EdgeInsets.only(right: bodyMargin, bottom: 8),
                      child: Row(
                        children: [
                          ImageIcon(
                            Assets.icons.microphon.image().image,
                            color: SolidColors.seeMore,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            MyStrings.viewHotestPodCasts,
                            style: textTheme.headline3,
                          )
                        ],
                      ),
                    ),

                    //podcast list
                    SizedBox(
                      height: size.height / 3.5,
                      child: ListView.builder(
                          itemCount: podcastList.getRange(0, 5).length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: ((context, index) {
                            //podcast item
                            return Padding(
                              padding: EdgeInsets.only(
                                  right: index == 0 ? bodyMargin : 15),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      height: size.height / 5.3,
                                      width: size.width / 2.4,
                                      child: Stack(
                                        children: [
                                          Container(
                                              decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(16)),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    podcastList[index]
                                                        .imageUrl),
                                                fit: BoxFit.cover),
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width: size.width / 2.4,
                                      child: Text(
                                        podcastList[index].title,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ))
                                ],
                              ),
                            );
                          })),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
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
                  padding: const EdgeInsets.only(right: 8, left: 8),
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
                            onPressed: (() {}),
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
                            onPressed: (() {}),
                            icon: ImageIcon(
                              Assets.icons.user.image().image,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
