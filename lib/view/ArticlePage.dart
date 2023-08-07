
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tecblog/component/my_component.dart';
import 'package:tecblog/component/my_string.dart';
import 'package:tecblog/controller/ArticleInfoController.dart';
import 'package:tecblog/controller/ArticlePageController.dart';
import 'package:tecblog/view/ArticleInfo.dart';

import '../component/my_colors.dart';

class ArticlePage extends StatefulWidget {
  ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  ArticlePageController articlePageController =
      Get.put(ArticlePageController());
  ArticleInfoController articleInfoController =
      Get.put(ArticleInfoController());

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_outlined)),
            const Expanded(child: SizedBox()),
            Text(MyStrings.articleappbar, style: theme.textTheme.subtitle1),
          ],
        ),
      ),
      body: SizedBox(
        child: Obx(
          () => !articlePageController.loading.value
              ? ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: articlePageController.articleList.length,
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: (()  {
                        articleInfoController.id.value=articlePageController.articleList.value[index].id!;
                        Get.to(ArticleInfo());
                      }),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: Get.height / 6,
                              width: Get.width / 3,
                              child: CachedNetworkImage(
                                imageUrl: articlePageController
                                    .articleList[index].image!,
                                imageBuilder: (((context, imageProvider) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover)),
                                  );
                                })),
                                placeholder: ((context, url) {
                                  return spinkit(Colors.pink);
                                }),
                                errorWidget: ((context, url, error) {
                                  return Icon(
                                      Icons.image_not_supported_outlined,
                                      size: 15,
                                      color: SolidColors.primeryColor);
                                }),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: Get.width / 2,
                                    child: Text(
                                      articlePageController
                                          .articleList[index].title!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  ),
                                  Container(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        articlePageController
                                                .articleList[index].author! +
                                            '  بازدید :',
                                        style: theme.textTheme.bodySmall,
                                      ),
                                      Container(
                                        width: 10,
                                      ),
                                      Text(
                                        articlePageController
                                            .articleList[index].view!,
                                        style: theme.textTheme.bodySmall,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                )
              : spinkit(Colors.pink),
        ),
      ),
    );
  }
}
