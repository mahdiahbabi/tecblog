import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecblog/controller/ArticleInfoController.dart';
import 'package:tecblog/controller/HomeScreenController.dart';
import 'package:tecblog/view/ArticleInfo.dart';
import 'package:tecblog/view/ArticlePage.dart';
import '../component/my_colors.dart';
import '../component/my_component.dart';
import '../component/my_string.dart';
import '../gen/assets.gen.dart';
import '../model/fake_data.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  ArticleInfoController articleInfoController = Get.put(ArticleInfoController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            HomePagePoster(context),
            const SizedBox(
              height: 16,
            ),
            HomePageTagList(),
            const SizedBox(
              height: 32,
            ),
            SeeMoreBlog(),
            HomePageBlogList(),
            const SizedBox(
              height: 32,
            ),
            SeeMorePodcast(),
            PodcastList(),
            const SizedBox(
              height: 60,
            )
          ],
        ),
      ),
    );
  }

  Widget PodcastList() {
    return SizedBox(
      height: size.height / 3.5,
      child: ListView.builder(
          itemCount: homeScreenController.topPodcastsList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            //podcast item
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
              child: Obx(
                () => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                          height: size.height / 5.3,
                          width: size.width / 2.4,
                          child: cached_network_spinkit(
                              homeScreenController
                                  .topPodcastsList[index].poster!,
                              false, GradiantColors.blogPost)),
                    ),
                    SizedBox(
                        width: size.width / 2.4,
                        child: Text(
                          homeScreenController.topPodcastsList[index].title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ))
                  ],
                ),
              ),
            );
          })),
    );
  }

  Widget SeeMorePodcast() {
    return Padding(
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
    );
  }

  Widget HomePagePoster(context) {
    return Obx(
      () => Container(
        height: 250,
        width: MediaQuery.of(context).size.width-20,


        child: Stack(

          children: [
cached_network_spinkit(homeScreenController.poster.value.image!, true,GradiantColors.blogPost),
            Positioned(
              bottom: 8,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                    homeScreenController.poster.value.title!,
                    style: textTheme.headline1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget HomePageTagList() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.tagsList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 8, index == 0 ? bodyMargin : 15, 8),
              child: MainTags(
                textTheme: textTheme,
                index: index,
              ),
            );
          })),
    );
  }

  Widget SeeMoreBlog() {
    return Padding(
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
          InkWell(
            onTap: () => Get.to(() => ArticlePage()),
            child: Text(
              MyStrings.viewHotestBlog,
              style: textTheme.headline3,
            ),
          )
        ],
      ),
    );
  }

  Widget HomePageBlogList() {
    return SizedBox(
      height: size.height / 3.2,
      child: ListView.builder(
          itemCount: homeScreenController.topVisitedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            //blog item
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodyMargin : 15),
              child: GestureDetector(
                onTap: () {
                  articleInfoController.id.value = homeScreenController.topPodcastsList.value[index].id!;
                  articleInfoController.getArticleInfo(  articleInfoController.id.value );
                  Get.to(ArticleInfo());
                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: size.height / 5.3,
                        width: size.width / 2.4,
                        child: Obx(
                          () => Stack(
                            children: [
                              cached_network_spinkit(
                                  homeScreenController
                                      .topVisitedList[index].image!,
                                  true,GradiantColors.blogPost),
                              Positioned(
                                bottom: 8,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      homeScreenController
                                          .topVisitedList[index].author!,
                                      style: textTheme.subtitle1,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          homeScreenController
                                              .topVisitedList[index].view!,
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
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                        width: size.width / 2.4,
                        child: Text(
                          homeScreenController.topVisitedList[index].title!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ))
                  ],
                ),
              ),
            );
          })),
    );
  }
}
